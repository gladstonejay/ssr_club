package com.miniClass.dao;

import com.miniClass.BaseTest;
import com.miniclass.dao.UserScoreRankDao;
import com.miniclass.dao.UserScoreRecordDao;
import com.miniclass.entity.UserScoreRank;
import com.miniclass.entity.UserScoreRecord;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * Created by shuaizhiguo on 2017/8/11.
 */
public class UserScoreRecordDaoTest extends BaseTest {

    @Autowired
    private UserScoreRecordDao userScoreRecordDao;
    @Autowired
    private UserScoreRankDao userScoreRankDao;

    @Test
    public void getUserScoreCountMonthByType(){
        int count = userScoreRecordDao.getUserScoreCountMonthByType("13954284269",new String("exam"),8);

        System.out.println(count);
    }

    @Test
    public void getUserLatestRecord(){
        UserScoreRecord record = userScoreRecordDao.getUserLatestRecordByType("13062075551", new String("exam"), 9);

        System.out.println(record.getGetTime());
    }

    @Test
    public void updateUserRank(){

        UserScoreRank userScoreRank = userScoreRankDao.getUserRecordByUserId("13811111112");
        userScoreRank.setTotalScore(userScoreRank.getTotalScore() + 10);
        userScoreRankDao.updateByPrimaryKeySelective(userScoreRank);
    }

    @Test
    public void insertUserRank(){
        UserScoreRank userScoreRank = new UserScoreRank();
        userScoreRank.setUserId("13811111115");
        userScoreRank.setTotalScore(10);
        userScoreRank.setUpdateTime(new Date());
        userScoreRankDao.insertSelective(userScoreRank);
    }

    @Test
    public void getTopUser(){

        userScoreRankDao.getTopUser();
    }

}
