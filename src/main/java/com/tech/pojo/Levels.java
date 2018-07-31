package com.tech.pojo;

public class Levels {
    private Integer id;

    private Integer levelGrade;

    private String levelName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLevelGrade() {
        return levelGrade;
    }

    public void setLevelGrade(Integer levelGrade) {
        this.levelGrade = levelGrade;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName == null ? null : levelName.trim();
    }
}