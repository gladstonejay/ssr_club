package com.miniclass.controller;

import javax.annotation.Resource;
import com.miniclass.entity.UserBasic;
import com.miniclass.service.RankService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by shuaizhiguo on 2016/4/11.
 */

@Controller
@RequestMapping("/rank")
public class RankController {

    private static Logger log = LoggerFactory.getLogger(RankController.class);
    @Resource
    private RankService rankService;
    @RequestMapping(value="/showRank")
    public ModelAndView showRank(){

        ModelAndView model = new ModelAndView("/rank/showRank");

        return model;
    }
}
