package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.ExcellentMemberMapper;
import com.tech.dao.StudentMapper;
import com.tech.pojo.Excellent;
import com.tech.pojo.ExcellentMember;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExcellentMemberService {
    @Autowired
    ExcellentMemberMapper excellentMemberMapper;
    @Autowired
    StudentMapper studentMapper;

    public ServerResponse addExcellentMember(ExcellentMember excellentMember) {
        excellentMemberMapper.insert(excellentMember);
        return ServerResponse.createBySuccess();
    }

    public ServerResponse insert(List<Excellent> list) {
        for (Excellent e:list) {
            String[] members = e.getMembers().trim().split("、");
            ExcellentMember excellentMember;
            String sno;
            for (String name:members) {
                if (StringUtils.isBlank(name))
                    continue;
                sno = studentMapper.selectSnoBySname(name);
                if (sno==null)
                    throw new RuntimeException("学生库中不存在名为:"+name+" 的学生!");
                excellentMember = new ExcellentMember(name,sno,0,e.getId());
                excellentMemberMapper.insert(excellentMember);
            }
        }
        return ServerResponse.createBySuccess();
    }
}
