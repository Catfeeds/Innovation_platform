package com.tech.pojo;

import cn.afterturn.easypoi.excel.annotation.Excel;

public class User {
    @Excel(name="id")
    private Integer id;

    @Excel(name="姓名")
    private String name;

    @Excel(name="年龄")
    private String age;

    @Excel(name="好友")
    private String firend;

    public String getFirend() {
        return firend;
    }

    public void setFirend(String firend) {
        this.firend = firend;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name='" + name + '\'' + ", age='" + age + '\'' + ", firend='" + firend + '\'' + '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

}
