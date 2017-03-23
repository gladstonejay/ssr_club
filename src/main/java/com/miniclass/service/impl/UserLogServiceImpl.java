package com.miniclass.service.impl;

import com.miniclass.dao.UserLogRecordDao;
import com.miniclass.entity.UserLogRecord;
import com.miniclass.service.UserLogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * Created by shuaizhiguo on 2017/3/15.
 */

@Component
public class UserLogServiceImpl implements UserLogService{

    private static Logger log = LoggerFactory.getLogger(UserLogServiceImpl.class);

    @Autowired
    private UserLogRecordDao dao;

    @Override
    public void logUser(String userId, String userType, int contentTYpe, int contentId){

        UserLogRecord userLogRecord = new UserLogRecord();

        userLogRecord.setUserId(userId);
        userLogRecord.setUserType(userType);
        userLogRecord.setContentId(contentId);
        userLogRecord.setType(contentTYpe);
        userLogRecord.setCreateTime(new Date());
        try {
            dao.insertSelective(userLogRecord);
        }catch (Exception e){
            log.error("---------------userId 为 " + userId + " 打点出现异常 " + e.getMessage());
        }
    }

    @Override
    public Integer getUserWatchNo(String userId, Integer videoId){

        Integer countNo = 0;
        try{
            countNo = dao.getUserWatchNo(userId, videoId);
        }catch (Exception e){
            log.error("---------------userId 为 " + userId + " 获取视频次数 " + e.getMessage());
        }
        return countNo;
    }

}
