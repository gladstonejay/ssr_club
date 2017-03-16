package com.miniclass.dao;

import com.miniclass.entity.UserLogRecord;

public interface UserLogRecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(UserLogRecord record);

    int insertSelective(UserLogRecord record);

    UserLogRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserLogRecord record);

    int updateByPrimaryKey(UserLogRecord record);
}