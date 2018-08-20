package com.tech.dao;

import com.tech.pojo.GoodTeacher;

import java.util.List;

public interface GoodTeacherMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GoodTeacher record);

    int insertSelective(GoodTeacher record);

    GoodTeacher selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GoodTeacher record);

    int updateByPrimaryKeyWithBLOBs(GoodTeacher record);

    int updateByPrimaryKey(GoodTeacher record);

    List<GoodTeacher> selectAllGoodTeachers();

    int selectAllCount();
}