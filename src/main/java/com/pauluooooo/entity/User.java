package com.pauluooooo.entity;

import java.io.Serializable;

public class User implements Serializable {
    private String username;
    private String userpass;
    private int role;
    private String regtime;
    private int lognum;

    public User(String username, String userpass, int role, String regtime, int lognum) {
        this.username = username;
        this.userpass = userpass;
        this.role = role;
        this.regtime = regtime;
        this.lognum = lognum;
    }

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpass() {
        return userpass;
    }

    public void setUserpass(String userpass) {
        this.userpass = userpass;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getRegtime() {
        return regtime;
    }

    public void setRegtime(String regtime) {
        this.regtime = regtime;
    }

    public int getLognum() {
        return lognum;
    }

    public void setLognum(int lognum) {
        this.lognum = lognum;
    }
}
