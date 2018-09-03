package com.tech.dao;

import com.tech.pojo.Enroll;
import com.tech.pojo.Item;

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

    List<Item> selectPassPrizeItem();
}