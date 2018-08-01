package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.AdminMapper;
import com.tech.pojo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
    @Autowired
    AdminMapper adminMapper;

    public ServerResponse<Admin> login(String username, String password) {
        Admin admin = adminMapper.selectLogin(username,password);
        if (admin==null){
            return ServerResponse.createByErrorMessage("用户名或密码错误");
        }
        admin.setPassword(null);
        return ServerResponse.createBySuccess("登录成功",admin);
    }
}
