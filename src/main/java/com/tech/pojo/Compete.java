package com.tech.pojo;

import java.util.Date;

public class Compete {
    private Integer id;

    private String nameCompete;

    private Integer levelCompete;

    private String levelName;//管理显示

    private String coverUrl;

    private Date startTime;

    private Date endTime;

    private Date createTime;

    private Date updateTime;

    private String author;

    private String requirement;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameCompete() {
        return nameCompete;
    }

    public void setNameCompete(String nameCompete) {
        this.nameCompete = nameCompete == null ? null : nameCompete.trim();
    }

    public Integer getLevelCompete() {
        return levelCompete;
    }

    public void setLevelCompete(Integer levelCompete) {
        this.levelCompete = levelCompete;
    }

    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl == null ? null : coverUrl.trim();
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement == null ? null : requirement.trim();
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }
}