package com.tech.pojo;

public class Member {
    private Integer id;

    private String sno;

    private Integer groupId;

    private Integer typeMember;

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