package com.tech.pojo;

import java.util.Date;
import java.util.List;

public class Item {
    private Integer enrollId;
    private Integer competeId;
    private Integer groupId;
    private String competeName;
    private String title;
    private String instructor;
    private String groupName;
    private String grouper;
    private Student leader;
    private List<Member> members;
    private String[] members2;//报名
    private String attachment;
    private Integer status;
    private Integer prizeId;
    private String prizeName;
    private Date updateTime;
    private String year;//作为报名表的年份记录

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
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
        this.prizeName = prizeName;
    }

    public Student getLeader() {
        return leader;
    }

    public void setLeader(Student leader) {
        this.leader = leader;
    }

    public Integer getEnrollId() {
        return enrollId;
    }

    public void setEnrollId(Integer enrollId) {
        this.enrollId = enrollId;
    }

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

    public List<Member> getMembers() {
        return members;
    }

    public void setMembers(List<Member> members) {
        this.members = members;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String[] getMembers2() {
        return members2;
    }

    public void setMembers2(String[] members2) {
        this.members2 = members2;
    }

}
