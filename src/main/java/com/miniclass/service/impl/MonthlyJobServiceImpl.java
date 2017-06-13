package com.miniclass.service.impl;

import com.miniclass.dao.UserScoreRankDao;
import com.miniclass.dao.UserScoreRankHistoryDao;
import com.miniclass.entity.UserScoreRank;
import com.miniclass.service.MonthlyJobService;
import com.miniclass.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by shuaizhiguo on 2017/6/13.
 */

@Service
public class MonthlyJobServiceImpl implements MonthlyJobService {


    private static final Logger logger = LoggerFactory.getLogger(MonthlyJobServiceImpl.class);

    @Autowired
    private UserScoreRankDao rankDao;
    @Autowired
    private UserScoreRankHistoryDao historyDao;


    /**
     * 每个月清空user_score_rank里total_score字段
     */
    @Override
    public Boolean clearTotalScoreByMonth(){
        Boolean result = true;
        try{
            rankDao.clearTotalScoreByMonth();
        }catch (Exception e){
            e.printStackTrace();
            logger.error("清零出现异常",e);
        }
        return result;
    }

    /**
     * 每个月累加user_score_rank里的total_score进入score
     */
    @Override
    public Boolean addTotalScoreToScoreByMonth(){
        Boolean result = true;
        try{
            rankDao.addTotalScoreToScoreByMonth();
        }catch (Exception e){
            e.printStackTrace();
            logger.error("清零出现异常",e);
        }
        return result;
    }

    /**
     * 每个月导出user_score_rank里一份数据进入user_score_rank_history
     */
    public Boolean dumpUserScoreRankToUserScoreRankHistoryByMonth(){
        Boolean result = true;

        try {
            List<UserScoreRank> recordList = rankDao.getAllUser();

            String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
            Integer month = DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT);
            Integer year = DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT);

            historyDao.dumpData(recordList, month, year);
        }catch (Exception e){
            e.printStackTrace();
            logger.error("清零出现异常",e);
        }

        return result;
    }

}
