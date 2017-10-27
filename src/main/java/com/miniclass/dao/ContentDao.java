package com.miniclass.dao;

import com.miniclass.entity.Content;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContentDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Content record);

    int insertSelective(Content record);

    Content selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Content record);

    int updateByPrimaryKey(Content record);


    /**
     * 获取某一个类别的数据
     * @param type
     * @return
     */
    public List<Content> getContentByType(Integer type);


    /**
     * 搜索结果
     * @param type
     * @return
     */
    public List<Content> getContentByTypeAndWord(@Param("type")Integer type, @Param("word")String word);


    /**
     * 获取某一个类别的某个数据
     * @param type
     * @param item
     * @return
     */
    public Content getContentByTypeAndItem(@Param("type")Integer type, @Param("item")Integer item);
}