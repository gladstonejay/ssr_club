package com.miniclass.dao;

import com.miniclass.entity.UserBasic;
import org.apache.ibatis.annotations.Param;

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

    public int updateRealNameAndLocationByUserId(@Param("userId")String userId, @Param("realName")String realName,@Param("location")String location);

    public int updateUserType4Info(@Param("userId")String userId,@Param("realName")String realName,@Param("province")String pro,@Param("city")String city,@Param("county")String county,@Param("location")String location);
}