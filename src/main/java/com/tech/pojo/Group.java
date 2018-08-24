package com.tech.pojo;

public class Group {
    private Integer id;

    private String nameGroup;

    public Group(String groupName) {
        this.nameGroup = groupName;
    }

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

    @Override
    public String toString() {
        return "Group{" + "id=" + id + ", nameGroup='" + nameGroup + '\'' + '}';
    }
}