package com.miniClass.dao;

import com.miniClass.BaseTest;
import com.miniclass.dao.UserScoreRecordDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by shuaizhiguo on 2017/8/11.
 */
public class UserScoreRecordDaoTest extends BaseTest {

    @Autowired
    private UserScoreRecordDao userScoreRecordDao;

    @Test
    public void getUserScoreCountMonthByType(){
        int count = userScoreRecordDao.getUserScoreCountMonthByType("13954284269",new String("exam"),8);

        System.out.println(count);
    }
}
