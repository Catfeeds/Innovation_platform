package com.tech.service;

import com.tech.dao.ExcellentMapper;
import com.tech.dao.MemberMapper;
import com.tech.pojo.Excellent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TotalService {

    @Autowired
    MemberMapper memberMapper;
    @Autowired
    ExcellentMapper excellentMapper;

    public int getCountBySno(String sno) {
        int count = memberMapper.selectCountBySno(sno);
        return count;
    }

    public int getMatchPCount(Integer matchID) {
        //TODO 修改
        int count = memberMapper.selectMatchPCount(matchID);
        return count;
    }

    public int getNumberOfPeopleByLevelID(Integer id) {
        List<Excellent> list = excellentMapper.selectByLevelId(id);
        int count = 0;
        for (Excellent e:list) {
            String members = e.getMembers();
            String[] strings = members.split("、");
            count += strings.length;
        }
        return count;
    }

    public int getNumberOfItemByLevelID(Integer id) {
        return excellentMapper.selectGetPrizeItemCountByLevelId(id);
    }

    public int getNumberOfPeopleByPrizeIDLevelID(Integer id, Integer levelId) {
        List<Excellent> list = excellentMapper.selectNumberOfPeopleByPrizeIDLevelID(id,levelId);
        int count = 0;
        for (Excellent e:list) {
            String members = e.getMembers();
            String[] strings = members.split("、");
            count += strings.length;
        }
        return count;
    }
}
