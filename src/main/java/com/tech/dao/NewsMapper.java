package com.tech.dao;

import com.tech.pojo.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);

    List<News> selectKindNewsByType(@Param("typeNews") Integer typeNews, @Param("showCount") Integer showCount);

    List<News> selectAllKindNewsByType(Integer typeNews);

    int selectKindNewsCount(Integer typeNew);
}