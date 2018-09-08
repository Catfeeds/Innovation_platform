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

    String selectTypeName(Integer typeNewsId);

    String selectTypeNameByNewsId(Integer newsID);

    List<News> selectSearchNewsByKey(@Param("key") String key, @Param("newsTypeId") Integer newsTypeId);

    int selectSearchNewsByKeyCount(@Param("key") String key, @Param("newsTypeId") Integer newsTypeId);
}