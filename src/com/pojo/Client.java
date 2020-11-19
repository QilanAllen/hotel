package com.pojo;

import java.util.Date;

public class Client {
    private Integer id;

    private String idcard;

    private String name;

    private Integer roomnum;

    private Date starttime;

    private String daysum;

    private Integer totalprice;

    private Integer isview;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getRoomnum() {
        return roomnum;
    }

    public void setRoomnum(Integer roomnum) {
        this.roomnum = roomnum;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public String getDaysum() {
        return daysum;
    }

    public void setDaysum(String daysum) {
        this.daysum = daysum == null ? null : daysum.trim();
    }

    public Integer getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Integer totalprice) {
        this.totalprice = totalprice;
    }

    public Integer getIsview() {
        return isview;
    }

    public void setIsview(Integer isview) {
        this.isview = isview;
    }
}