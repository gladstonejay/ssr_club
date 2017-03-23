package com.miniclass.service;

/**
 * Created by shuaizhiguo on 2017/3/15.
 */

public interface UserLogService {

    public void logUser(String userId, String userType, int contentTYpe, int contentId);

    public Integer getUserWatchNo(String userId, Integer videoId);

}