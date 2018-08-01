package com.tech.controller.adminModular;

import com.tech.common.Const;
import com.tech.common.ServerResponse;
import com.tech.pojo.Admin;
import com.tech.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String adminLogin(String username, String password, HttpSession session){
        ServerResponse<Admin> serverResponse =  adminService.login(username,password);
        if (serverResponse.isSuccess()){
            session.setAttribute(Const.CURRENT_USER,serverResponse.getData());
        }
        return "/Admin/index";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse<String> adminLogout(HttpSession session){
        session.removeAttribute(Const.CURRENT_USER);
        return ServerResponse.createBySuccess("登出成功");
    }

    @RequestMapping("/index")
    public String showIndex(){
        return "";
    }
}
