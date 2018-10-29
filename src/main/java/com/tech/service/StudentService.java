package com.tech.service;

import com.tech.common.ServerResponse;
import com.tech.dao.EnrollMapper;
import com.tech.dao.ExcellentMemberMapper;
import com.tech.dao.MemberMapper;
import com.tech.dao.StudentMapper;
import com.tech.pojo.Student;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class StudentService {
    @Autowired
    StudentMapper studentMapper;
    @Autowired
    MemberMapper memberMapper;
    @Autowired
    EnrollMapper enrollMapper;
    @Autowired
    ExcellentMemberMapper excellentMemberMapper;

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
            s.setGetPrizeCount(excellentMemberMapper.selectGetPrizeCountBySno(s.getSno()));
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

    public ServerResponse<String> updateStudentImg(Student newStudent) {
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

    public ServerResponse checkIsEnroll(String sno, Integer cId) {
        int count = enrollMapper.selectIsEnroll(sno,cId);
        if(count>0){
            return ServerResponse.createByError();
        }else{
            return ServerResponse.createBySuccess();
        }
    }

    public String getSnoBySname(String sname) {
        return studentMapper.selectSnoBySname(sname);
    }

    /**
     * 学生导入
     * @param list
     */
    public void insertList(List<Student> list) {
        for (Student s:list) {
            s.setUpdateTime(new Date());
            s.setPassword("123456");
            if(StringUtils.isBlank(s.getSno())){
                throw new RuntimeException("导入失败!存在学号为空的记录！");
            }
            if(StringUtils.isBlank(s.getNameStudent())){
                throw new RuntimeException("导入失败!存在姓名为空的记录！");
            }
            if(StringUtils.isBlank(s.getClassno())){
                throw new RuntimeException("导入失败!存在班级为空的记录！");
            }
            Integer pid = studentMapper.getProfessionIdByPName(s.getPname());
            if(pid==null){
                throw new RuntimeException("导入失败!专业名称存在错误!");
            }
            s.setProfessionId(pid);
            try {
                studentMapper.insert(s);
            }catch (Exception ex) {
                throw new RuntimeException(s.getNameStudent() + "已存在，数据全部导入失败，请重新尝试!");
            }
        }
    }
}
