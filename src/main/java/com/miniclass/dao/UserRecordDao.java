package com.miniclass.dao;

import com.miniclass.entity.UserRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRecordDao {
    int deleteByPrimaryKey(Integer id);

    int insert(UserRecord record);

    int insertSelective(UserRecord record);

    UserRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserRecord record);

    int updateByPrimaryKey(UserRecord record);

    public int isRecord(UserRecord record);

    public int getUserRecordCount(String userId);

    public int getUserExamCount(String userId);

    public List<UserRecord> getUserDoneClassRecord(String userId);

}