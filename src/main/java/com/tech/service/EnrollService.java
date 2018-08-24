package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.EnrollMapper;
import com.tech.dao.GroupMapper;
import com.tech.dao.MemberMapper;
import com.tech.pojo.Enroll;
import com.tech.pojo.Item;
import com.tech.pojo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class EnrollService {
    @Autowired
    EnrollMapper enrollMapper;
    @Autowired
    GroupMapper groupMapper;
    @Autowired
    MemberMapper memberMapper;

    public ServerResponse<String> addEnroll(Item item){
        //添加报名表
        Enroll enroll = new Enroll();
        enroll.setGroupId(item.getGroupId());
        enroll.setAttachment(item.getAttachment());
        enroll.setInstructor(item.getInstructor());
        enroll.setCompeteId(item.getCompeteId());
        enroll.setTitleEnroll(item.getTitle());
        enroll.setCreateTime(new Date());
        enroll.setUpdateTime(new Date());
        int count = enrollMapper.insert(enroll);
        if (count > 0){
            //添加成员  1-队长  0-队员
            Member member = new Member(item.getGrouper(),item.getGroupId(),1);
            count = memberMapper.insert(member);
            String[] members = item.getMembers();
            if (count>0){
                for (String m : members) {
                    memberMapper.insert(new Member(m,item.getGroupId(),0));
                }
                return ServerResponse.createBySuccessMessage("报名成功");
            }
        }
        return ServerResponse.createByErrorMessage("报名失败");
    }

    public int getAllCount() {
        return enrollMapper.selectAllCount();
    }

    public List<Enroll> getAllEnroll() {
        return enrollMapper.selectAllEnroll();
    }


}
