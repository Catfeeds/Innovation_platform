package com.tech.dao;

import com.tech.pojo.Levels;

import java.util.List;
import java.util.logging.Level;

public interface LevelsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Levels record);

    int insertSelective(Levels record);

    Levels selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Levels record);

    int updateByPrimaryKey(Levels record);

    List<Level> selectAll();
}