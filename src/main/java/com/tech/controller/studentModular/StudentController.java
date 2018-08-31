package com.tech.controller.studentModular;

import com.tech.common.Const;
import com.tech.common.ResponseCode;
import com.tech.common.ServerResponse;
import com.tech.pojo.Student;
import com.tech.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/stu")
public class StudentController {
    @Autowired
    StudentService studentService;

    @RequestMapping("/main")
    public String toMain(){
        //TODO 共享页面
        return "main";
    }

    @RequestMapping("/index")
    public String index(Model model, HttpSession session){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return "forward:/login.html";
        }
        model.addAttribute("student",(Student)session.getAttribute(Const.CURRENT_USER));
        return "Student/index";
    }

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
    public String stuLogout(HttpSession session){
        session.removeAttribute(Const.CURRENT_USER);
        return "forward:/login.html";
    }

    @RequestMapping("/stuInfo")
    public String getUserInfo(HttpSession session,Model model){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return "forward:/login.html";
        }
        model.addAttribute("stu",studentService.getInfoExceptPwdBySno(student.getSno()));
        return "Student/stu_info";
    }

    /**
     * 通过session获取当前用户信息
     * @param session
     * @return
     */
    @RequestMapping("/get_info")
    @ResponseBody
    public ServerResponse<Student> getUserInfo2(HttpSession session){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student!=null){
            return ServerResponse.createBySuccess(student);
        }
        return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登录后重新尝试");
    }

    /**
     * 通过学号获取学生部分信息 用于报名时
     * @param session
     * @param sno
     * @return
     */
    @RequestMapping("/get_info2")
    @ResponseBody
    public ServerResponse<Student> getUserInfoBySno(HttpSession session,String sno){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登录后重新尝试");
        }
        ServerResponse<Student> serverResponse = studentService.getInfoBySno(sno);
        return serverResponse;
    }

    @RequestMapping("/changePwd")
    public String toChangePwd(Model model, HttpSession session){
        Student student = (Student)session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return "forward:/login.html";
        }
        model.addAttribute("stu",student);
        return "Student/change_pwd";
    }

    @RequestMapping("/change_pwd")
    @ResponseBody
    public ServerResponse<String> changePwd(String oldPwd,String newPwd,HttpSession session){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登录后重新尝试");
        }
        ServerResponse<String> serverResponse = studentService.checkOldPwd(student.getSno(),oldPwd);
        if (serverResponse.isSuccess()) {
            System.out.println(serverResponse.getMsg());
            serverResponse = studentService.changePassword(student.getSno(), newPwd);
        }
        return serverResponse;
    }

    /**
     * 修改个人部分信息  安全问题 修改之后重新设置session
     */
    @RequestMapping("/change_info")
    @ResponseBody
    public ServerResponse<String> modifyInfo(HttpSession session,Student s){
        s.setNameStudent(null);
        s.setPassword(null);
        s.setClassno(null);
        s.setUpdateTime(new Date());
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登录后重新尝试");
        }
        if (!s.getSno().equals(student.getSno())){
            return ServerResponse.createByErrorMessage("账户不一致");
        }
        ServerResponse<String> serverResponse = studentService.changePersonalInfo(s);
        return serverResponse;
    }
}
