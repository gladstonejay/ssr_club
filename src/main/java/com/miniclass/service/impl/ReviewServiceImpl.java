package com.miniclass.service.impl;

import javax.annotation.Resource;

import com.miniclass.dao.ExamDao;
import com.miniclass.entity.Exam;
import org.springframework.stereotype.Service;
import com.miniclass.entity.QuestionAnswer;
import com.miniclass.dao.QuestionAnswerDao;
import com.miniclass.service.ReviewService;

import java.util.List;
/**
 * Created by shuaizhiguo on 2016/4/11.
 */

@Service
public class ReviewServiceImpl implements ReviewService{

    @Resource
    private QuestionAnswerDao userDao;
    @Resource
    private ExamDao examDao;

    public List<QuestionAnswer> getAllArticle(String type){

        return this.userDao.getAllArticle(type);
    }

    public QuestionAnswer getOneArticle(Integer id, String type){

        return this.userDao.getOneArticle(id,type);
    }
    public List<Exam> getAllExam(Integer type){

        return this.examDao.getAllExam(type);
    }

    public List<Exam> getOneExam(Integer id, Integer type){

        return this.examDao.getOneExam(id, type);
    }

    public Exam getOneExamContext(Integer order_id , Integer item_id ,Integer type){

        return this.examDao.getOneExamContext(order_id, item_id, type);
    }
}
