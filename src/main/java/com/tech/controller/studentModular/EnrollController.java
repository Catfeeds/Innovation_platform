package com.tech.controller.studentModular;

import com.tech.common.Const;
import com.tech.common.ResponseCode;
import com.tech.common.ServerResponse;
import com.tech.pojo.Enroll;
import com.tech.pojo.Group;
import com.tech.pojo.Item;
import com.tech.pojo.Student;
import com.tech.service.EnrollService;
import com.tech.service.GroupService;
import com.tech.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/student")
public class EnrollController {
    @Autowired
    MemberService memberService;
    @Autowired
    GroupService groupService;
    @Autowired
    EnrollService enrollService;

    @RequestMapping("/enroll")
    @ResponseBody
    public ServerResponse<Item> enroll(Item item, HttpSession session){
        //获取组长
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登陆后尝试");
        }
        item.setHeadMan(student.getSno());
        //创建一个组  返回组id
        Group group = groupService.addGroup(item.getGroupName());

        //创建一个enroll
        Enroll enroll = new Enroll();
        enroll.setGroupId(group.getId());
        enroll.setAttachment(item.getAttachment());
        enroll.setInstructor(item.getInstructor());
        enroll.setMatchId(item.getMatchId());
        enroll.setTitleEnroll(item.getTitle());
        enroll.setCreateTime(new Date());
        enroll.setUpdateTime(new Date());
        ServerResponse serverResponse = enrollService.addEnroll(enroll);

        if (serverResponse.isSuccess()) {
            memberService.addMember(item.getHeadMan(), group.getId(), 1);
            String[] members = item.getMembers();
            for (String member : members) {
                memberService.addMember(member,group.getId(),0);
            }
        }
        return ServerResponse.createBySuccess("报名成功",item);
    }

    //test
    @RequestMapping("/add_group")
    @ResponseBody
    public ServerResponse<Group> addTest(){
        Group group =  groupService.addGroup("组名测试");
        return ServerResponse.createBySuccess(group);
    }
}
