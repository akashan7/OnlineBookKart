/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.LoginDetails;
import com.model.UserDetails;
import java.sql.ResultSet;

/**
 *
 * @author hackey.jay
 */
public interface IUserDetails {    
    int insert(UserDetails user);
    int insertAdmin(UserDetails user);
    int get(LoginDetails login);
    ResultSet getAllUsers();
    int removeUser(int userId);
    int setNewAddress(int userId,String naddress);
}
