package com.tech.dao;

import com.tech.pojo.GoodWork;
import org.apache.ibatis.annotations.Param;

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

    int selectAllCount();

    int selectSeachCount(String key);

    List<GoodWork> selectSearch(String key);

    List<GoodWork> selectSearchIndex(@Param("key") String key, @Param("condition_year") String condition_year, @Param("condition_prize") String condition_prize);

    int selectSearchCountIndex(@Param("key") String key, @Param("condition_year") String condition_year, @Param("condition_prize") String condition_prize);
}