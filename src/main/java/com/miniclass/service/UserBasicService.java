package com.miniclass.service;

import com.miniclass.entity.UserBasic;
import com.miniclass.entity.VideoInfo;
import com.miniclass.entity.UserRecord;

import java.util.List;

/**
 * Created by rrd on 2016/4/5.
 */
public interface UserBasicService {

    public int insertNewUser(UserBasic user);

    public int userIdExist(String userId);

    public int userNnameExist(String userNname);

    public int userPasswordExist(String password);

    public int useBlackList(String userName);

    public List<VideoInfo> getAllVideo(String type);

    public List<VideoInfo> getAllDoneVideo(String type);

    public List<UserRecord> getUserDoneClassRecord(String userId);

    public VideoInfo getVideoById(int videoId);

    public int isRecorded(UserRecord userRecord);

    public int insertUserRecord(UserRecord userRecord);

    public int getUserRecordCount(String userId);

    public int getUserExamCount(String userId);

    public UserBasic getUserById(String userId);

    public int updateRealNameAndLocationByUserId(String userId,String realName,String location);


}
