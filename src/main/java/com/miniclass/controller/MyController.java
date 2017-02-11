package com.miniclass.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;
import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import com.miniclass.entity.UserScoreRank;
import com.miniclass.enums.UserTypeEnum;
import com.miniclass.service.ScoreService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.google.code.kaptcha.servlet.KaptchaExtend;

import com.miniclass.vo.UserBasicVo;
import com.miniclass.entity.UserBasic;
import com.miniclass.service.UserBasicService;
import com.miniclass.vo.UserShowInfoVo;


/**
 * Created by shuaizhiguo on 2016/3/30.
 */

@Controller
@RequestMapping("/my")
public class MyController extends KaptchaExtend {


    private static final String CURRENT_USER =  ResourceBundle.getBundle("config").getString("cookie_user_name");
    private static final int LastTime = Integer.parseInt(ResourceBundle.getBundle("config").getString("cookie_last_time"));
    private static Logger log = LoggerFactory.getLogger(MyController.class);
    @Resource
    private UserBasicService userBasicService;
    @Autowired
    private ScoreService scoreService;

    /**
     * 登录界面
     */
    @RequestMapping(value="/login")
    public ModelAndView login()  {

        ModelAndView model = new ModelAndView("/my/login");

        return model;
    }

    /**
     * 注册界面
     */
    @RequestMapping(value="/regist")
    public ModelAndView regist(){

        ModelAndView model = new ModelAndView("/my/regist");

        return model;
    }

    /**
     * 选择角色
     */
    @RequestMapping(value="/chooseType")
    public ModelAndView chooseType(){

        ModelAndView model = new ModelAndView("/my/chooseType");

        return model;
    }

    /**
     * 销售选择区域页面
     */
    @RequestMapping(value="/saleLocation")
    public ModelAndView saleLocation(){

        ModelAndView model = new ModelAndView("/my/saleLocation");

        return model;
    }

    /**
     * 经销商负责区域界面
     */
    @RequestMapping(value="/dealerLocation")
    public ModelAndView dealerLocation(){

        ModelAndView model = new ModelAndView("/my/dealerLocation");

        return model;
    }

    /**
     * 选择区域界面
     */
    @RequestMapping(value = "/chooseLocation")
    public ModelAndView location(){

        ModelAndView modelAndView = new ModelAndView("/my/chooseLocation");

        return modelAndView;
    }

