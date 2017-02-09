package com.miniclass.dao;

import com.miniclass.entity.Exam;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExamDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Exam record);

    int insertSelective(Exam record);

    Exam selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Exam record);

    int updateByPrimaryKey(Exam record);

    public List<Exam> getAllExam();

    public List<Exam> getOneExam(Integer id);

    public Exam getOneExamContext(@Param("orderId")Integer order_id, @Param("itemId")Integer item_id);
}