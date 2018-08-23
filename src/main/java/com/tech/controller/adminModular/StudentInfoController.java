package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.pojo.Student;
import com.tech.service.StudentService;
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
public class StudentInfoController {
    @Autowired
    StudentService studentService;

    @RequestMapping("/to_student_info_list")
    public String toShowStudentInfo(){
        return "Admin/student_info_list";
    }

    @RequestMapping(value = "/student_info_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String studentInfoList(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        int count = studentService.getAllCount();
        List<Student> list = studentService.getAllStudent();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }


}
