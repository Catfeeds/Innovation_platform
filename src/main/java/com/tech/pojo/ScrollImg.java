package com.tech.pojo;

public class ScrollImg {
    private Integer id;

    private String urlImg;

    private String nameImg;

    private Integer isShow;

    private String link;

    private Integer typeScroll;


    public Integer getTypeScroll() {
        return typeScroll;
    }

    public void setTypeScroll(Integer typeScroll) {
        this.typeScroll = typeScroll;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg == null ? null : urlImg.trim();
    }

    public String getNameImg() {
        return nameImg;
    }

    public void setNameImg(String nameImg) {
        this.nameImg = nameImg == null ? null : nameImg.trim();
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }
}