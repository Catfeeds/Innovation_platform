package com.tech.pojo;

public class Group {
    private Integer id;

    private String nameGroup;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameGroup() {
        return nameGroup;
    }

    public void setNameGroup(String nameGroup) {
        this.nameGroup = nameGroup == null ? null : nameGroup.trim();
    }
}