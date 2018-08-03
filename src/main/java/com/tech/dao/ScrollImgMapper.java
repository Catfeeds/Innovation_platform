package com.tech.dao;

import com.tech.pojo.ScrollImg;

import java.util.List;

public interface ScrollImgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ScrollImg record);

    int insertSelective(ScrollImg record);

    ScrollImg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ScrollImg record);

    int updateByPrimaryKey(ScrollImg record);

    List<ScrollImg> selectShowScrollImg();
}