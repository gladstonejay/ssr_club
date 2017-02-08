package com.miniclass.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.miniclass.entity.*;
import com.miniclass.service.ReviewService;
import com.miniclass.service.ScoreService;
import com.miniclass.service.UserShareService;
import com.miniclass.util.CommonFuncUtil;
import com.miniclass.util.Constant;
import com.miniclass.vo.VideoInfoVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.miniclass.service.UserBasicService;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.ResourceBundle;

/**
 * Created by shuaizhiguo on 2016/4/5.
 */

@Controller
@RequestMapping("/classLearn")
public class ClassLearnController {

    private static Logger log = LoggerFactory.getLogger(ClassLearnController.class);
    private static final String CURRENT_USER =  ResourceBundle.getBundle("config").getString("cookie_user_name");
    @Resource
    private UserBasicService userService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private UserShareService userShareService;
    @Autowired
    private ScoreService scoreService;

    /**6
     * 本月课程列表
     */
    @RequestMapping(value="/showUserClass")
    public ModelAndView showUserClass(HttpServletRequest request){

        ModelAndView model = new ModelAndView("/classLearn/showUserClass");
        ModelAndView model2 = new ModelAndView("/heroCollection/showHero");

        String userId = CommonFuncUtil.getUserIdByCookie(request);
        if ( userId == null || userId.length() == 0){
            List<VideoInfo> videoInfoList = userService.getAllVideo();
            List<VideoInfoVo> videoInfoVos = new ArrayList<>();       
            VideoInfoVo videoInfoVo = null;
            for (VideoInfo videoInfo : videoInfoList) {
                videoInfoVo = new VideoInfoVo(videoInfo);
                videoInfoVos.add(videoInfoVo);
            }
            List<Exam> resultExam = null;
            try{
                resultExam = reviewService.getAllExam();
            }
            catch (Exception e){
                log.error(e.getMessage());
            }
            List<QuestionAnswer> resultWeixin = null;
            try{
                resultWeixin = reviewService.getAllArticle("weixin");
            } catch (Exception e)
            {
                log.error(e.getMessage());
            }

            model.addObject("examList", resultExam);
            model.addObject("weixinList", resultWeixin);
            model.addObject("videoInfoList", videoInfoVos);

            return model;
        }else{
            UserBasic userBasic = userService.getUserById(userId);
            if ( userBasic.getUserType().equals(Constant.SALES) || userBasic.getUserType().equals(Constant.DEALER) ){
                /**
                 * todo : 这里如果是其他权限 需要加载新的数据
                 */

                List<Content> content5 = null;
                try{
                    userBasic = userService.getUserById(userId);
                    content5 = userShareService.getContentByType(5);
                }catch (Exception e){
                    log.error("群英汇获取数据出现异常");
                }

                model2.addObject("userBasic", userBasic);
                model2.addObject("content5", content5);

                return model2;
            }
            else{
                List<VideoInfo> videoInfoList = userService.getAllVideo();
                List<VideoInfoVo> videoInfoVos = new ArrayList<>();
                VideoInfoVo videoInfoVo = null;
                for (VideoInfo videoInfo : videoInfoList) {
                    videoInfoVo = new VideoInfoVo(videoInfo);
                    videoInfoVos.add(videoInfoVo);
                }
                List<Exam> resultExam = null;
                try{
                    resultExam = reviewService.getAllExam();
                }
                catch (Exception e){
                    log.error(e.getMessage());
                }
                List<QuestionAnswer> resultWeixin = null;
                try{
                    resultWeixin = reviewService.getAllArticle("weixin");
                } catch (Exception e)
                {
                    log.error(e.getMessage());
                }

                model.addObject("examList", resultExam);
                model.addObject("weixinList", resultWeixin);
                model.addObject("videoInfoList", videoInfoVos);

                return model;
            }
        }

    }

