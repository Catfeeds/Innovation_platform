package com.tech.pojo;

import cn.afterturn.easypoi.excel.annotation.Excel;

public class Excellent {
    private Integer id;

    private Integer enrollId;

    @Excel(name="年份")
    private String year;

    @Excel(name="参赛题目")
    private String title;

    private Integer competeId;

    @Excel(name="大赛名称")
    private String competeName;

    private Integer competeLevel;

    @Excel(name="赛事级别")
    private String levelName;

    private Integer prizeId;

    @Excel(name="获奖名次")
    private String prizeName;

    @Excel(name="团队成员")
    private String members;

    @Excel(name="指导老师")
    private String instructor;

    public Integer getEnrollId() {
        return enrollId;
    }

    public void setEnrollId(Integer enrollId) {
        this.enrollId = enrollId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getCompeteId() {
        return competeId;
    }

    public void setCompeteId(Integer competeId) {
        this.competeId = competeId;
    }

    public String getCompeteName() {
        return competeName;
    }

    public void setCompeteName(String competeName) {
        this.competeName = competeName == null ? null : competeName.trim();
    }

    public Integer getCompeteLevel() {
        return competeLevel;
    }

    public void setCompeteLevel(Integer competeLevel) {
        this.competeLevel = competeLevel;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName == null ? null : levelName.trim();
    }

    public Integer getPrizeId() {
        return prizeId;
    }

    public void setPrizeId(Integer prizeId) {
        this.prizeId = prizeId;
    }

    public String getPrizeName() {
        return prizeName;
    }

    public void setPrizeName(String prizeName) {
        this.prizeName = prizeName == null ? null : prizeName.trim();
    }

    public String getMembers() {
        return members;
    }

    public void setMembers(String members) {
        this.members = members == null ? null : members.trim();
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor == null ? null : instructor.trim();
    }

    @Override
    public String toString() {
        return "Excellent{" + "id=" + id + ", enrollId=" + enrollId + ", year='" + year + '\'' + ", title='" + title + '\'' + ", competeId=" + competeId + ", competeName='" + competeName + '\'' + ", competeLevel=" + competeLevel + ", levelName='" + levelName + '\'' + ", prizeId=" + prizeId + ", prizeName='" + prizeName + '\'' + ", members='" + members + '\'' + ", instructor='" + instructor + '\'' + '}';
    }
}