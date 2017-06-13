package com.miniclass.dao;


import com.miniclass.entity.UserScoreRank;
import com.miniclass.entity.UserScoreRankHistory;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserScoreRankHistoryDao {
    int deleteByPrimaryKey(Integer id);

    int insert(UserScoreRankHistory record);

    int insertSelective(UserScoreRankHistory record);

    UserScoreRankHistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserScoreRankHistory record);

    int updateByPrimaryKey(UserScoreRankHistory record);

    public Boolean dumpData(@Param("rankList")List<UserScoreRank> rankList, @Param("month")Integer month, @Param("year")Integer year);
}