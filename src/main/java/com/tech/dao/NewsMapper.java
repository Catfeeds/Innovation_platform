package com.tech.dao;

import com.tech.pojo.News;

import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);

    List<News> selectKindNewsByType(Integer typeNews, Integer showCount);

    List<News> selectAllKindNewsByType(Integer typeNews);
}