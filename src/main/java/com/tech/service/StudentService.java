package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.MemberMapper;
import com.tech.dao.StudentMapper;
import com.tech.pojo.Student;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    StudentMapper studentMapper;
    @Autowired
    MemberMapper memberMapper;

    public ServerResponse<Student> login(String sno, String password){
        Student student = studentMapper.selectLogin(sno);
        if (student==null){
            return ServerResponse.createByErrorMessage("用户名不存在!");
        }
        if (!student.getPassword().equals(password)){
            return ServerResponse.createByErrorMessage("密码错误!");
        }
        student.setPassword(StringUtils.EMPTY);
        return ServerResponse.createBySuccess("登录成功",student);
    }

    public ServerResponse<String> changePassword(String sno,String newPwd) {
         int count = studentMapper.updatePasswordBySno(sno,newPwd);
         if (count>0){
            return ServerResponse.createBySuccessMessage("修改成功");
        }
         return ServerResponse.createByErrorMessage("修改失败");
    }

    public ServerResponse<String> checkOldPwd(String sno, String oldPwd) {
        int count =  studentMapper.selectBySnoAndPwd(sno,oldPwd);
        if (count>0){
            return ServerResponse.createBySuccessMessage("旧密码校验成功");
        }
        return ServerResponse.createByErrorMessage("旧密码校验失败");
    }

    public ServerResponse<Student> getInfoBySno(String sno) {
        Student student = studentMapper.selectPartBySno(sno);
        if(student==null){
            return ServerResponse.createByErrorMessage("查询不到该学号学生:"+sno);
        }
        return ServerResponse.createBySuccess("查询成功",student);
    }

    public int getAllCount() {
        return studentMapper.selectAllCount();
    }

    public List<Student> getAllStudent() {
        List<Student> list = studentMapper.selectAllStudent();
        for (Student s:list) {
            s.setParticipateCount(memberMapper.selectCountBySno(s.getSno()));
        }
        return list;
    }

    public ServerResponse<String> changePersonalInfo(Student student) {
        int count =  studentMapper.updateByPrimaryKeySelective(student);
        if (count>0){
            return ServerResponse.createBySuccessMessage("修改成功");
        }
        return ServerResponse.createByErrorMessage("修改失败");
    }

    public Student getInfoExceptPwdBySno(String sno) {
        return studentMapper.selectInfoExceptPwdBySno(sno);
    }

    public ServerResponse updateStudentImg(Student newStudent) {
        int count = studentMapper.updateByPrimaryKeySelective(newStudent);
        if (count>0){
            return ServerResponse.createBySuccessMessage("更新头像更改");
        }
        return ServerResponse.createByErrorMessage("更新头像失败");
    }

    public int getSearchCount(String key) {
        return studentMapper.selectSearchCount(key);
    }

    public List<Student> getSearch(String key) {
        List<Student> list = studentMapper.selectSearch(key);
        for (Student s:list) {
            s.setParticipateCount(memberMapper.selectCountBySno(s.getSno()));
        }
        return list;
    }
}
