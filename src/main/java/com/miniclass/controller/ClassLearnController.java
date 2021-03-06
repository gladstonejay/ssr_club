package com.miniclass.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.miniclass.entity.*;
import com.miniclass.service.*;
import com.miniclass.util.CommonFuncUtil;
import com.miniclass.util.DateUtil;
import com.miniclass.vo.VideoInfoVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
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
    private ScoreService scoreService;
    @Autowired
    private UserLogService userLogService;


    /**
     * 搜索栏
     * @param request
     * @return
     */
    @RequestMapping(value = "/search")
    public ModelAndView searchClass(HttpServletRequest request){

        String keyWord = request.getParameter("search");

        ModelAndView model = new ModelAndView("/classLearn/showUserClass");
        ModelAndView model2 = new ModelAndView("/heroCollection/showHero");

        String userId = CommonFuncUtil.getUserIdByCookie(request);

        if ( userId == null || userId.length() == 0){
            /**
             * 获取新的搜索结果
             */
            List<VideoInfo> videoInfoList = null;
            if(keyWord != null && keyWord != ""){
                videoInfoList = userService.getSearchVideo(keyWord);
            }
            List<VideoInfoVo> videoInfoVos = new ArrayList<>();
            VideoInfoVo videoInfoVo = null;
            for (VideoInfo videoInfo : videoInfoList) {
                videoInfoVo = new VideoInfoVo(videoInfo);
                videoInfoVo.setTimestamp(DateUtil.format(videoInfo.getTimestamp(),DateUtil.DATE_FORMAT_DAY));
                videoInfoVo.setWriter(videoInfo.getWriter());
                videoInfoVo.setStatus(videoInfo.getStatus());
                model.addObject("month",videoInfo.getMonth());
                videoInfoVos.add(videoInfoVo);
            }
            List<Exam> resultExamBefore = null;
            List<Exam> resultExamAfter = null;
            try{
                resultExamBefore = reviewService.getAllExam(1);
                resultExamAfter = reviewService.getAllExam(2);
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

            model.addObject("examListBefore", resultExamBefore);
            model.addObject("examListAfter", resultExamAfter);
            model.addObject("weixinList", resultWeixin);
            model.addObject("videoInfoList", videoInfoVos);

            return model;
        }else{
            UserBasic userBasic = null;
            try {
                userBasic = userService.getUserById(userId);
                //补全信息入口 ，20170311
                if (userBasic.getLocation() == null || userBasic.getLocation().length() == 0){
                    ModelAndView fill = new ModelAndView("/my/fulfillBasicInfo");

                    fill.addObject("userType" , userBasic.getUserType());
                    return fill;
                }
                List<VideoInfo> videoInfoList = null;

                try {
                    /**
                     * 获取新的搜索结果
                     */
                    if(keyWord != null && keyWord != ""){
                        videoInfoList = userService.getSearchVideo(keyWord);
                    }
                }catch (Exception e){
                    log.error(e.getMessage());
                }

                //List<VideoInfo> videoInfoList = userService.getAllVideo();
                List<VideoInfoVo> videoInfoVos = new ArrayList<>();
                VideoInfoVo videoInfoVo = null;
                for (VideoInfo videoInfo : videoInfoList) {
                    videoInfoVo = new VideoInfoVo(videoInfo);
                    videoInfoVo.setTimestamp(DateUtil.format(videoInfo.getTimestamp(),DateUtil.DATE_FORMAT_DAY));
                    videoInfoVo.setWriter(videoInfo.getWriter());
                    videoInfoVo.setStatus(videoInfo.getStatus());
                    Integer watchNo = userLogService.getUserWatchNo(userId, videoInfo.getOrderId(), 8);
                    if (watchNo > 0){
                        videoInfoVo.setWatched(1);
                    }else{
                        videoInfoVo.setWatched(0);
                    }
                    log.info("-----------------------watched = " + videoInfoVo.getWatched());
                    model.addObject("month",videoInfo.getMonth());
                    videoInfoVos.add(videoInfoVo);
                }
                List<Exam> resultExamBefore = null;
                List<Exam> resultExamAfter = null;
                try{
                    resultExamBefore = reviewService.getAllExam(1);
                    resultExamAfter = reviewService.getAllExam(2);
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

                model.addObject("examListBefore", resultExamBefore);
                model.addObject("examListAfter", resultExamAfter);
                model.addObject("weixinList", resultWeixin);
                model.addObject("videoInfoList", videoInfoVos);

            }catch (Exception e){
                log.error(e.getMessage());
            }
            return model;
        }
    }

    /**
     * 本月课程列表
     */
    @RequestMapping(value="/showUserClass")
    public ModelAndView showUserClass(HttpServletRequest request){

        ModelAndView model = new ModelAndView("/classLearn/showUserClass");
        ModelAndView model2 = new ModelAndView("/heroCollection/showHero");

        String userId = CommonFuncUtil.getUserIdByCookie(request);

        if ( userId == null || userId.length() == 0){
            List<VideoInfo> videoInfoList = userService.getAllVideo("1");
            List<VideoInfoVo> videoInfoVos = new ArrayList<>();
            VideoInfoVo videoInfoVo = null;
            for (VideoInfo videoInfo : videoInfoList) {
                videoInfoVo = new VideoInfoVo(videoInfo);
                videoInfoVo.setTimestamp(DateUtil.format(videoInfo.getTimestamp(),DateUtil.DATE_FORMAT_DAY));
                videoInfoVo.setWriter(videoInfo.getWriter());
                videoInfoVo.setStatus(videoInfo.getStatus());
                model.addObject("month",videoInfo.getMonth());
                videoInfoVos.add(videoInfoVo);
            }
            List<Exam> resultExamBefore = null;
            List<Exam> resultExamAfter = null;
            try{
                resultExamBefore = reviewService.getAllExam(1);
                resultExamAfter = reviewService.getAllExam(2);
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

            model.addObject("examListBefore", resultExamBefore);
            model.addObject("examListAfter", resultExamAfter);
            model.addObject("weixinList", resultWeixin);
            model.addObject("videoInfoList", videoInfoVos);

            return model;
        }else{
            UserBasic userBasic = null;
            try {
                userBasic = userService.getUserById(userId);
                //补全信息入口 ，20170311
                if (userBasic.getLocation() == null || userBasic.getLocation().length() == 0){
                    ModelAndView fill = new ModelAndView("/my/fulfillBasicInfo");

                    fill.addObject("userType" , userBasic.getUserType());
                    return fill;
                }
                List<VideoInfo> videoInfoList = null;

                try {
                    videoInfoList = userService.getAllVideo("1");
                }catch (Exception e){
                    log.error(e.getMessage());
                }

                //List<VideoInfo> videoInfoList = userService.getAllVideo();
                List<VideoInfoVo> videoInfoVos = new ArrayList<>();
                VideoInfoVo videoInfoVo = null;
                for (VideoInfo videoInfo : videoInfoList) {
                    videoInfoVo = new VideoInfoVo(videoInfo);
                    videoInfoVo.setTimestamp(DateUtil.format(videoInfo.getTimestamp(),DateUtil.DATE_FORMAT_DAY));
                    videoInfoVo.setWriter(videoInfo.getWriter());
                    videoInfoVo.setStatus(videoInfo.getStatus());
                    Integer watchNo = userLogService.getUserWatchNo(userId, videoInfo.getOrderId(), 8);
                    if (watchNo > 0){
                        videoInfoVo.setWatched(1);
                    }else{
                        videoInfoVo.setWatched(0);
                    }
                    log.info("-----------------------watched = " + videoInfoVo.getWatched());
                    model.addObject("month",videoInfo.getMonth());
                    videoInfoVos.add(videoInfoVo);
                }
                List<Exam> resultExamBefore = null;
                List<Exam> resultExamAfter = null;
                try{
                    resultExamBefore = reviewService.getAllExam(1);
                    resultExamAfter = reviewService.getAllExam(2);
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

                model.addObject("examListBefore", resultExamBefore);
                model.addObject("examListAfter", resultExamAfter);
                model.addObject("weixinList", resultWeixin);
                model.addObject("videoInfoList", videoInfoVos);

            }catch (Exception e){
                log.error(e.getMessage());
            }
            return model;
        }

    }

    /**
     * 历史课程列表
     */
    @RequestMapping(value="/showHistory")
    public ModelAndView showHistory(HttpServletRequest request){

        ModelAndView model = new ModelAndView("/classLearn/showHistory");
        String userId = CommonFuncUtil.getUserIdByCookie(request);
        UserBasic userBasic = null;
        try {
            userBasic = userService.getUserById(userId);
        }catch (Exception e){
            log.error(e.getMessage());
        }
        List<VideoInfo> videoInfoList = null;
        if (userBasic.getUserType() == "2"){
            videoInfoList = userService.getAllDoneVideo("2");
        }else{
            videoInfoList = userService.getAllDoneVideo("1");
        }
        List<VideoInfoVo> videoInfoVos = new ArrayList<VideoInfoVo>();
        VideoInfoVo videoInfoVo = null;
        for (VideoInfo videoInfo : videoInfoList) {
            videoInfoVo = new VideoInfoVo(videoInfo);
            videoInfoVo.setTimestamp(DateUtil.format(videoInfo.getTimestamp(),DateUtil.DATE_FORMAT_DAY));
            videoInfoVo.setWriter(videoInfo.getWriter());
            videoInfoVos.add(videoInfoVo);
        }

        model.addObject("videoInfoList", videoInfoVos);

        return model;
    }

    /**
     * 一节课
     * @param request
     * @return
     */
    @RequestMapping(value="/showOneClass",method = RequestMethod.GET)
    public ModelAndView showOneClass(HttpServletRequest request)
    {
        ModelAndView model = new ModelAndView("/classLearn/showOneClass");
        int videoId = Integer.parseInt(request.getParameter("id"));
        VideoInfo videoInfo =null;
        try {
            videoInfo = this.userService.getVideoById(videoId);
        }catch (Exception e){
            log.error(e.getMessage());
        }


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

        String userType = userService.getUserById(userId).getUserType();

        userLogService.logUser(userId, userType, 8, videoId);
        if (userType.equals("1") || userType.equals("2") ) {
            scoreService.addTScoreByClass(userId);
        }
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
        modelAndView.addObject("id",id);

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

        String userType = userService.getUserById(userId).getUserType();
        userLogService.logUser(userId, userType, 9, id);
        if (userType.equals("1") || userType.equals("2") ) {

            scoreService.addTScoreByLearn(userId);
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
        Integer type = Integer.parseInt( request.getParameter("type"));

        List<Exam> exam = this.reviewService.getOneExam(id, type);

        ModelAndView modelAndView = new ModelAndView("/review/showOneExam");
        modelAndView.addObject("exam", exam);
        modelAndView.addObject("id", id);
        modelAndView.addObject("type",type);

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
        Integer type =Integer.parseInt(request.getParameter("type"));
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
        List<Exam> answer = this.reviewService.getOneExam(id,type);
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

                Exam exam = this.reviewService.getOneExamContext(id, Integer.parseInt(tmp),type);
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

        String userType = userService.getUserById(userId).getUserType();

        Integer examType = 10;
        if (type == 2){
            examType = 12;
        }
        userLogService.logUser(userId, userType, examType, id);
        if (userType.equals("1") || userType.equals("2") ) {
            scoreService.addTScoreByExam(userId,score,type,id);
            //取消对考试的限制 20170320 此方法只为计算平均数
            scoreService.addTScoreAvgByExam(userId,score,type,id);

        }
        return modelAndView;
    }




}
