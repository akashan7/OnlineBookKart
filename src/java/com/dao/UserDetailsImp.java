package com.dao;

import com.model.LoginDetails;
import com.model.UserDetails;
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
public class UserDetailsImp extends ConnectImp implements IUserDetails{    
    PreparedStatement stmt=null;
    ResultSet rs=null;
    public static String  username="No user Found";
    public static String password=null;
    public static String fullName=null;
    public static String role=null;
    public static String address=null;
    public static String mobile=null;
    public static int userId=0;
    boolean tableStatus=false;


    private boolean createTable(){
        try {
            con=connect();
            DatabaseMetaData dbmd=con.getMetaData();
            rs=dbmd.getTables(null, null, "USERDETAILS1", null);
            if(rs.next()){
                tableStatus= true;
            } else {
                con.setAutoCommit(false);
                stmt=con.prepareStatement("create table \"ROOT\".USERDETAILS1\n" +
"(\n" +
"	ID INTEGER generated always as identity (start with 1, increment by 1) not null primary key,\n" +
"	FULLNAME VARCHAR(20) not null,\n" +
"	USERNAME VARCHAR(15) not null unique,\n" +
"	PASSWORD VARCHAR(15) not null,\n" +
"	AGE INTEGER not null,\n" +
"	GENDER CHAR(1) not null,\n" +
"	EMAIL_ID VARCHAR(30) not null,\n" +
"	MOBILE_NO VARCHAR(10),\n" +
"	ADDRESS VARCHAR(200),\n" +
"       Role varchar(15) DEFAULT 'Customer' not null,\n" +
"       Constraint role_check check (Role='Admin' OR Role='Customer')\n" +
                        
")");
                stmt.addBatch();
                stmt.executeBatch();
                stmt=con.prepareStatement("INSERT INTO ROOT.USERDETAILS2 (FULLNAME, USERNAME, PASSWORD, AGE, GENDER, EMAIL_ID, MOBILE_NO, ADDRESS, \"ROLE\") \n" +
"	VALUES ('Administrator', 'Admin', 'Admin@123', 23, 'M', 'admin@root.com', '0123456789', 'Temple Street', 'Admin')\n" +
"");
                stmt.executeUpdate();
                con.commit();
                tableStatus= true;

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDetailsImp.class.getName()).log(Level.SEVERE, null, ex);

        }finally{
            try{
                if(stmt!=null){ stmt.close();}
                if(con==null){ 
                    con.rollback();
                    con.close();
                }
                else{
                    con.close();
                }
            }catch(SQLException sqle){
            } 
        }
        return tableStatus;
    }
//Inserting register data into table
    @Override
    public int insert(UserDetails user) {
        int status=0;
        boolean tbstatus=createTable();
        if(tbstatus==true){
        try{            
            con=connect();
            con.setAutoCommit(false);
            stmt=con.prepareStatement("insert into USERDETAILS1 (FULLNAME,USERNAME,PASSWORD,AGE,GENDER,EMAIL_ID,MOBILE_NO,ADDRESS) values(?,?,?,?,?,?,?,?)");
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUser());
            stmt.setString(3, user.getPass());
            stmt.setString(4, user.getAge());
            stmt.setString(5, user.getGender());
            stmt.setString(6, user.getMail());
            stmt.setString(7, user.getMobile());
            stmt.setString(8, user.getAddress());
            status=stmt.executeUpdate();
            con.commit();
        }catch(SQLException sqle){
            System.out.println("Registration Exception::"+sqle.getMessage());
        }finally{
            try{
                if(stmt!=null){ stmt.close();}
                if(con==null){ 
                    con.rollback();
                    con.close();
                }
                else{
                    con.close();
                }
            }catch(SQLException sqle){
                System.out.println("Registration Error::"+sqle.getMessage());
            }            
        } 
        }
        return status;
    }
