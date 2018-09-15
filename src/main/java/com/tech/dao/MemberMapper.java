package com.tech.dao;

import com.tech.pojo.Member;

import java.util.List;

public interface MemberMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Member record);

    int insertSelective(Member record);

    Member selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);

    int selectCountBySno(String sno);

    int selectMatchPCount(Integer matchID);

    List<Member> selectMembersIncludeNameByGid(Integer groupId);

    Member selectLeaderByGid(Integer groupId);

    List<Member> selectMembersIncludeNamePhoneClassnoByGid(Integer groupId);

    int deleteExpectLeaderByGroupId(Integer groupId);

    String selectLeaderSnoByEnrollid(Integer enrollId);
}