package com.miniclass.dao;

import com.miniclass.entity.UserScoreRank;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserScoreRankDao {

    int deleteByPrimaryKey(Integer id);

    int insert(UserScoreRank record);

    int insertSelective(UserScoreRank record);

    UserScoreRank selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserScoreRank record);

    int updateByPrimaryKey(UserScoreRank record);

    public  int  getUserRecordCountByUserId (@Param("userId")String userId);

    public UserScoreRank getUserRecordByUserId(@Param("userId") String userId);
}