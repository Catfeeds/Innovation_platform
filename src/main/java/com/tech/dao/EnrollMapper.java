package com.tech.dao;

import com.tech.pojo.Enroll;
import com.tech.pojo.Item;
import com.tech.pojo.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EnrollMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Enroll record);

    int insertSelective(Enroll record);

    Enroll selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Enroll record);

    int updateByPrimaryKey(Enroll record);

    int selectAllCount();

    List<Enroll> selectAllEnroll();

    List<Item> selectAllItem();

    List<Item> selectItemFromVmBySno(String sno);

    Item selectItemByEnrollId(Integer id);

    int agreeEnroll(Integer id);

    int refuseEnroll(Integer id);

    int selectPassItemCount();

    List<Item> selectPassItem();

    int selectPassPrizeItemCount();

    int selectSearchCount(String key);

    List<Item> selectSeach(String key);

    Integer selectIdByCIdAndTitle(String title);

    int selectTitleIsExsit(String title);

    int selectIsEnroll(@Param("sno") String sno,@Param("competeId") Integer competeId);

}