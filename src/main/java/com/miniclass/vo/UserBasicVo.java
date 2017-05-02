package com.miniclass.vo;

import java.util.Date;

/**
 * Created by rrd on 2016/4/9.
 */
public class UserBasicVo extends Vo {

    private Integer id;

    private String userId;

    private String userType;

    private String password;

    private String passwordSure;

    private String code;

    private Date registTime;

    private String locationDetail;

    private String realName;

    public String getLocationDetail() {
        return locationDetail;
    }

    public void setLocationDetail(String locationDetail) {
        this.locationDetail = locationDetail;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

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

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType == null ? null : userType.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPasswordSure() {
        return passwordSure;
    }

    public void setPasswordSure(String passwordSure) {
        this.passwordSure = passwordSure == null ? null : passwordSure.trim();
    }

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    public String getCode() { return code;}

    public void setCode(String code) { this.code = code == null ? null : code.trim();}
}
