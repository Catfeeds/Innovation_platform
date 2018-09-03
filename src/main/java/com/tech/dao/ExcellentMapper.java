package com.tech.dao;

import com.tech.pojo.Excellent;

import java.util.List;

public interface ExcellentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Excellent record);

    int insertSelective(Excellent record);

    Excellent selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Excellent record);

    int updateByPrimaryKeyWithBLOBs(Excellent record);

    int updateByPrimaryKey(Excellent record);

    int selectAllCount();

    List<Excellent> selectAll();

    Excellent selectByPrimaryKeyWithTitle(Integer id);
}