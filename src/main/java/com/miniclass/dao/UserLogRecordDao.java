package com.miniclass.dao;

import com.miniclass.entity.UserLogRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserLogRecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(UserLogRecord record);

    int insertSelective(UserLogRecord record);

    UserLogRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserLogRecord record);

    int updateByPrimaryKey(UserLogRecord record);

    public Integer getUserWatchNo(@Param("userId")String userId, @Param("contentId")Integer videoId, @Param("type")Integer type);
}