package com.tech.pojo;

import java.util.Arrays;

public class Item {
    private Integer competeId;
    private Integer groupId;
    private String competeName;
    private String title;
    private String instructor;
    private String groupName;
    private String grouper;
    private String[] members;
    private String attachment;
    private Integer status;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCompeteId() {
        return competeId;
    }

    public void setCompeteId(Integer competeId) {
        this.competeId = competeId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getCompeteName() {
        return competeName;
    }

    public void setCompeteName(String competeName) {
        this.competeName = competeName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGrouper() {
        return grouper;
    }

    public void setGrouper(String grouper) {
        this.grouper = grouper;
    }

    public String[] getMembers() {
        return members;
    }

    public void setMembers(String[] members) {
        this.members = members;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }


    @Override
    public String toString() {
        return "Item{" + "competeId=" + competeId + ", groupId=" + groupId + ", competeName='" + competeName + '\'' + ", title='" + title + '\'' + ", instructor='" + instructor + '\'' + ", groupName='" + groupName + '\'' + ", grouper='" + grouper + '\'' + ", members=" + Arrays.toString(members) + ", attachment='" + attachment + '\'' + '}';
    }
}
