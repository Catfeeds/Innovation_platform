package com.tech.pojo;

import java.util.Date;

public class Match {
    private Integer id;

    private Integer levelMatch;

    private String nameMatch;

    private String imgUrl;

    private String linkUrl;

    private Date createTime;

    private Date updateTime;

    private Integer clicks;

    private Integer priority;

    private Date startTime;

    private Date endTime;

    private String introduce;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevelMatch() {
        return levelMatch;
    }

    public void setLevelMatch(Integer levelMatch) {
        this.levelMatch = levelMatch;
    }

    public String getNameMatch() {
        return nameMatch;
    }

    public void setNameMatch(String nameMatch) {
        this.nameMatch = nameMatch == null ? null : nameMatch.trim();
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl == null ? null : linkUrl.trim();
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

    public Integer getClicks() {
        return clicks;
    }

    public void setClicks(Integer clicks) {
        this.clicks = clicks;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
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

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    @Override
    public String toString() {
        return "Match{" + "id=" + id + ", levelMatch=" + levelMatch + ", nameMatch='" + nameMatch + '\'' + ", imgUrl='" + imgUrl + '\'' + ", linkUrl='" + linkUrl + '\'' + ", createTime=" + createTime + ", updateTime=" + updateTime + ", clicks=" + clicks + ", priority=" + priority + ", startTime=" + startTime + ", endTime=" + endTime + ", introduce='" + introduce + '\'' + '}';
    }
}