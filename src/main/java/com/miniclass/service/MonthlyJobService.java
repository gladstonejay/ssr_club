package com.miniclass.service;

/**
 * Created by shuaizhiguo on 2017/6/13.
 */

public interface MonthlyJobService {


    /**
     * 每个月清空user_score_rank里total_score字段
     */
    public Boolean clearTotalScoreByMonth();

    /**
     * 每个月累加user_score_rank里的total_score进入score
     */
    public Boolean addTotalScoreToScoreByMonth();

    /**
     * 每个月导出user_score_rank里一份数据进入user_score_rank_history
     */
    public Boolean dumpUserScoreRankToUserScoreRankHistoryByMonth();

}
