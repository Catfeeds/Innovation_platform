package com.tech.dao;

import com.tech.pojo.Student;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    int deleteByPrimaryKey(String sno);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(String sno);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    Student selectLogin(String sno);

    int updatePasswordBySno(@Param("sno") String sno,@Param("newPwd") String newPwd);

    int selectBySnoAndPwd(@Param("sno") String sno,@Param("oldPwd") String oldPwd);

    Student selectPartBySno(String sno);
}