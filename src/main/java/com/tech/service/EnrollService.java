package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.*;
import com.tech.pojo.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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
    @Autowired
    CompeteMapper competeMapper;

    /**
     * 添加报名表
     * @param item
     * @return
     */
    public ServerResponse<String> addEnroll(Item item){
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
                    if(StringUtils.isEmpty(m))
                        continue;
                    memberMapper.insert(new Member(m,item.getGroupId(),0));
                }
                return ServerResponse.createBySuccessMessage("报名成功");
            }
        }
        return ServerResponse.createByErrorMessage("报名失败");
    }

    /**
     * 修改报名表
     */
    public ServerResponse editEnroll(Item item) {
        //更新组名、成员、附件、指导老师
        int count = groupMapper.updateByPrimaryKey(new Group(item.getGroupId(),item.getGroupName()));
        if(count>0){
            //删除所有组员
            memberMapper.deleteExpectLeaderByGroupId(item.getGroupId());
            String[] members = item.getMembers2();
            for (String m : members) {
                if(StringUtils.isEmpty(m))
                    continue;
                memberMapper.insert(new Member(m,item.getGroupId(),0));
            }
        }else{
            throw new RuntimeException("更新组名时错误");
        }
        Enroll enroll = new Enroll();
        enroll.setId(item.getEnrollId());
        enroll.setInstructor(item.getInstructor());
        enroll.setTitleEnroll(item.getTitle());
        enroll.setAttachment(item.getAttachment());
        enroll.setUpdateTime(new Date());
        count = enrollMapper.updateByPrimaryKeySelective(enroll);
        if (count>0){
             return ServerResponse.createBySuccessMessage("更新成功!");
        }else{
            throw new RuntimeException("更新错误");
        }
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
     * 显示报名表的详细信息
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

    /**
     * 获取已经审核通过的项目
     * @return
     */
    public int getPassItemCount() {
        return enrollMapper.selectPassItemCount();
    }

    public List<Item> getPassEnroll() {
        List<Item> list = enrollMapper.selectPassItem();
        for (Item item:list) {
            List<Member> members  = memberMapper.selectMembersIncludeNameByGid(item.getGroupId());
            item.setMembers(members);
        }
        return list;
    }


    /**
     * 校验时间 以及 参赛题目
     * @param item
     * @return
     */
    public ServerResponse check(Item item) {
        String title = item.getTitle();
        if (!StringUtils.isEmpty(title)&&!StringUtils.isEmpty(item.getGroupName())&&!StringUtils.isEmpty(item.getInstructor())){
            //判断当前是否是编辑还是新增
            if(item.getEnrollId()==null) {
                int count = enrollMapper.selectTitleIsExsit(title);
                if (count > 0) return ServerResponse.createByErrorMessage("参赛标题已存在,请更换重试！");
                count = enrollMapper.selectIsEnroll(item.getGrouper(),item.getCompeteId());
                if (count > 0) return ServerResponse.createByErrorMessage("请勿重复报名");
            }
        }else{
            return ServerResponse.createByErrorMessage("参数不为空");
        }
        //判断是否有重复
        String[] members2 = item.getMembers2();
        List<String> list= new ArrayList<>(Arrays.asList(members2));
        list.add(item.getGrouper());
        HashSet<String> hashSet = new HashSet<>(list);
        if (list.size() != hashSet.size()) {
            return ServerResponse.createByErrorMessage("存在重复的学生");
        }

        Compete compete = competeMapper.selectByPrimaryKey(item.getCompeteId());
        System.out.println(compete.toString());
        Calendar date = Calendar.getInstance();
        Date now = new Date();
        date.setTime(now);
        Calendar after = Calendar.getInstance();
        after.setTime(compete.getStartTime());
        Calendar before = Calendar.getInstance();
        before.setTime(compete.getEndTime());
        if (date.after(after)&&date.before(before)){
            return ServerResponse.createBySuccess("时间校验成功",now);
        }else{
            return ServerResponse.createByErrorDataMessage("报名时间不符",now);
        }
    }



    public int getSearchCount(String key) {
        return enrollMapper.selectSearchCount(key);
    }

    public List<Item> getSeach(String key) {
        List<Item> list = enrollMapper.selectSeach(key);
        for (Item item:list) {
            List<Member> members  = memberMapper.selectMembersIncludeNameByGid(item.getGroupId());
            item.setMembers(members);
        }
        return list;
    }

    /**
     * 获取Enroll ID
     * @param title
     * @return
     */
    public Integer getIdByCIdAndTitle(String title) {
        Integer enrollId = enrollMapper.selectIdByCIdAndTitle(title);
        return enrollId;
    }

    public boolean isLeader(Student student, Item item) {
        return student.getSno().equals(item.getLeader().getSno());
    }

    public boolean isGrouper(Student student, Item item) {
        List<Member> members =  item.getMembers();
        for (Member m:members) {
            if (m.getSno().equals(student.getSno())){
                return true;
            }
        }
        return false;
    }


}
