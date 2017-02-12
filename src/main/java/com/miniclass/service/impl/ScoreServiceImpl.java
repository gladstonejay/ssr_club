package com.miniclass.service.impl;

import com.miniclass.dao.UserScoreRankDao;
import com.miniclass.dao.UserScoreRecordDao;
import com.miniclass.entity.UserScoreRank;
import com.miniclass.entity.UserScoreRecord;
import com.miniclass.enums.LearnTypeEnum;
import com.miniclass.service.ScoreService;
import com.miniclass.util.CommonFuncUtil;
import com.miniclass.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * Created by shuaizhiguo on 2017/2/7.
 */
@Component
public class ScoreServiceImpl implements ScoreService {


    private static Logger log = LoggerFactory.getLogger(ScoreService.class);

    @Autowired
    private UserScoreRecordDao userScoreRecordDao;
    @Autowired
    private UserScoreRankDao userScoreRankDao;

    /**
     * 课程学习增加积分 10分
     */
    @Override
    public void addTScoreByClass(String userId) {

        String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
        try {
            UserScoreRecord userScoreRecord = new UserScoreRecord();
            userScoreRecord.setGetTime(dateString);
            userScoreRecord.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            userScoreRecord.setMonth(DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            int dot = userScoreRecord.getMonth() % 3;
            int season = (userScoreRecord.getMonth() - dot) / 3 + 1;
            userScoreRecord.setSeason(season);
            userScoreRecord.setScore(10);
            userScoreRecord.setType(LearnTypeEnum.getName(0));
            userScoreRecord.setUserId(userId);
            userScoreRecordDao.insertSelective(userScoreRecord);

            int recordCount = userScoreRankDao.getUserRecordCountByUserId(userId);
            UserScoreRank userScoreRank = new UserScoreRank();
            if (recordCount == 0) {
                userScoreRank.setUserId(userId);
                //userScoreRank.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
                userScoreRank.setTotalScore(10);
                userScoreRankDao.insertSelective(userScoreRank);
            } else {
                userScoreRank = userScoreRankDao.getUserRecordByUserId(userId);
                userScoreRank.setTotalScore(userScoreRank.getTotalScore() + 10);
                userScoreRankDao.updateByPrimaryKeySelective(userScoreRank);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("用户 " + userId + "获得当日" + dateString + "，该" + LearnTypeEnum.getName(0) + "类型的积分出现错误");
        }

    }

    /**
     * 文字内容学习 2分
     */
    @Override
    public void addTScoreByLearn(String userId) {

        String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
        try {
            UserScoreRecord userScoreRecord = new UserScoreRecord();
            userScoreRecord.setGetTime(dateString);
            userScoreRecord.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            userScoreRecord.setMonth(DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            int dot = userScoreRecord.getMonth() % 3;
            int season = (userScoreRecord.getMonth() - dot) / 3 + 1;
            userScoreRecord.setSeason(season);
            userScoreRecord.setScore(2);
            userScoreRecord.setType(LearnTypeEnum.getName(1));
            userScoreRecord.setUserId(userId);
            userScoreRecordDao.insertSelective(userScoreRecord);

            int recordCount = userScoreRankDao.getUserRecordCountByUserId(userId);
            UserScoreRank userScoreRank = new UserScoreRank();
            if (recordCount == 0) {
                userScoreRank.setUserId(userId);
                //userScoreRank.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
                userScoreRank.setTotalScore(2);
                userScoreRankDao.insertSelective(userScoreRank);
            } else {
                userScoreRank = userScoreRankDao.getUserRecordByUserId(userId);
                userScoreRank.setTotalScore(userScoreRank.getTotalScore() + 2);
                userScoreRankDao.updateByPrimaryKeySelective(userScoreRank);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("用户 " + userId + "获得当日" + dateString + "，该" + LearnTypeEnum.getName(1) + "类型的积分出现错误");
        }

    }

    /**
     * 考试分数 实际 满分10分
     */
    @Override
    public void addTScoreByExam(String userId) {
        String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
        try {
            UserScoreRecord userScoreRecord = new UserScoreRecord();
            userScoreRecord.setGetTime(dateString);
            userScoreRecord.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            userScoreRecord.setMonth(DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            int dot = userScoreRecord.getMonth() % 3;
            int season = (userScoreRecord.getMonth() - dot) / 3 + 1;
            userScoreRecord.setSeason(season);
            userScoreRecord.setScore(10);
            userScoreRecord.setType(LearnTypeEnum.getName(2));
            userScoreRecord.setUserId(userId);
            userScoreRecordDao.insertSelective(userScoreRecord);

            int recordCount = userScoreRankDao.getUserRecordCountByUserId(userId);
            UserScoreRank userScoreRank = new UserScoreRank();
            if (recordCount == 0) {
                userScoreRank.setUserId(userId);
                //userScoreRank.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
                userScoreRank.setTotalScore(10);
                userScoreRankDao.insertSelective(userScoreRank);
            } else {
                userScoreRank = userScoreRankDao.getUserRecordByUserId(userId);
                userScoreRank.setTotalScore(userScoreRank.getTotalScore() + 10);
                userScoreRankDao.updateByPrimaryKeySelective(userScoreRank);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.error("用户 " + userId + "获得当日" + dateString + "，该" + LearnTypeEnum.getName(2) + "类型的积分出现错误");
        }
    }

    /**
     * 获取用户分数
     */
    @Override
    public Integer getUserScoreByUserId (String userId){

        return userScoreRankDao.getUserScoreByUserId(userId);
    }

    /**
     * 获得前十
     */
    public List<UserScoreRank> getTopUser(){

        return userScoreRankDao.getTopUser();
    }

    /**
     * 获得前100
     */
    public List<String> getTop100User(){
        return userScoreRankDao.getTop100User();
    }
}
