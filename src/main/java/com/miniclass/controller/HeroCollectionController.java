package com.miniclass.controller;

import javax.servlet.http.HttpServletRequest;

import com.miniclass.entity.Content;
import com.miniclass.entity.UserBasic;
import com.miniclass.enums.ShareTypeEnum;
import com.miniclass.service.UserBasicService;
import com.miniclass.service.UserLogService;
import com.miniclass.service.UserShareService;
import com.miniclass.util.CommonFuncUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
/**
 * Created by shuaizhiguo on 2016/12/28.
 */
@Controller
@RequestMapping("/heroCollection")
public class HeroCollectionController {

    private static Logger log = LoggerFactory.getLogger(HeroCollectionController.class);

    @Autowired
    private UserBasicService userService;
    @Autowired
    private UserShareService userShareService;
    @Autowired
    private UserLogService userLogService;


    @RequestMapping(value="/showHero")
    public ModelAndView showRank(HttpServletRequest request) {

        ModelAndView model = new ModelAndView("/heroCollection/showHero");

        String userId = CommonFuncUtil.getUserIdByCookie(request);
        UserBasic userBasic = null;
        List<Content> content4 = null;
        try{
           userBasic = userService.getUserById(userId);
            content4 = userShareService.getContentByType(4);
        }catch (Exception e){
            log.error("群英汇获取数据出现异常");
        }
        //补全信息入口 ，20170311
        if (userBasic.getLocation() == null || userBasic.getLocation().length() == 0){
            ModelAndView fill = new ModelAndView("/my/fulfillBasicInfo");

            fill.addObject("userType" , userBasic.getUserType());
            return fill;
        }

        model.addObject("userBasic", userBasic);
        model.addObject("content4", content4);
        return model;
    }

    @RequestMapping(value="/showHeroDetail")
    public ModelAndView showHeroDetail(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("/heroCollection/showHeroDetail");

        Integer id =Integer.parseInt( request.getParameter("id"));
        Integer type  =Integer.parseInt( request.getParameter("type"));

        String userId = CommonFuncUtil.getUserIdByCookie(request);
        UserBasic userBasic = null;

        Content content = null;
        try{
            content = userShareService.getContentByTypeAndItem(type, id);
            userBasic = userService.getUserById(userId);
            userLogService.logUser(userId, userBasic.getUserType(), type, id);

        } catch (Exception e){
            log.error("【群英汇获取数据出现异常】: 类型是 ："  + type + " id是 " + id);
        }

        model.addObject("content",content);
        model.addObject("title", ShareTypeEnum.getName(content.getType()));
        model.addObject("userBasic",userBasic);
        return model;
    }


    @RequestMapping(value="/showHeroList")
    public ModelAndView showHeroList(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("/heroCollection/showHeroList");

        Integer type  =Integer.parseInt( request.getParameter("type"));

        String userId = CommonFuncUtil.getUserIdByCookie(request);
        UserBasic userBasic = null;

        List<Content> content = null;
        try{
            content = userShareService.getContentByType(type);
            userBasic = userService.getUserById(userId);
        } catch (Exception e){
            log.error("【群英汇获取数据出现异常】: 类型是 ："  + type );
        }

        model.addObject("content",content);
        model.addObject("userBasic",userBasic);
        return model;
    }

}
