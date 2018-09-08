package com.tech.dao;

import com.tech.pojo.Prize;

import java.util.List;

public interface PrizeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Prize record);

    int insertSelective(Prize record);

    Prize selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Prize record);

    int updateByPrimaryKey(Prize record);

    List<Prize> selectAll();

    Integer selectIdByName(String prizeName);
}