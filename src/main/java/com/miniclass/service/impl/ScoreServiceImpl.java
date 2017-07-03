package com.miniclass.service.impl;

import com.miniclass.dao.UserScoreRankDao;
import com.miniclass.dao.UserScoreRecordDao;
import com.miniclass.entity.UserScoreRank;
import com.miniclass.entity.UserScoreRecord;
import com.miniclass.enums.LearnTypeEnum;
import com.miniclass.service.ScoreService;
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
            Boolean isAdd = isAddScore(userId,LearnTypeEnum.getName(0));
            if ( !isAdd){
                return ;
            }
            UserScoreRecord userScoreRecord = new UserScoreRecord();
            userScoreRecord.setGetTime(dateString);
            userScoreRecord.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            userScoreRecord.setMonth(DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            int dot = userScoreRecord.getMonth() % 3;
            int season = 0;
            if (dot == 0) {
                season = (userScoreRecord.getMonth()) / 3 ;
            }else{
                season = (userScoreRecord.getMonth() - dot) / 3 + 1;
            }            userScoreRecord.setSeason(season);
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
     * 文字内容学习 3分
     */
    @Override
    public void addTScoreByLearn(String userId) {

        String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
        try {
            Boolean isAdd = isAddScore(userId,LearnTypeEnum.getName(1));
            if ( !isAdd){
                return ;
            }
            UserScoreRecord userScoreRecord = new UserScoreRecord();
            userScoreRecord.setGetTime(dateString);
            userScoreRecord.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            userScoreRecord.setMonth(DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            int dot = userScoreRecord.getMonth() % 3;
            int season = 0;
            if (dot == 0) {
                season = (userScoreRecord.getMonth()) / 3 ;
            }else{
                season = (userScoreRecord.getMonth() - dot) / 3 + 1;
            }            userScoreRecord.setSeason(season);
            userScoreRecord.setScore(3);
            userScoreRecord.setType(LearnTypeEnum.getName(1));
            userScoreRecord.setUserId(userId);
            userScoreRecordDao.insertSelective(userScoreRecord);

            int recordCount = userScoreRankDao.getUserRecordCountByUserId(userId);
            UserScoreRank userScoreRank = new UserScoreRank();
            if (recordCount == 0) {
                userScoreRank.setUserId(userId);
                //userScoreRank.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
                userScoreRank.setTotalScore(3);
                userScoreRankDao.insertSelective(userScoreRank);
            } else {
                userScoreRank = userScoreRankDao.getUserRecordByUserId(userId);
                userScoreRank.setTotalScore(userScoreRank.getTotalScore() + 3);
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
    public void addTScoreByExam(String userId, Integer score, Integer type, Integer examId) {
        String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
        try {
            Boolean isAdd = isAddScore(userId,LearnTypeEnum.getName(2));
            if ( !isAdd){
                return ;
            }
            UserScoreRecord userScoreRecord = new UserScoreRecord();
            userScoreRecord.setGetTime(dateString);
            userScoreRecord.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            userScoreRecord.setMonth(DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            int dot = userScoreRecord.getMonth() % 3;
            int season = 0;
            if (dot == 0) {
                season = (userScoreRecord.getMonth()) / 3 ;
            }else{
                season = (userScoreRecord.getMonth() - dot) / 3 + 1;
            }            userScoreRecord.setSeason(season);
            userScoreRecord.setScore(10);
            userScoreRecord.setType(LearnTypeEnum.getName(2));
            userScoreRecord.setUserId(userId);
            userScoreRecord.setExamScore(score);
            userScoreRecord.setExamType(type);
            userScoreRecord.setExamId(examId);
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
     * 考试记录，只为保存平均数
     */
    public void addTScoreAvgByExam(String userId, Integer score, Integer type , Integer examId){
        String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
        try {

            UserScoreRecord userScoreRecord = new UserScoreRecord();
            userScoreRecord.setGetTime(dateString);
            userScoreRecord.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            userScoreRecord.setMonth(DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            int dot = userScoreRecord.getMonth() % 3;
            int season = 0;
            if (dot == 0) {
                season = (userScoreRecord.getMonth()) / 3 ;
            }else{
                season = (userScoreRecord.getMonth() - dot) / 3 + 1;
            }            userScoreRecord.setSeason(season);
            userScoreRecord.setScore(10);
            userScoreRecord.setType(LearnTypeEnum.getName(2));
            userScoreRecord.setUserId(userId);
            userScoreRecord.setExamScore(score);
            userScoreRecord.setExamType(type);
            userScoreRecord.setExamId(examId);
            userScoreRecordDao.insertSelective(userScoreRecord);

        } catch (Exception e) {
            e.printStackTrace();
            log.error("用户 " + userId + "获得当日" + dateString + "，该" + LearnTypeEnum.getName(2) + "类型的积分出现错误");
        }
    }


    /**
     * 行业动态2分
     */
    @Override
    public void addTScoreByIndustry(String userId) {

        String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
        try {
            Boolean isAdd = isAddScore(userId,LearnTypeEnum.getName(3));
            if ( !isAdd){
                return ;
            }
            UserScoreRecord userScoreRecord = new UserScoreRecord();
            userScoreRecord.setGetTime(dateString);
            userScoreRecord.setYear(DateUtil.getYear(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            userScoreRecord.setMonth(DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT));
            int dot = userScoreRecord.getMonth() % 3;
            int season = 0;
            if (dot == 0) {
                 season = (userScoreRecord.getMonth()) / 3 ;
            }else{
                 season = (userScoreRecord.getMonth() - dot) / 3 + 1;
            }
            userScoreRecord.setSeason(season);
            userScoreRecord.setScore(2);
            userScoreRecord.setType(LearnTypeEnum.getName(3));
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

    /**
     * 每周只有一次获得积分
     */
    public Boolean isAddScore(String userId, String type ){
        Boolean isAddScore = false;
        try {
            String dateString = DateUtil.format(new Date(), DateUtil.DATE_FORMAT_DAY_SHORT);
            Integer month = DateUtil.getMonth(dateString, DateUtil.DATE_FORMAT_DAY_SHORT);
            Integer day = DateUtil.getDay(dateString, DateUtil.DATE_FORMAT_DAY_SHORT);
            Integer count = userScoreRecordDao.getUserScoreCountMonthByType(userId, type, month);

            //满四次
            if (count >= 4){
                isAddScore = false;
            }
            //不满四次
            else{
                UserScoreRecord record = userScoreRecordDao.getUserLatestRecordByType(userId, type, month);
                //如果没有记录
                if (record == null){
                    isAddScore = true;
                }else {
                    Integer lateDay = Integer.parseInt(record.getGetTime().substring(record.getGetTime().length() - 2, record.getGetTime().length()));
                    //上一次 插入时间 与当前日期 小于7 不能保存记录
                    if (day - lateDay < 7) {
                        isAddScore = false;
                    }
                    //上一次 插入时间 与当前日期 大于等于7
                    else {
                        isAddScore = true;
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
            log.error("获取次数时出现异常",e);
        }

        return isAddScore;
    }

}
