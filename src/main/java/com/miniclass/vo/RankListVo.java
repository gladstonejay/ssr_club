package com.miniclass.vo;

import com.miniclass.entity.UserScoreRank;

/**
 * Created by shuaizhiguo on 2017/2/12.
 */
public class RankListVo extends Vo {

    private Integer id;

    private String userId;

    private Integer year;

    private Integer season;

    private Integer month;

    private Integer score;

    private Integer totalScore;

    public String getUserNname() {
        return userNname;
    }

    public void setUserNname(String userNname) {
        this.userNname = userNname;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    private String userNname;

    private String city;

    private String county;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getSeason() {
        return season;
    }

    public void setSeason(Integer season) {
        this.season = season;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    public RankListVo (UserScoreRank info){
        this.setId(info.getId());
        this.setUserId(info.getUserId());
        this.setTotalScore(info.getTotalScore());
    }
}
