package com.tech.pojo;

public class Member {
    private Integer id;

    private String sno;

    private Integer groupId;

    private Integer typeMember;

    private String sname;//方便显示成员使用

    private String classno;

    private String phone;

    public String getClassno() {
        return classno;
    }

    public void setClassno(String classno) {
        this.classno = classno;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public Member(){

    }

    public Member(String sno, Integer groupId, Integer typeMember) {
        this.sno = sno;
        this.groupId = groupId;
        this.typeMember = typeMember;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno == null ? null : sno.trim();
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getTypeMember() {
        return typeMember;
    }

    public void setTypeMember(Integer typeMember) {
        this.typeMember = typeMember;
    }
}