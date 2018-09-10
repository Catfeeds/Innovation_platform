package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.MatchMapper;
import com.tech.pojo.Match;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MatchService {
    @Autowired
    MatchMapper matchMapper;

    public List<Match> getAllMatches(){
        List<Match> allMatches = matchMapper.selectAllMatches();
        String intro ;
        for (Match m:allMatches) {
            intro = m.getIntroduce().replaceAll("<(S*?)[^>]*>.*?|<.*? />", "").replaceAll("&.{2,6}?;", "");
            intro = intro.length()>120?intro.substring(0,120):intro;
            m.setIntroduce(intro);
        }
        return allMatches;
    }

    public List<Match> getCountMatches(Integer count){
        List<Match> countMatches = matchMapper.selectCountMatches(count);
        //过滤HTML
        for (Match m:countMatches) {
            m.setIntroduce(m.getIntroduce().replaceAll("<(S*?)[^>]*>.*?|<.*? />", "").replaceAll("&.{2,6}?;", ""));
        }
        return countMatches;
    }

    public ServerResponse insertMatch(Match match) {
        int count = matchMapper.insert(match);
        if (count>0){
            return ServerResponse.createBySuccessMessage("添加赛事成功");
        }
        return ServerResponse.createByErrorMessage("添加赛事失败");
    }

    public ServerResponse updateMatch(Match match) {
        int count = matchMapper.updateByPrimaryKeySelective(match);
        if (count>0){
            return ServerResponse.createBySuccessMessage("更新赛事成功");
        }
        return ServerResponse.createByErrorMessage("更新赛事失败");
    }

    public ServerResponse deleteMatch(Integer id) {
        int count = matchMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("删除赛事成功");
        }
        return ServerResponse.createByErrorMessage("删除赛事失败");
    }

    public Match getMatch(Integer matchId) {
        Match match = matchMapper.selectByPrimaryKey(matchId);
        return match;
    }

    public int getMatchCount() {
        return matchMapper.selectMatchCount();
    }

    public List<Match> getSearch(String key,Integer condition) {
        List<Match> list = matchMapper.selectSearch(key,condition);
        String intro ;
        for (Match m:list) {
            intro = m.getIntroduce().replaceAll("<(S*?)[^>]*>.*?|<.*? />", "").replaceAll("&.{2,6}?;", "");
            intro = intro.length()>120?intro.substring(0,120):intro;
            m.setIntroduce(intro);
        }
        return list;
    }

    public int getSearchCount(String key,Integer condition) {
        return matchMapper.selectSearchCount(key,condition);
    }
}
