package com.tech.dao;

import com.tech.pojo.ExcellentMember;
import com.tech.pojo.Member;

import java.util.List;

public interface ExcellentMemberMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ExcellentMember record);

    int insertSelective(ExcellentMember record);

    ExcellentMember selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ExcellentMember record);

    int updateByPrimaryKey(ExcellentMember record);

    Integer selectGetPrizeCountBySno(String sno);

    List<Member> selectMembersIncludeNameByExcellentId(Integer id);
}