package com.tech.dao;

import com.tech.pojo.GoodWork;

import java.util.List;

public interface GoodWorkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodWork record);

    int insertSelective(GoodWork record);

    GoodWork selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodWork record);

    int updateByPrimaryKeyWithBLOBs(GoodWork record);

    int updateByPrimaryKey(GoodWork record);

    List<GoodWork> selectAllGoodWorks();
}