    /**
     * 历史课程列表
     */
    @RequestMapping(value="/showHistory")
    public ModelAndView showHistory(HttpServletRequest request){

        ModelAndView model = new ModelAndView("/classLearn/showHistory");
        List<VideoInfo> videoInfoList = userService.getAllDoneVideo();
        List<VideoInfoVo> videoInfoVos = new ArrayList<VideoInfoVo>();
        VideoInfoVo videoInfoVo = null;
        for (VideoInfo videoInfo : videoInfoList) {
            videoInfoVo = new VideoInfoVo(videoInfo);
            videoInfoVos.add(videoInfoVo);
        }

        model.addObject("videoInfoList", videoInfoVos);

        return model;
    }

    @RequestMapping(value="/showOneClass",method = RequestMethod.GET)
    public ModelAndView showOneClass(HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView("/classLearn/showOneClass");
        int videoId = Integer.parseInt(request.getParameter("id"));
        VideoInfo videoInfo = this.userService.getVideoById(videoId);


        HttpSession session = request.getSession();
        String userId1 = new String();
        userId1 = (String)session.getAttribute(CURRENT_USER);

        String userId2 = CommonFuncUtil.getUserIdByCookie(request);
        log.info("----------------通过cookie获取的用户名字是：" + userId2);

        String userId = null;
        if( userId1.length() == 11){
            userId = userId1;
        }
        else {
            userId = userId2;
        }
        log.info("---------------最终的用户名字是：" + userId);

        UserRecord userRecord = new UserRecord();
        userRecord.setUserId(userId);
        userRecord.setMid(videoId);
        //type： video, weixin, ppt,exam
        userRecord.setType("video");
        userRecord.setScore(0);
        Calendar cal = Calendar.getInstance();
        Integer month = cal.get(Calendar.MONTH) + 1;
        userRecord.setMonth(month);
        Integer count = this.userService.isRecorded(userRecord);
        if (count == 0){
            this.userService.insertUserRecord(userRecord);
            this.userService.updateUserScore(userId);
            if(month == 6 || month == 7 ||  month == 8 ||month == 9){
                this.userService.updateUserScoreAutumn(userId);
            } else if(month == 10 ||  month == 11 ||month == 12){
                this.userService.updateUserScoreWinter(userId);
            }else{
                this.userService.updateUserScoreSpring(userId);
            }
        }
        scoreService.addTScoreByClass(userId);
        model.addObject("videoInfo",videoInfo);

        return model;
    }

    /**
     * 答疑学习
     * @param request
     * @return
     */
    @RequestMapping(value = "showOneTip", method = RequestMethod.GET)
    public ModelAndView showOneTip(HttpServletRequest request)
    {
        Integer id =Integer.parseInt( request.getParameter("id"));
        QuestionAnswer weixin = null;
        String type = new String("weixin");
        weixin = this.reviewService.getOneArticle(id, type);

        ModelAndView modelAndView = new ModelAndView("/review/showOneTip");
        modelAndView.addObject("weixin",weixin);

        HttpSession session = request.getSession();
        String userId1 = new String();
        userId1 = (String)session.getAttribute(CURRENT_USER);
        //String userId = this.GetUserIdByCookie(request);
        String userId2 = CommonFuncUtil.getUserIdByCookie(request);
        log.info("----------------通过cookie获取的用户名字是：" + userId2);

        String userId = null;
        if( userId1.length() == 11){
            userId = userId1;
        }
        else {
            userId = userId2;
        }
        log.info("---------------最终的用户名字是：" + userId);

        UserRecord userRecord = new UserRecord();
        userRecord.setUserId(userId);
        userRecord.setMid(id);
        //type： video, weixin, ppt,exam
        userRecord.setType("weixin");
        userRecord.setScore(0);
        Calendar cal = Calendar.getInstance();
        Integer month = cal.get(Calendar.MONTH) + 1;
        userRecord.setMonth(month);
        Integer count = this.userService.isRecorded(userRecord);
        if (count == 0){
            this.userService.insertUserRecord(userRecord);
            this.userService.updateUserScore(userId);
            if(month == 6 || month == 7 ||  month == 8 ||month == 9){
                this.userService.updateUserScoreAutumn(userId);
            } else if(month == 10 ||  month == 11 ||month == 12){
                this.userService.updateUserScoreWinter(userId);
            }else{
                this.userService.updateUserScoreSpring(userId);
            }
        }

        return modelAndView;
    }


