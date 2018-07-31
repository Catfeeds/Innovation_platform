package com.tech.pojo;

public class FriendLink {
    private Integer id;

    private String nameLink;

    private String url;

    private String logo;

    private Integer sortLink;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNameLink() {
        return nameLink;
    }

    public void setNameLink(String nameLink) {
        this.nameLink = nameLink == null ? null : nameLink.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public Integer getSortLink() {
        return sortLink;
    }

    public void setSortLink(Integer sortLink) {
        this.sortLink = sortLink;
    }
}