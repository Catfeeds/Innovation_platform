package com.tech.pojo;

public class Item {
    private Integer matchId;
    private String title;
    private String instructor;
    private String groupName;
    private String headMan;
    private String[] members;
    private String attachment;

    public Integer getMatchId() {
        return matchId;
    }

    public void setMatchId(Integer matchId) {
        this.matchId = matchId;
    }

    public String getTitle() {
        return title;
    }

    public String getHeadMan() {
        return headMan;
    }

    public void setHeadMan(String headMan) {
        this.headMan = headMan;
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
}
