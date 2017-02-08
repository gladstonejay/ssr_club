package com.miniclass.controller;

import com.miniclass.entity.Content;
import com.miniclass.entity.UserBasic;
import com.miniclass.enums.ShareTypeEnum;
import com.miniclass.service.UserBasicService;
import com.miniclass.service.UserShareService;
import com.miniclass.util.CommonFuncUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
        } catch (Exception e){
            log.error("【精英分享获取详细失败】: 类型是 ："  + type + " id是 " + id);
        }

        model.addObject("content",content);
        model.addObject("title", ShareTypeEnum.getName(content.getType()));
        model.addObject("userBasic",userBasic);
        return model;
    }

}