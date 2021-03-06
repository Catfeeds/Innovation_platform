package com.tech.pojo;

import cn.afterturn.easypoi.excel.annotation.Excel;

import java.util.Date;

public class Student {
    @Excel(name="学号")
    private String sno;

    private String password;

    @Excel(name="姓名")
    private String nameStudent;

    @Excel(name="班级")
    private String classno;

    @Excel(name="电话")
    private String phone;

    @Excel(name="QQ")
    private String qq;

    @Excel(name="邮箱")
    private String email;

    private String imgurl;

    private Date updateTime;

    private Integer participateCount;

    private Integer getPrizeCount;

    private Integer professionId;

    @Excel(name="专业")
    private String pname;

    public Integer getGetPrizeCount() {
        return getPrizeCount;
    }

    public void setGetPrizeCount(Integer getPrizeCount) {
        this.getPrizeCount = getPrizeCount;
    }

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