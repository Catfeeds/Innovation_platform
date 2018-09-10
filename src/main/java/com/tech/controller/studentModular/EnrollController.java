package com.tech.controller.studentModular;

import com.tech.common.Const;
import com.tech.common.ResponseCode;
import com.tech.common.ServerResponse;
import com.tech.pojo.Group;
import com.tech.pojo.Item;
import com.tech.pojo.Student;
import com.tech.service.EnrollService;
import com.tech.service.GroupService;
import com.tech.service.MemberService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/stu")
public class EnrollController {
    @Autowired
    MemberService memberService;
    @Autowired
    GroupService groupService;
    @Autowired
    EnrollService enrollService;

    @RequestMapping("/to_enroll_edit/{id}")
    public String toItemEdit(@PathVariable("id") Integer id, Model model,HttpSession session){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return "redirect:/login.html";
        }
        Item item = enrollService.getItemByEnrollId(id);
        model.addAttribute("item",item);
        if(enrollService.isLeader(student,item)){
            return "Student/enroll_edit";
        }else if (enrollService.isGrouper(student,item)){
            return "Student/enroll_detail";
        }else{
            return "redirect:/login.html";
        }
    }

    /**
     * 学生报名
     * @param item
     * @param session
     * @return
     */
    @RequestMapping("/enroll")
    @ResponseBody
    public ServerResponse enroll(Item item, HttpSession session){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登陆后尝试");
        }
        // 校验时间
        // 判断参赛题目是否重复
        ServerResponse resCheckTime = enrollService.check(item);
        if (!resCheckTime.isSuccess()){
            return resCheckTime;
        }
        item.setGrouper(student.getSno());
        ServerResponse<Group> serverResponse = groupService.addGroup(item.getGroupName());
        if (serverResponse.isSuccess()){
            item.setGroupId(serverResponse.getData().getId());
            ServerResponse serverResponses = enrollService.addEnroll(item);
            return serverResponses;
        }
        return ServerResponse.createByErrorMessage("报名失败");
    }

    @RequestMapping("/to_enroll_list")
    public String toEnroll(){
        return "Student/enroll_list";
    }


    /**
     * 列出个人报名列表  查询视图
     * @param session
     * @return
     */
    @RequestMapping(value = "/enroll_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String enrollList(HttpSession session){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        List<Item> list = enrollService.getEnrollItemBySno(student.getSno());
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",666);
        map.put("data", list);
        return Json.toJson(map);
    }
}
