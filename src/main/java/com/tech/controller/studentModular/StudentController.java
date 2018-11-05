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
import org.springframework.web.bind.annotation.RequestParam;
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
    public ServerResponse<Student> stuLogin(String username, String password, @RequestParam(required = false) String vCode, HttpSession session){
//        if (vCode!=null){
//            if(!session.getAttribute("code").equals(vCode.toLowerCase())){
//                return ServerResponse.createByErrorMessage("验证码错误!");
//            }
//        }
       ServerResponse<Student> serverResponse = studentService.login(username,password);
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
     * 通过学号获取学生部分信息 用于报名时  且判断该学生是否已经报名参加过该项目tips
     * @param sno
     * @return
     */
    @RequestMapping("/get_info2")
    @ResponseBody
    public ServerResponse<Student> getUserInfoBySno(HttpSession session,String sno,Integer cId){
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return ServerResponse.createByErrorMessage("请登录");
        }
        if (sno.equals(student.getSno())){
            return ServerResponse.createByErrorMessage("请不要重复填写");
        }
        ServerResponse serverResponse = studentService.checkIsEnroll(sno,cId);
        if (!serverResponse.isSuccess()){
            return ServerResponse.createByErrorMessage(sno+":已经参加过该大赛!");
        }
        return studentService.getInfoBySno(sno);
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
    public ServerResponse<String> changePwd(String oldPwd,String newPwd,String confirmPwd,HttpSession session){
        try {
            if (!confirmPwd.equals(newPwd)){
                return ServerResponse.createBySuccessMessage("两次密码校验失败");
            }
            String regex = "[0-9A-Za-z]{6,16}";
            if (!newPwd.matches(regex)){
                return ServerResponse.createByErrorMessage("密码只能由6-16位数字或字母组成");
            }
        }catch (NullPointerException e){
            return ServerResponse.createBySuccessMessage("密码不能为空！");
        }catch (Exception ex){
            return ServerResponse.createByErrorMessage("未知错误");
        }
        Student student = (Student) session.getAttribute(Const.CURRENT_USER);
        if (student==null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"请登录后重新尝试");
        }
        ServerResponse<String> serverResponse = studentService.checkOldPwd(student.getSno(),oldPwd);
        if (serverResponse.isSuccess()) {
            serverResponse = studentService.changePassword(student.getSno(), newPwd);
        }
        return serverResponse;
    }

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
        return studentService.changePersonalInfo(s);
    }
}
