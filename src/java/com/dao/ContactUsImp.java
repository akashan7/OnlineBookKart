package com.dao;

import com.model.ContactUs;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hackey.jay
 */
public class ContactUsImp extends ConnectImp implements IContactUs{

    Connection conn=null;
    ResultSet rs=null;
    PreparedStatement stmt=null;
    boolean tableStatus=false;
    
    private boolean createTable(){
        try {
            conn=connect();
            DatabaseMetaData dbmd=conn.getMetaData();
            rs=dbmd.getTables(null, null, "CONTACTUS", null);
            if(rs.next()){
                tableStatus= true;
            } else {
                conn.setAutoCommit(false);
                stmt=conn.prepareStatement("create table ContactUS (ContactID int generated always as identity \n" +
                        "(start with 1, increment by 1) primary key,UID int not null, cName varchar(50) not null,\n" +
                        "email varchar(100) not null,message varchar(500) not null,constraint userFK  foreign key\n" +
                        "(UID) references ROOT.USERDETAILS1(ID) )");
                stmt.executeUpdate();
                conn.commit();
                tableStatus= true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContactUsImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tableStatus;
    }
    
    @Override
    public int setContact(ContactUs contact,int userId) {
        int status=0;
        conn=connect();
        boolean tbstatus=createTable();
        if(tbstatus==true){
            try {
                conn.setAutoCommit(false);
                stmt=conn.prepareStatement("INSERT INTO ROOT.CONTACTUS (UID, CNAME, EMAIL, MESSAGE) VALUES (?,?,?,?)");
                stmt.setInt(1, userId);
                stmt.setString(2, contact.getName());
                stmt.setString(3, contact.getEmail());
                stmt.setString(4, contact.getMessage());
                status=stmt.executeUpdate();
                conn.commit();
            } catch (SQLException ex) {
                Logger.getLogger(ContactUsImp.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return status;
    }

    @Override
    public ResultSet getContact() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
