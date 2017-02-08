package com.miniclass.service.impl;

import com.miniclass.dao.ContentDao;
import com.miniclass.entity.Content;
import com.miniclass.service.UserShareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by shuaizhiguo on 2017/1/6.
 */
@Service
public class UserShareServiceImpl implements UserShareService{


    @Autowired
    private ContentDao contentDao;

    /**
     * 获取某一个类别的所有数据
     * @param type
     * @return
     */
    public List<Content> getContentByType(Integer type){

        return contentDao.getContentByType(type);
    }

    /**
     * 获取某一个类别的某个数据
     * @param type
     * @param item
     * @return
     */
    public Content getContentByTypeAndItem(Integer type, Integer item){

        return contentDao.getContentByTypeAndItem(type,item);
    }
}
