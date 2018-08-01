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
            return ServerResponse.createBySuccessMessage("add_success");
        }
        return ServerResponse.createByErrorMessage("add_fail");
    }

    public ServerResponse updateMatch(Match match) {
        int count = matchMapper.updateByPrimaryKeySelective(match);
        if (count>0){
            return ServerResponse.createBySuccessMessage("update_success");
        }
        return ServerResponse.createByErrorMessage("update_fail");
    }

    public ServerResponse deleteMatch(Integer id) {
        int count = matchMapper.deleteByPrimaryKey(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("delete_success");
        }
        return ServerResponse.createByErrorMessage("delete_fail");
    }
}
