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

    /**
     * 获取每个月已经获取积分
     */
    public int getUserScoreCountMonthByType(@Param("userId")String userId, @Param("type")String type, @Param("month")Integer month);

    /**
     * 获得当月最近一次积分获取情况
     */
    public UserScoreRecord getUserLatestRecordByType(@Param("userId")String userId, @Param("type")String type ,@Param("month")Integer month);

}