package com.tech.pojo;

import java.util.Date;

public class Student {
    private String sno;

    private String password;

    private String nameStudent;

    private String classno;

    private String phone;

    private String qq;

    private String email;

    private String imgurl;

    private Date updateTime;

    private Integer participateCount;

    private Integer professionId;

    private String pname;

    public Integer getProfessionId() {
        return professionId;
    }

    public void setProfessionId(Integer professionId) {
        this.professionId = professionId;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getParticipateCount() {
        return participateCount;
    }

    public void setParticipateCount(Integer participateCount) {
        this.participateCount = participateCount;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno == null ? null : sno.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNameStudent() {
        return nameStudent;
    }

    public void setNameStudent(String nameStudent) {
        this.nameStudent = nameStudent == null ? null : nameStudent.trim();
    }

    public String getClassno() {
        return classno;
    }

    public void setClassno(String classno) {
        this.classno = classno == null ? null : classno.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Student{" + "sno='" + sno + '\'' + ", password='" + password + '\'' + ", nameStudent='" + nameStudent + '\'' + ", classno='" + classno + '\'' + ", phone='" + phone + '\'' + ", qq='" + qq + '\'' + ", email='" + email + '\'' + ", imgurl='" + imgurl + '\'' + ", updateTime=" + updateTime + ", participateCount=" + participateCount + ", professionId=" + professionId + ", pname='" + pname + '\'' + '}';
    }
}