    /**
     * 展示考试
     * @param request
     * @return
     */
    @RequestMapping(value = "showOneExam", method = RequestMethod.GET)
    public ModelAndView showOneExam(HttpServletRequest request)
    {

        Integer id =Integer.parseInt( request.getParameter("id"));
        List<Exam> exam = this.reviewService.getOneExam(id);

        ModelAndView modelAndView = new ModelAndView("/review/showOneExam");
        modelAndView.addObject("exam", exam);
        modelAndView.addObject("id", id);

        return modelAndView;
    }

    /**
     * 处理考试结果
     * @param request
     * @return
     */
    @RequestMapping(value = "examResult", method = RequestMethod.POST)
    public ModelAndView examResult(HttpServletRequest request)
    {

        Integer id =Integer.parseInt(request.getParameter("id"));
        ModelAndView modelAndView = new ModelAndView("/review/examResult");

        String[] userArray = new String[]{"E","E","E","E","E"};
        List<String> answerList = new ArrayList();
        List<String> checkArray = new ArrayList();
        String right = new String("恭喜你，全部答对，获得100分");
        String wrong = new String("抱歉，");
        for (int i = 0; i<5 ; i++) {
            String ident = "radio+" + (i+1);
            if ( request.getParameter(ident) != null ) {
                userArray[i] = request.getParameter(ident);
            }
        }

        List<Exam> answer = this.reviewService.getOneExam(id);
        for(Exam exam:answer){
            answerList.add(exam.getAnswer());
        }
        String[] answerArray = answerList.toArray(new String[5]);

        int score = 0;
        for(int i=0; i<5 ; i++){
            if (userArray[i].equals(answerArray[i]))
            {
                score += 20;
            }
            else{
                checkArray.add(Integer.toString(i+1));
            }
        }

        if (score != 100 ) {

            wrong +=  "您的得分最后为 :" + score + "," ;
            for (String tmp : checkArray) {

                Exam exam = this.reviewService.getOneExamContext(id, Integer.parseInt(tmp));
                wrong += "<br>其中第" + tmp + "题" + exam.getContext() + "的答案为 ：<br>" + exam.getAnswerContext() + "; ";
            }
            modelAndView.addObject("result",wrong);
        }
        else {
            modelAndView.addObject("result", right);
        }

        HttpSession session = request.getSession();
        String userId1 = new String();
        userId1 = (String)session.getAttribute(CURRENT_USER);
        //String userId = this.GetUserIdByCookie(request);
        String userId2 = CommonFuncUtil.getUserIdByCookie(request);
        log.info("----------------通过cookie获取的用户名字是：" + userId2);

        String userId = null;
        if( userId1.length() == 11){
            userId = userId1;
        }
        else {
            userId = userId2;
        }
        log.info("---------------最终的用户名字是：" + userId);

        UserRecord userRecord = new UserRecord();
        userRecord.setUserId(userId);
        userRecord.setMid(id);
        //type： video, weixin, ppt,exam
        userRecord.setType("exam");
        userRecord.setScore(score);
        Calendar cal = Calendar.getInstance();
        Integer month = cal.get(Calendar.MONTH) + 1;
        userRecord.setMonth(month);
        Integer count = this.userService.isRecorded(userRecord);
        if (count == 0){
            this.userService.insertUserRecord(userRecord);
            this.userService.updateUserScore(userId);
            if(month == 6 || month == 7 ||  month == 8 ||month == 9){
                this.userService.updateUserScoreAutumn(userId);
            } else if(month == 10 ||  month == 11 ||month == 12){
                this.userService.updateUserScoreWinter(userId);
            }else{
                this.userService.updateUserScoreSpring(userId);
            }
        }
        return modelAndView;
    }


}
