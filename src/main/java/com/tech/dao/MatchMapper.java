package com.tech.dao;

import com.tech.pojo.Match;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MatchMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Match record);

    int insertSelective(Match record);

    Match selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Match record);

    int updateByPrimaryKeyWithBLOBs(Match record);

    int updateByPrimaryKey(Match record);

    List<Match> selectAllMatches();

    List<Match> selectCountMatches(Integer count);

    int selectMatchCount();

    List<Match> selectSearch(@Param("key") String key,@Param("condition") Integer condition);

    int selectSearchCount(@Param("key") String key,@Param("condition") Integer condition);
}