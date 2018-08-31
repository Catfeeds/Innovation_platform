package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.EnrollMapper;
import com.tech.dao.GroupMapper;
import com.tech.dao.MemberMapper;
import com.tech.dao.StudentMapper;
import com.tech.pojo.Enroll;
import com.tech.pojo.Item;
import com.tech.pojo.Member;
import com.tech.pojo.Student;
import org.apache.commons.lang.StringUtils;
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
    @Autowired
    StudentMapper studentMapper;

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
        //设置报名状态
        enroll.setStatus(0);
        int count = enrollMapper.insert(enroll);
        if (count > 0){
            //添加成员  1-队长  0-队员
            Member member = new Member(item.getGrouper(),item.getGroupId(),1);
            count = memberMapper.insert(member);
            String[] members2 = item.getMembers2();
            if (count>0){
                for (String m : members2) {
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

    /**
     * 从视图中查询 (管理员模块) All
     * @return
     */
    public List<Item> getAllEnroll() {
        List<Item> list = enrollMapper.selectAllItem();
        for (Item item:list) {
            List<Member> members  = memberMapper.selectMembersIncludeNameByGid(item.getGroupId());
            item.setMembers(members);
        }
        return list;
    }

    /**
     * 从视图中查询 (学生模块) Part
     * @param sno
     * @return
     */
    public List<Item> getEnrollItemBySno(String sno) {
        List<Item> list = enrollMapper.selectItemFromVmBySno(sno);
        for (Item item:list) {
            List<Member> members  = memberMapper.selectMembersIncludeNameByGid(item.getGroupId());
            item.setMembers(members);
        }
        return list;
    }

    /**
     * 显示详细信息
     * @param id
     * @return
     */
    public Item getItemByEnrollId(Integer id) {
        Item item = enrollMapper.selectItemByEnrollId(id);
        //获取组长
        Member member =  memberMapper.selectLeaderByGid(item.getGroupId());
        Student leader = studentMapper.selectInfoExceptPwdBySno(member.getSno());
        item.setLeader(leader);
        //获取组员(不包括组长)
        List<Member> members = memberMapper.selectMembersIncludeNamePhoneClassnoByGid(item.getGroupId());
        item.setMembers(members);
        return item;
    }

    public ServerResponse agreeEnroll(Integer id) {
        int count = enrollMapper.agreeEnroll(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("同意成功");
        }else{
            return ServerResponse.createByErrorMessage("同意失败");
        }
    }

    public ServerResponse refuseEnroll(Integer id) {
        int count = enrollMapper.refuseEnroll(id);
        if (count>0){
            return ServerResponse.createBySuccessMessage("拒绝成功");
        }else{
            return ServerResponse.createByErrorMessage("拒绝失败");
        }
    }
}
