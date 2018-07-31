package com.tech.dao;

import com.tech.pojo.Enroll;

public interface EnrollMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Enroll record);

    int insertSelective(Enroll record);

    Enroll selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Enroll record);

    int updateByPrimaryKey(Enroll record);
}