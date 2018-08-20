package com.tech.controller.adminModular;

import com.github.pagehelper.PageHelper;
import com.tech.common.ServerResponse;
import com.tech.pojo.GoodTeacher;
import com.tech.pojo.GoodWork;
import com.tech.service.GoodTeacherService;
import org.nutz.json.Json;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class GoodTeacherController {
    @Autowired
    GoodTeacherService goodTeacherService;

    @RequestMapping("/to_tech_list")
    public String toTechList(){
        return "Admin/teacher_list";
    }

    @RequestMapping("/to_tech_add")
    public String toTechAdd(Model model){
        model.addAttribute("action","add");
        return "Admin/teacher_edit";
    }

    @RequestMapping("/to_tech_edit/{id}")
    public String toTechEdit(Model model,@PathVariable("id") Integer id){
        model.addAttribute("action","edit");
        model.addAttribute("teacher",goodTeacherService.getById(id));
        return "Admin/teacher_edit";
    }

    @RequestMapping(value = "/teacher_list",produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String teacherList(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        int count = goodTeacherService.getAllCount();
        List<GoodTeacher> list = goodTeacherService.getAllGoodTeachers();
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data", list);
        return Json.toJson(map);
    }

    @RequestMapping("/add_teacher")
    @ResponseBody
    public ServerResponse<String> addTeacher(GoodTeacher goodTeacher){
        ServerResponse serverResponse = goodTeacherService.insertGoodTeacher(goodTeacher);
        return serverResponse;
    }

    @RequestMapping("/update_teacher")
    @ResponseBody
    public ServerResponse<String> updateTeacher(GoodTeacher goodTeacher){
        ServerResponse serverResponse = goodTeacherService.updateGoodTeacher(goodTeacher);
        return serverResponse;
    }

    @RequestMapping("/delete_teacher/{id}")
    @ResponseBody
    public ServerResponse<String> deleteTeacher(@PathVariable("id")Integer id){
        ServerResponse serverResponse = goodTeacherService.deleteGoodTeacher(id);
        return serverResponse;
    }
}
