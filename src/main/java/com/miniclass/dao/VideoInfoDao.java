package com.miniclass.dao;

import com.miniclass.entity.VideoInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoInfoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(VideoInfo record);

    int insertSelective(VideoInfo record);

    VideoInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VideoInfo record);

    int updateByPrimaryKey(VideoInfo record);

    List<VideoInfo> selectAllVideo(@Param("type")String type);

    List<VideoInfo> selectAllDoneVideo(@Param("type")String type);

    VideoInfo getVideoById(Integer videoId);

    List<VideoInfo> getSearchVideo(@Param("word")String word);
}