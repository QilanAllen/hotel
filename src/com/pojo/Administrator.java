package com.pojo;

public class Administrator {
    private Integer id;

    private String name;

    private String countnum;

    private String password;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCountnum() {
        return countnum;
    }

    public void setCountnum(String countnum) {
        this.countnum = countnum == null ? null : countnum.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}