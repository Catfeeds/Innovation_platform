package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.StudentMapper;
import com.tech.pojo.Student;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {
    @Autowired
    StudentMapper studentMapper;

    public ServerResponse<Student> login(String sno, String password){
        Student student = studentMapper.selectLogin(sno);
        if (student==null){
            return ServerResponse.createByErrorMessage("用户名不存在");
        }
        if (!student.getPassword().equals(password)){
            return ServerResponse.createByErrorMessage("密码错误");
        }
        student.setPassword(StringUtils.EMPTY);
        return ServerResponse.createBySuccess("登录成功",student);
    }
}
