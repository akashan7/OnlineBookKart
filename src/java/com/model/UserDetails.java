package com.model;

import java.io.Serializable;

/**
 *
 * @author hackey.jay
 */
public class UserDetails implements Serializable{
    private String name,user,pass,age,gender,mail,mobile,address,role;

    public UserDetails() {
    }

    public UserDetails(String name, String user, String pass, String age, String gender, String mail, String mobile, String address, String role) {
        this.name = name;
        this.user = user;
        this.pass = pass;
        this.age = age;
        this.gender = gender;
        this.mail = mail;
        this.mobile = mobile;
        this.address = address;
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    


}
