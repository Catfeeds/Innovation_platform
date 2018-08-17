package com.tech.dao;

import com.tech.pojo.Member;

public interface MemberMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);

    int selectCountBySno(String sno);

    int selectMatchPCount(Integer matchID);
}