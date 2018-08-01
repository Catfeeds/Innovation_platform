package com.tech.controller.adminModular;

import com.tech.common.ServerResponse;
import com.tech.pojo.GoodTeacher;
import com.tech.service.GoodTeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/manage")
public class GoodTeacherController {
    @Autowired
    GoodTeacherService goodTeacherService;

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

    @RequestMapping("/add_teacher/{id}")
    @ResponseBody
    public ServerResponse<String> addTeacher(@PathVariable("id")Integer id){
        ServerResponse serverResponse = goodTeacherService.deleteGoodTeacher(id);
        return serverResponse;
    }
}
