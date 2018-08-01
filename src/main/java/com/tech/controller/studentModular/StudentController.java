package com.tech.controller.studentModular;

import com.tech.common.Const;
import com.tech.common.ServerResponse;
import com.tech.pojo.Student;
import com.tech.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    StudentService studentService;

    @RequestMapping("/login")
    @ResponseBody
    public ServerResponse<Student> stuLogin(String sno, String password, HttpSession session){
       ServerResponse<Student> serverResponse = studentService.login(sno,password);
       if (serverResponse.isSuccess()){
           session.setAttribute(Const.CURRENT_USER,serverResponse.getData());
       }
       return serverResponse;
    }

    @RequestMapping("/logout")
    @ResponseBody
    public ServerResponse<String> stuLogout(HttpSession session){
        session.removeAttribute(Const.CURRENT_USER);
        return ServerResponse.createBySuccess("登出成功");
    }

    @RequestMapping("/get_info")
    @ResponseBody
    public ServerResponse<Student> getUser(HttpSession session){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student!=null){
            return ServerResponse.createBySuccess(student);
        }
        return ServerResponse.createByErrorMessage("未登录,获取失败");
    }
}
