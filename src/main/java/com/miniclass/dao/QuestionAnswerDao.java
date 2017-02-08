package com.miniclass.dao;

import com.miniclass.entity.QuestionAnswer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionAnswerDao {

    int deleteByPrimaryKey(Integer id);

    int insert(QuestionAnswer record);

    int insertSelective(QuestionAnswer record);

    QuestionAnswer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QuestionAnswer record);

    int updateByPrimaryKeyWithBLOBs(QuestionAnswer record);

    int updateByPrimaryKey(QuestionAnswer record);

    List<QuestionAnswer> getAllArticle(String type);

    public QuestionAnswer getOneArticle( @Param("itemId")Integer id, @Param("type") String type);
}