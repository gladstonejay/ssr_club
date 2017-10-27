package com.miniclass.controller;

import com.miniclass.entity.Content;
import com.miniclass.entity.UserBasic;
import com.miniclass.entity.UserRecord;
import com.miniclass.enums.ShareTypeEnum;
import com.miniclass.service.ScoreService;
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

import javax.servlet.http.HttpServletRequest;
import java.util.Calendar;
import java.util.List;

/**
 * Created by shuaizhiguo on 2016/12/28.
 */
@Controller
@RequestMapping("/heroShare")
public class HeroShareController {

    private static Logger log = LoggerFactory.getLogger(HeroShareController.class);

    @Autowired
    private UserShareService userShareService;
    @Autowired
    private UserBasicService userBasicService;
    @Autowired
    private UserLogService userLogService;
    @Autowired
    private ScoreService scoreService;

    @RequestMapping(value="/showShare")
    public ModelAndView showRank(HttpServletRequest request) {

        ModelAndView model = new ModelAndView("/heroShare/showShare");

        String userId = CommonFuncUtil.getUserIdByCookie(request);
        UserBasic userBasic = null;
        List<Content> content1 = null;
        List<Content> content2 = null;
        List<Content> content3 = null;

        try {
            content1 = userShareService.getContentByType(1);
            content2 = userShareService.getContentByType(2);
            content3 = userShareService.getContentByType(3);
            userBasic = userBasicService.getUserById(userId);
        }catch (Exception e){
            log.error("【精英分享获取信息失败】");
        }

        model.addObject("content1", content1);
        model.addObject("content2", content2);
        model.addObject("content3", content3);
        model.addObject("userBasic",userBasic);
        return model;
    }

    @RequestMapping(value="/showShareDetail")
    public ModelAndView showShareDetail(HttpServletRequest request) {
        ModelAndView model = new ModelAndView("/heroShare/showShareDetail");

        Integer id =Integer.parseInt( request.getParameter("id"));
        Integer type  =Integer.parseInt( request.getParameter("type"));

        String userId = CommonFuncUtil.getUserIdByCookie(request);
        UserBasic userBasic = null;

        Content content = null;
        try{
            content = userShareService.getContentByTypeAndItem(type, id);
            userBasic = userBasicService.getUserById(userId);
            userLogService.logUser(userId, userBasic.getUserType(), type, id);
            if ( type == ShareTypeEnum.USER_TYPE_1.getValue() ){
                if (userBasic.getUserType().equals("1") || userBasic.getUserType().equals("2") ) {
                    scoreService.addTScoreByIndustry(userId);
                }
            }
        } catch (Exception e){
            log.error("【精英分享获取详细失败】: 类型是 ："  + type + " id是 " + id);
        }

        model.addObject("content",content);
        model.addObject("title", ShareTypeEnum.getName(content.getType()));
        model.addObject("userBasic",userBasic);
        return model;
    }


    /**
     * 搜索
     * @param request
     * @return
     */
    @RequestMapping(value="/search")
    public ModelAndView search(HttpServletRequest request) {


        ModelAndView model = new ModelAndView("/heroShare/showShare");

        String userId = CommonFuncUtil.getUserIdByCookie(request);
        UserBasic userBasic = null;
        List<Content> content1 = null;
        List<Content> content2 = null;
        List<Content> content3 = null;

        try {
            String word;
            if (request.getParameter("search_industry") != null){
                if (request.getParameter("search_industry") != null && request.getParameter("search_industry") != "") {
                    word = request.getParameter("search_industry");
                    content1 = userShareService.getContentByTypeAndWord(1, word);
                    content2 = userShareService.getContentByType(2);

                } else {
                    content2 = userShareService.getContentByType(2);
                }
                content3 = userShareService.getContentByType(3);
                userBasic = userBasicService.getUserById(userId);
            }
            else{
                ModelAndView model2 = new ModelAndView("/heroShare/showShare2");

                if (request.getParameter("search_brand") != null && request.getParameter("search_brand") != ""){
                    word = request.getParameter("search_brand");
                    content1 = userShareService.getContentByType(1);
                    content2 = userShareService.getContentByTypeAndWord(2, word);
                }else {
                    content1 = userShareService.getContentByType(1);
                }
                content3 = userShareService.getContentByType(3);
                userBasic = userBasicService.getUserById(userId);

                model2.addObject("content1", content1);
                model2.addObject("content2", content2);
                model2.addObject("content3", content3);
                model2.addObject("userBasic",userBasic);

                return model2;
            }

        }catch (Exception e){
            log.error("【精英分享获取信息失败】");
        }

        model.addObject("content1", content1);
        model.addObject("content2", content2);
        model.addObject("content3", content3);
        model.addObject("userBasic",userBasic);
        return model;
    }

}
