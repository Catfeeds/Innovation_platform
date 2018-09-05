package com.tech.service;

import com.tech.dao.ExcellentMapper;
import com.tech.dao.MemberMapper;
import com.tech.dao.PrizeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    /**
     * 从vm_excellent查询
     * @param id
     * @return
     */
    public int getNumberOfPeopleByPrizeID(Integer id) {
        int count = excellentMapper.selectNumberOfPeopleByPrizeID(id);
        return count;
    }
}
