package com.miniclass;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by qibaichao on 2015/3/11.
 */
public class ServiceRunner {

    private static final Logger logger = LoggerFactory.getLogger(ServiceRunner.class);

    /**
     * timer程序启动方法
     *
     * @param args
     */
    public static void main(String[] args) {
        try {
            System.setProperty("druid.logType", "slf4j");
            System.setProperty("dubbo.application.logger", "slf4j");
            ServiceLocator.getApplicationContext();
            logger.info("ServiceRunner start");
            while (System.in.available() == 0) {
                Thread.sleep(5000);
            }
        } catch (Exception e) {
            logger.error("ServiceRunner error" + e.getMessage());
            System.exit(100);
        }
    }
}
