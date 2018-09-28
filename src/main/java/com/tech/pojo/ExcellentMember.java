package com.tech.pojo;

public class ExcellentMember {
    private Integer id;

    private String sname;

    private String sno;

    private Integer sType;

    private Integer excellentId;

    public ExcellentMember() {
    }

    public ExcellentMember(String sname, String sno, Integer sType, Integer excellentId) {
        this.sname = sname;
        this.sno = sno;
        this.sType = sType;
        this.excellentId = excellentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname == null ? null : sname.trim();
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno == null ? null : sno.trim();
    }

    public Integer getsType() {
        return sType;
    }

    public void setsType(Integer sType) {
        this.sType = sType;
    }

    public Integer getExcellentId() {
        return excellentId;
    }

    public void setExcellentId(Integer excellentId) {
        this.excellentId = excellentId;
    }
}