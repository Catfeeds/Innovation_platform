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

    List<ScrollImg> selectCoverScrollShow();

    List<ScrollImg> selectTeacherScrollShow();

    int selectAllCount();

    List<ScrollImg> selectAllCoverScroll();

    List<ScrollImg> selectAllTeacherScroll();

    int updateHide(Integer id);

    int updateShow(Integer id);

    int selectCoverScrollCount();

    int selectTeacherScrollCount();

    List<ScrollImg> selectTeacherScrollWithCount(Integer count);
}