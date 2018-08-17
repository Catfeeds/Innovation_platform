package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.MemberMapper;
import com.tech.pojo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    MemberMapper memberMapper;

    /**
     * 添加成员 0为组员 1为组长
     * @param sno
     * @param type
     * @return
     */
    public ServerResponse<String> addMember(String sno,Integer groupID,Integer type){
        Member member = new Member(sno,groupID,type);
        int count = memberMapper.insert(member);
        if (count>0){
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }


}
