package com.miniclass;

import com.site.spring.DefaultServiceLocator;
import org.springframework.context.ApplicationContext;


/**
 * @Author qibaichao
 * @ClassName ServiceLocator
 * @Date 2015年12月11日
 * @Description:
 */
public class ServiceLocator extends DefaultServiceLocator {

    /**
     * The context.
     */
    private static ApplicationContext context;

    static {
        try {
            context = getApplicationContext(ServiceLocator.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Gets the context.
     *
     * @return the context
     */
    public static ApplicationContext getApplicationContext() {
        if (context == null) {
            throw new RuntimeException("Spring loading error!");
        }
        return context;
    }

}
