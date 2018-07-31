package com.tech.pojo;

public class Enroll {
    private Integer id;

    private Integer matchId;

    private Integer groupId;

    private String titleEnroll;

    private String instructor;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMatchId() {
        return matchId;
    }

    public void setMatchId(Integer matchId) {
        this.matchId = matchId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
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
}