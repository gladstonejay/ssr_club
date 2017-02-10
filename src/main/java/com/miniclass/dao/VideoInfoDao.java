package com.miniclass.dao;

import com.miniclass.entity.VideoInfo;
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

    List<VideoInfo> selectAllVideo();

    List<VideoInfo> selectAllDoneVideo();

    VideoInfo getVideoById(Integer videoId);
}