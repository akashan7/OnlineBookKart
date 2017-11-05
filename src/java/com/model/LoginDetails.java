package com.model;

import java.io.Serializable;

/**
 *
 * @author hackey.jay
 */
public class LoginDetails implements Serializable{
    private String user,pass;

    public LoginDetails() {
    }

    public LoginDetails(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
}
