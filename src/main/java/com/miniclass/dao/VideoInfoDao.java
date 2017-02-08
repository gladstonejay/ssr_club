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

    List<VideoInfo> selectAllVideo();

    List<VideoInfo> selectAllDoneVideo();

    int updateByPrimaryKeySelective(VideoInfo record);

    int updateByPrimaryKey(VideoInfo record);

    VideoInfo getVideoById(Integer videoId);
}