//Login Code
    @Override
    public int get(LoginDetails login) {
        int status=0;
        try{
            con=connect();
            stmt=con.prepareStatement("select USERNAME,PASSWORD,ROLE FROM USERDETAILS1 WHERE USERNAME='"+login.getUser()+"'");
            rs=stmt.executeQuery();
            while(rs.next()){
                status++;
                UserDetailsImp.username=rs.getString(1);
                UserDetailsImp.password=rs.getString(2);
                UserDetailsImp.role=rs.getString(3);                
                
            }
        }catch(SQLException sqle){
            System.out.println("Login Exception::"+sqle.getMessage());
        }
        return status;
    }
    //session for cheking user 
    public int getUser(String user){
        int bool=0;
        try{
            con=connect();
            stmt=con.prepareStatement("select Fullname,role,ID,ADDRESS,MOBILE_NO FROM USERDETAILS1 WHERE USERNAME='"+user+"'");
            rs=stmt.executeQuery();
            while(rs.next()){
                bool++; 
                UserDetailsImp.fullName=rs.getString(1);  
                UserDetailsImp.role=rs.getString(2); 
                UserDetailsImp.userId=rs.getInt(3); 
                UserDetailsImp.address=rs.getString(4);
                UserDetailsImp.mobile=rs.getString(5);
            }
        }catch(SQLException sqle){
            System.out.println("Login Exception::"+sqle.getMessage());
        }
        return bool;
    }
//Admin User
    @Override
    public ResultSet getAllUsers() {
        try{
            con=connect();
            stmt=con.prepareStatement("select ID,FULLNAME, USERNAME, PASSWORD, AGE, GENDER, EMAIL_ID, MOBILE_NO, ADDRESS,ROLE from ROOT.USERDETAILS1");
            rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Login Exception::"+sqle.getMessage());
        }
        return rs;
    }

    @Override
    public int removeUser(int userId) {
        int status=0;
        try{
            con=connect();
            con.setAutoCommit(false);
            stmt=con.prepareStatement("DELETE FROM ROOT.USERDETAILS1 WHERE ID = "+userId);
            status=stmt.executeUpdate();
            con.commit();
        }catch(SQLException sqle){
            System.out.println("Login Exception::"+sqle.getMessage());
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(con!=null) con.close();
            }catch(SQLException sqle){
                System.out.println("Registration removeUser Error::"+sqle.getMessage());
            }            
        } 
        return status;
    }

    @Override
    public int insertAdmin(UserDetails user) {
        int status=0;
        boolean tbstatus=createTable();
        if(tbstatus==true){
            try{            
                con=connect();
                con.setAutoCommit(false);
                stmt=con.prepareStatement("insert into USERDETAILS1 (FULLNAME,USERNAME,PASSWORD,AGE,GENDER,EMAIL_ID,MOBILE_NO,ADDRESS,ROLE) values(?,?,?,?,?,?,?,?,?)");
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getUser());
                stmt.setString(3, user.getPass());
                stmt.setString(4, user.getAge());
                stmt.setString(5, user.getGender());
                stmt.setString(6, user.getMail());
                stmt.setString(7, user.getMobile());
                stmt.setString(8, user.getAddress());
                stmt.setString(9, user.getRole());
                status=stmt.executeUpdate();
                con.commit();
            }catch(SQLException sqle){
                System.out.println("Registration Exception::"+sqle.getMessage());
            }finally{
                try{
                    if(stmt!=null) stmt.close();
                    if(con!=null) con.close();
                }catch(SQLException sqle){
                    System.out.println("Registration insertAdmin Error::"+sqle.getMessage());
                }            
            } 
        }
        return status;
    }

    @Override
    public int setNewAddress(int userId,String naddress) {        
 int status=0;
        try{
            con=connect();
            con.setAutoCommit(false);
            stmt=con.prepareStatement("UPDATE ROOT.USERDETAILS1 SET ADDRESS = '"+naddress+"' WHERE ID ="+userId);
            status=stmt.executeUpdate();
            System.out.println("New Address Updated...");
            con.commit();
        }catch(SQLException sqle){
            System.out.println("Registration Exception::"+sqle.getMessage());
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(con!=null) con.close();
            }catch(SQLException sqle){
                System.out.println("Registration insertAdmin Error::"+sqle.getMessage());
            }            
        } 
        
        return status;
    }
    
    
}
