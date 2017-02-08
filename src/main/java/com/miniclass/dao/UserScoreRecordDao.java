package com.miniclass.dao;

import com.miniclass.entity.UserScoreRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserScoreRecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(UserScoreRecord record);

    int insertSelective(UserScoreRecord record);

    UserScoreRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserScoreRecord record);

    int updateByPrimaryKey(UserScoreRecord record);

    public int getUserHaveTodayScoreByType(@Param("userId")String userId , @Param("getTime")String dateString , @Param("type")String type);
}