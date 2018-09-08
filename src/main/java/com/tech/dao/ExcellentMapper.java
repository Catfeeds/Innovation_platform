package com.tech.dao;

import com.tech.pojo.Excellent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExcellentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Excellent record);

    int insertSelective(Excellent record);

    Excellent selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Excellent record);

    int updateByPrimaryKey(Excellent record);

    int selectAllCount();

    List<Excellent> selectAll();

    List<Excellent> selectByLevelId(Integer id);

    int selectGetPrizeItemCountByLevelId(Integer id);

    List<Excellent> selectNumberOfPeopleByPrizeIDLevelID(@Param("prizeId") Integer id,@Param("levelId") Integer levelId);
}