    /**
     * 个人界面
     */
    @RequestMapping(value="/my")
    public ModelAndView my(HttpServletRequest request)  {

        ModelAndView model = new ModelAndView("/my/my");
        HttpSession session = request.getSession();
        String userId = new String();
        userId = (String)session.getAttribute(CURRENT_USER);
        log.info("-------------------userid is " + userId);
        //String userId = this.GetUserIdByCookie(request);
        UserBasic userBasic = null;
        try{
            userBasic = this.userBasicService.getUserById(userId);
            if ( userBasic == null || userBasic.getUserId().length() == 0){
                return new ModelAndView("redirect:/my/login.j");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        UserShowInfoVo userShowInfoVo = new UserShowInfoVo();

        if (userBasic.getUserType().equals("1") || userBasic.getUserType().equals("2")){
            userShowInfoVo.setScore(scoreService.getUserScoreByUserId(userId));
        }
        userShowInfoVo.setUserNickName(userBasic.getUserNname());
        userShowInfoVo.setUserType(UserTypeEnum.getName(Integer.parseInt(userBasic.getUserType())));
        userShowInfoVo.setUserTypeEnum(userBasic.getUserType());
        log.info("用户的身份是" + userShowInfoVo.getUserType());

        model.addObject("userShowInfo",userShowInfoVo);
        model.addObject("userId",userId);
        return model;
    }
    /**
     * 生成验证码
     */
    @RequestMapping(value = "/captcha", method = RequestMethod.GET)
    public void captcha(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.captcha(req, resp);
    }

    /**
     * 验证码校验
     */
    @RequestMapping(value = "captchaCheck" , method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Integer> captchaCheck(HttpServletRequest req ) throws ServletException , IOException {

        String code = req.getParameter("code");
        Integer a = 1;
        if (code.equals(getGeneratedKey(req))) {
            a=0;
        }
        Map<String, Integer> map = new HashMap<>(1);
        map.put("success",a);

        return map;
    }

    /**
     * 登录验证
     */
    @RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
    public ModelAndView loginPost( HttpServletRequest request ,HttpServletResponse response){

        ModelAndView errorModel = new ModelAndView("my/login");

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        Integer a = new Integer(0);
        try {
            a = userBasicService.userIdExist(userId);
        }catch (Exception e){
            e.printStackTrace();
        }
        if (a == 0){
            errorModel.addObject("errorId","电话号码不存在");
        }
        String newstr = new String();
        try {
            newstr = md5Encode(password);
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        Integer b = userBasicService.userPasswordExist(newstr);
        if (b == 0 ){
            errorModel.addObject("errorNname","密码不正确");
        }
        int c = 0;
        if (b != 0){
            try {
                log.info("----------------黑名单验证 userid" + userId);
                c = this.userBasicService.useBlackList(userId);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        if (c == 1){
            errorModel.addObject("errorId","该账户已被列入黑名单，如需帮助，请联系管理员");
        }
        if ( (a == 0) || (b==0) || (c==1)){
            return errorModel;
        }
        else{

            UserBasic userBasic = new UserBasic();
            userBasic.setUserId(userId);
            this.CookieSave(userBasic,response,request);

            return new ModelAndView("redirect:/my/my.j");
        }
    }

    /**
     * 选择区域验证
     */
    @RequestMapping(value = "/locationCheck")
    public ModelAndView locationCheck(HttpServletRequest request){

        String location = request.getParameter("location");
        String userType = request.getParameter("userType");
        log.info("--------------userT" + userType);
        ModelAndView error = new ModelAndView("/my/chooseLocation");
        ModelAndView regist = new ModelAndView("/my/regist");

        if (location == null || location.length() == 0) {
            error.addObject("errorNname"," 请选择区域");
            error.addObject("userType",userType);
            return error;
        }
        else{
            regist.addObject("location",location);
            regist.addObject("userType",userType);
            return regist;
        }
    }

    /**
     * 选择身份验证
     */
    @RequestMapping(value = "/typeCheck")
    public ModelAndView typeCheck(HttpServletRequest request){

        String type = request.getParameter("type");
        ModelAndView error = new ModelAndView("/my/chooseType");
        ModelAndView location = new ModelAndView("/my/chooseLocation");
        ModelAndView regist = new ModelAndView("/my/regist");
        log.info("type is " + type);

        if (type == null || type.length() == 0) {
            error.addObject("errorNname"," 请选择身份");

            return error;
        }
        else{
            if ( type.equals("店员") || type.equals("店主")){
                int userType = 1;
                if (type.equals("店员")){
                    userType = 1;
                }else{
                    userType = 2;
                }
                location.addObject("userType",userType);
                location.addObject("location",location);

                return location;
            }
            else{
                int userType = 4;
                if (type.equals("销售")){
                    userType = 3;
                }else{
                    userType = 4;
                }
                regist.addObject("userType", userType);
                regist.addObject("regist",regist);

                return regist;
            }
        }
    }


    /**
     * 注册验证及插入数据
     */
    @RequestMapping(value = "/registCheck")
    public ModelAndView registerPost( UserBasicVo ubVo , HttpServletRequest request, HttpServletResponse response){

        ModelAndView errorModel = new ModelAndView("my/regist");

        String loca= request.getParameter("location");
        String userType = request.getParameter("userType");
        log.info("userType is " + userType);
        String[] location = loca.split(" ");
        log.info("location lenth is " + location.length);

        Integer a = userBasicService.userIdExist(ubVo.getUserId());
        if (a == 1){
            errorModel.addObject("errorId","电话号码已存在");
        }
        Integer b = userBasicService.userNnameExist(ubVo.getUserNname());
        if (b == 1 ){
            errorModel.addObject("errorNname","昵称已存在");
        }
        if ( (a == 1) || (b==1) ){
            errorModel.addObject("userType",userType);
            errorModel.addObject("location",loca);
            return errorModel;
        }
        else{
            String newstr = new String();
            try {
                newstr = md5Encode(ubVo.getPassword());
            } catch (Exception e) {
                System.out.println(e.toString());
            }
            UserBasic userBasic = new UserBasic();
            userBasic.setUserId(ubVo.getUserId());
            userBasic.setUserNname((ubVo.getUserNname()));
            userBasic.setPassword(newstr);
            userBasic.setUserType(userType);
            if (userType.equals("1") || userType.equals("2")){
                userBasic.setProvince(location[0]);
                userBasic.setCity(location[1]);
                if(location.length==3){
                    userBasic.setCounty(location[2]);
                }
            }
            try {
                userBasicService.insertNewUser(userBasic);
            }catch (Exception e){
                e.printStackTrace();
            }
            this.CookieSave(userBasic,response,request);

            return new ModelAndView("redirect:/my/my.j");
        }
    }

    /**
     * 用户退出登录
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "/loginOut")
    public ModelAndView loginOut( HttpServletRequest request, HttpServletResponse response) {

        ModelAndView modelAndView = new ModelAndView("my/loginOut");
        Cookie cookie = new Cookie(CURRENT_USER, null);
        cookie.setMaxAge(0);
        cookie.setPath(request.getContextPath());
        response.addCookie(cookie);

        return modelAndView;
    }

    @RequestMapping(value="/rank")
    public ModelAndView rank( HttpServletRequest request, HttpServletResponse response){

        ModelAndView modelAndView = new ModelAndView("my/rank");

        return modelAndView;
    }

    /**
     * MD5 生成函数
     */
    public static String md5Encode(String inStr) throws Exception {

        MessageDigest md5 = null;
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            System.out.println(e.toString());
            e.printStackTrace();
            return "";
        }
        byte[] byteArray = inStr.getBytes("UTF-8");
        byte[] md5Bytes = md5.digest(byteArray);
        StringBuffer hexValue = new StringBuffer();
        for (int i = 0; i < md5Bytes.length; i++) {
            int val = ((int) md5Bytes[i]) & 0xff;
            if (val < 16) {
                hexValue.append("0");
            }
            hexValue.append(Integer.toHexString(val));
        }
        return hexValue.toString();
    }

    /**
     * cookie保存
     * @param userBasic
     * @param response
     * @param request
     */
    public void CookieSave(UserBasic userBasic , HttpServletResponse response , HttpServletRequest request){

        Cookie cookie = new Cookie( CURRENT_USER , userBasic.getUserId() );
        cookie.setMaxAge( LastTime );
        //设置路径
        //cookie.setPath(request.getContextPath());
        //"/"这样设置保证所有页面都能得到cookie 大坑啊
        cookie.setPath("/");
        response.addCookie(cookie);
        log.info(" ---------------登录时cookies is " + cookie.toString());
    }


}


