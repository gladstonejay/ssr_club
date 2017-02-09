package com.miniclass.dao;

import com.miniclass.entity.UserBasic;

public interface UserBasicDao {

    int deleteByPrimaryKey(Integer id);

    int insert(UserBasic record);

    int insertSelective(UserBasic record);

    UserBasic selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserBasic record);

    int updateByPrimaryKey(UserBasic record);

    Integer selectUserId(String userId);

    Integer selectUserNname(String userNname);

    Integer selectUserPassword(String password);

    Integer selectUseBlackList(String userId);

    public UserBasic getUserById(String userId);
}