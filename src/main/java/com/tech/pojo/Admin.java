package com.tech.pojo;

public class Admin {
    private Integer id;

    private Integer typeAdmin;

    private String username;

    private String password;

    private String typeAliases;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTypeAdmin() {
        return typeAdmin;
    }

    public void setTypeAdmin(Integer typeAdmin) {
        this.typeAdmin = typeAdmin;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getTypeAliases() {
        return typeAliases;
    }

    public void setTypeAliases(String typeAliases) {
        this.typeAliases = typeAliases == null ? null : typeAliases.trim();
    }
}