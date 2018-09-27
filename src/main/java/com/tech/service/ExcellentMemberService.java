package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.ExcellentMemberMapper;
import com.tech.pojo.ExcellentMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExcellentMemberService {
    @Autowired
    ExcellentMemberMapper excellentMemberMapper;


    public ServerResponse addExcellentMember(ExcellentMember excellentMember) {
        excellentMemberMapper.insert(excellentMember);
        return ServerResponse.createBySuccess();
    }
}
