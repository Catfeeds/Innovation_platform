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
        return allMatches;
    }

    public List<Match> getCountMatches(Integer count){
        List<Match> countMatches = matchMapper.selectCountMatches(count);
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
}
