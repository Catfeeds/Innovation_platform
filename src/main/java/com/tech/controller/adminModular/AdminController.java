package com.tech.controller.adminModular;

import com.tech.common.Const;
import com.tech.common.ServerResponse;
import com.tech.pojo.Admin;
import com.tech.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<Admin> adminLogin(String username, String password,String vCode, HttpSession session){
//        if(!session.getAttribute("code").equals(vCode.toLowerCase())){
//            return ServerResponse.createByErrorMessage("验证码错误!");
//        }
        ServerResponse<Admin> serverResponse =  adminService.login(username,password);
        if (serverResponse.isSuccess()){
            session.setAttribute(Const.CURRENT_USER,serverResponse.getData());
        }
        return serverResponse;
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String adminLogout(HttpSession session){
        session.removeAttribute(Const.CURRENT_USER);
        return "forward:/login.html";
    }

    @RequestMapping("/index")
    public String showIndex(HttpSession session, Model model){
        try {
            Admin admin = (Admin)session.getAttribute(Const.CURRENT_USER);
            if (admin==null){
                return "forward:/login.html";
            }
            model.addAttribute("admin",admin);
            return "Admin/index";
        }catch (Exception e){
            return "forward:/login.html";
        }
    }
}
