package com.tech.pojo;

import java.util.Date;

public class Enroll {
    private Integer id;

    private Integer competeId;

    private Integer groupId;

    private Integer status;

    private String titleEnroll;

    private String instructor;

    private String attachment;

    private Date createTime;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTitleEnroll() {
        return titleEnroll;
    }

    public void setTitleEnroll(String titleEnroll) {
        this.titleEnroll = titleEnroll == null ? null : titleEnroll.trim();
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor == null ? null : instructor.trim();
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment == null ? null : attachment.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}