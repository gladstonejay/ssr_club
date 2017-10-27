package com.miniclass.service;

import com.miniclass.entity.Content;

import java.util.List;

/**
 * Created by shuaizhiguo on 2017/1/6.
 */
public interface UserShareService {

    /**
     * 获取某一个类别的所有数据
     * @param type
     * @return
     */
    public List<Content> getContentByType(Integer type);

    /**
     * 搜索
     * @param type
     * @return
     */
    public List<Content> getContentByTypeAndWord(Integer type, String word);

    /**
     * 获取某一个类别的某个数据
     * @param type
     * @param item
     * @return
     */
    public Content getContentByTypeAndItem(Integer type, Integer item);
}
