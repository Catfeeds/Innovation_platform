package com.tech.service;

import com.tech.dao.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TotalService {

    @Autowired
    MemberMapper memberMapper;

    public int getCountBySno(String sno) {
        int count = memberMapper.selectCountBySno(sno);
        return count;
    }

    public int getMatchPCount(Integer matchID) {
        //TODO 修改
        int count = memberMapper.selectMatchPCount(matchID);
        return count;
    }
}
