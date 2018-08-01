package com.tech.dao;

import com.tech.pojo.FriendLink;

import java.util.List;

public interface FriendLinkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(FriendLink record);

    int insertSelective(FriendLink record);

    FriendLink selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(FriendLink record);

    int updateByPrimaryKey(FriendLink record);

    List<FriendLink> selectAllFriendLinks();
}