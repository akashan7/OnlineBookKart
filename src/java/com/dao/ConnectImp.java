/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hackey.jay
 */
public class ConnectImp implements IConnect{
    Connection con=null;
    @Override
    public Connection connect() {
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con=DriverManager.getConnection("jdbc:derby://localhost:1527/hackey;user=root;password=root;");            
        }catch(ClassNotFoundException|SQLException sqle){
            System.out.println(sqle.getMessage());
        }
        return con;
    }
    
}
