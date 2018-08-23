package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.pojo.Student;
import com.tech.service.EnrollService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class StuEnrollController {
    @Autowired
    EnrollService enrollService;

    @RequestMapping("/to_itemEnroll_list")
    public String toItemEnrollList(){
        return "Admin/itemEnroll_list";
    }

    @RequestMapping(value = "/itemEnroll_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String itemEnrollList(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
//        int count = enrollService.getAllCount();
//        List<Student> list = enrollService.getAllStudent();
//        Map<String, Object> map = new HashMap<>();
//        map.put("code",0);
//        map.put("msg","");
//        map.put("count",count);
//        map.put("data", list);
        return Json.toJson("");
    }
}
