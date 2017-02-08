package com.miniclass.util;

import com.miniclass.entity.UserBasic;
import com.miniclass.service.UserBasicService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ResourceBundle;

/**
 * Created by shuaizhiguo on 2016/12/28.
 */
public class CommonFuncUtil {

    static final Logger logger = LoggerFactory.getLogger(CommonFuncUtil.class);

    private static final String CURRENT_USER =  ResourceBundle.getBundle("config").getString("cookie_user_name");

    @Autowired
    private UserBasicService userBasicService;

    /**
     * 拿到用户的基础信息
     */
    public  UserBasic getUserBasicByUserId(String userId){

        UserBasic userBasic = userBasicService.getUserById(userId);

        return userBasic;
    }

    /**
     * 拿到用户的session
     */
    /**
     * 从cookie中获取用户名
     * @param request
     * @return
     */
    public static String getUserIdByCookie(HttpServletRequest request){


        logger.info("------------进入页面------------");
        String userId = new String();
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (CURRENT_USER.equals(cookie.getName())) {
                userId = cookie.getValue();
            }
        }
        logger.info("------------当前页面的用户是：" + userId);

        return userId;
    }
}
