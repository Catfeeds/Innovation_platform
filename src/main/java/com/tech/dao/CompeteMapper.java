package com.tech.dao;

import com.tech.pojo.Compete;

import java.util.List;

public interface CompeteMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Compete record);

    int insertSelective(Compete record);

    Compete selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Compete record);

    int updateByPrimaryKeyWithBLOBs(Compete record);

    int updateByPrimaryKey(Compete record);

    int selectAllCount();

    List<Compete> selectAllCompete();

    Integer selectIdByName(String competeName);
}