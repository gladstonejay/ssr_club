package com.miniclass.service;

import com.miniclass.entity.UserScoreRank;
import sun.reflect.generics.tree.VoidDescriptor;

import java.util.List;

/**
 * SSR_CLUB 积分服务
 *
 * Created by shuaizhiguo on 2016/11/25.
 */
public interface ScoreService {

    /**
     * 课程学习增加积分 10分
     *
     */
    public void addTScoreByClass (String userId);

    /**
     * 文字内容学习 2分
     */
    public void addTScoreByLearn (String userId);

    /**
     * 考试分数 实际 满分10分
     */
    public void addTScoreByExam (String userId, Integer score, Integer type , Integer examId);


    /**
     * 获取用户分数
     */
    public Integer getUserScoreByUserId (String userId);

    /**
     * 获得前十
     */
    public List<UserScoreRank> getTopUser();

    /**
     * 获得前100
     */
    public List<String> getTop100User();
}
