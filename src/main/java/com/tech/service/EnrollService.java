package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.*;
import com.tech.pojo.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
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
    @Autowired
    CompeteMapper competeMapper;

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
                    if(StringUtils.isEmpty(m))
                        break;
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

    public Enroll getEnrollById(Integer id) {
        return enrollMapper.selectByPrimaryKey(id);
    }

    public int getPassPrizeItemCount() {
        return enrollMapper.selectPassPrizeItemCount();
    }

    public List<Item> getPassPrizeItem() {
        List<Item> list = enrollMapper.selectPassPrizeItem();
        for (Item item:list) {
            List<Member> members  = memberMapper.selectMembersIncludeNameByGid(item.getGroupId());
            item.setMembers(members);
        }
        return list;
    }

    public ServerResponse checkTime(Item item) {
        Compete compete = competeMapper.selectByPrimaryKey(item.getCompeteId());
        Calendar date = Calendar.getInstance();
        Date now = new Date();
        date.setTime(now);

        Calendar after = Calendar.getInstance();
        after.setTime(compete.getStartTime());

        Calendar before = Calendar.getInstance();
        before.setTime(compete.getEndTime());

        if (date.after(after)&&date.before(before)){
            return ServerResponse.createBySuccess("时间校验成功,当前系统时间"+now,now);
        }else{
            return ServerResponse.createByErrorDataMessage("时间校验成功,当前系统时间"+now,now);
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
     * @param competeId
     * @param title
     * @return
     */
    public Integer getIdByCIdAndTitle(Integer competeId, String title) {
        return enrollMapper.selectIdByCIdAndTitle(competeId,title);
    }
}
