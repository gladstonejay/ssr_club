package com.miniClass.service;

import com.miniClass.BaseTest;
import com.miniclass.service.MonthlyJobService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by shuaizhiguo on 2017/6/13.
 */
public class MonthlyTest extends BaseTest{

    @Autowired
    private MonthlyJobService monthlyJobService;

    @Test
    public void clearTotalScoreByMonth(){

        monthlyJobService.clearTotalScoreByMonth();

    }

    @Test
    public void addTotalScoreToScoreByMonth(){

        monthlyJobService.addTotalScoreToScoreByMonth();
    }

    @Test
    public void dumpData(){

        monthlyJobService.dumpUserScoreRankToUserScoreRankHistoryByMonth();
    }

}
