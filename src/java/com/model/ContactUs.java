package com.model;

import java.io.Serializable;

/**
 *
 * @author hackey.jay
 */
public class ContactUs implements Serializable{
    private String name,message,email;

    public ContactUs() {
    }

    public ContactUs(String name, String message, String email) {
        this.name = name;
        this.message = message;
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
