/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.CartDetails;
import com.model.CartId;
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
public class CartImp extends ConnectImp implements ICart{

    Connection conn=null;
    ResultSet rs=null;
    PreparedStatement stmt=null;
    public static int CartID=0;
    boolean tableStatus=false;
    private boolean createTable(){
        try {
            con=connect();
            DatabaseMetaData dbmd=con.getMetaData();
            rs=dbmd.getTables(null, null, "CART", null);
            if(rs.next()){
                tableStatus=true;
            } else {
                con.setAutoCommit(false);
                stmt=con.prepareStatement("create table cart (Cart_Id integer generated always as identity (start with 1,increment by 1) \n" +
                        "not null primary key,U_ID integer not null ,DateCreated date Not null,\n" +
                        "Constraint UID_FK FOREIGN KEY (U_ID) REFERENCES UserDetails1(ID) )");
                stmt.execute();
                stmt=con.prepareStatement("Create table cartItems (CartItemId integer generated always as identity \n" +
                        "(start with 1,increment by 1) not null primary key,CartId int not null,ProductID int not null,\n" +
                        "Quantity int not null,price int not null,\n" +
                        "Constraint CartID_FK foreign key (CartId) references cart(Cart_Id),\n" +
                        "Constraint ProdID_FK foreign key (ProductID) references Product_details(PROD_ID))");
                stmt.execute();
                con.commit();
                tableStatus=true;
            }
        } catch (SQLException ex) {
                        Logger.getLogger(CartImp.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(CartImp.class.getName()).log(Level.SEVERE, null, sqle);
            } 
        }
        return tableStatus;
    }
    
    
    @Override
    public int setCartItem(CartDetails Cart) {
        int status=0;
        boolean tbstatus=createTable();
        if(tbstatus==true){
            try{
                conn=connect();
                conn.setAutoCommit(false);
                stmt=conn.prepareStatement("insert into CARTITEMS (CartID,ProductID,Quantity,price) values (?,?,?,?)");
                stmt.setInt(1, Cart.getCartId());
                stmt.setInt(2, Cart.getProductId());
                stmt.setInt(3, Cart.getQuantity());
                stmt.setInt(4, Cart.getPrice());
                status=stmt.executeUpdate();
                conn.commit();
            }catch(SQLException sqle){
                System.out.println("Cart setCartItem Error::"+sqle.getMessage());
            }finally{
                try{
                    if(stmt!=null) stmt.close();
                    if(conn!=null) conn.close();
                }catch(SQLException sqle){
                    System.out.println("Cart setCartItem Error::"+sqle.getMessage());
                }            
            } 
        }
        
        return status;
    }

    @Override
    public ResultSet getAllCartItem(int userId) {
        try{
        conn=connect();
        stmt=conn.prepareStatement("select pd.PROD_NAME,pd.PROD_IMG,ct.QUANTITY,ct.PRICE,ct.CARTITEMID,ct.CARTID,pd.PROD_ID from \n" +
                                    "PRODUCT_DETAILS pd inner join CARTITEMS ct on pd.PROD_ID = ct.PRODUCTID inner join \n" +
                                    "CART c on c.CART_ID = ct.CARTID and c.U_ID="+userId,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Cart getAllCartItem Error::"+sqle.getMessage());
        }
        return rs;
    }
    
    @Override
    public int setCartId(CartId cartId) {
        int status=0;
        boolean tbstatus=createTable();
        if(tbstatus==true){
            try{
                conn=connect();
                conn.setAutoCommit(false);
                stmt=conn.prepareStatement("insert into CART(U_ID,DATECREATED) values (?,?)");
                stmt.setInt(1, cartId.getUserId());
                stmt.setDate(2, cartId.getDate());
                status=stmt.executeUpdate();
                conn.commit();
            }catch(SQLException sqle){
                System.out.println("Cart Insert Error::"+sqle.getMessage());
            }finally{
                try{
                    if(stmt!=null) stmt.close();
                    if(conn!=null) conn.close();
                }catch(SQLException sqle){
                    System.out.println("Cart Insert Error::"+sqle.getMessage());
                }            
            }    
        }
        return status;
    }

    @Override
    public int getUserId(int userId) {
        int status=0;
        try{
            conn=connect();
            stmt=conn.prepareStatement("select * from Cart where U_ID="+userId);
            rs=stmt.executeQuery();
            while(rs.next()){
                status++;
            }
        }catch(SQLException sqle){
            System.out.println("Cart Insert Error::"+sqle.getMessage());
        } 
        return status;
    }

    //getting cart id using userId
    @Override
    public int getCartId(int userId) {
        int status=0;
        try{
            conn=connect();
            
            stmt=conn.prepareStatement("select * from Cart where U_ID="+userId);
            rs=stmt.executeQuery();
            while(rs.next()){
                status++;
                CartImp.CartID=rs.getInt(1);
            }
        }catch(SQLException sqle){
            System.out.println("Cart getCartId Error::"+sqle.getMessage());
        }
        return status;
    }
    //Delete cart Details

    @Override
    public int removeCartItem(int cartItemId) {
        int status=0;
        try{
            conn=connect();
            conn.setAutoCommit(false);
            stmt=conn.prepareStatement("DELETE FROM ROOT.CARTITEMS WHERE CARTITEMID ="+cartItemId);
            status=stmt.executeUpdate();   
            conn.commit();
        }catch(SQLException sqle){
            System.out.println("Cart removeCartItem Error::"+sqle.getMessage());
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException sqle){
                System.out.println("Cart removeCartItem Error::"+sqle.getMessage());
            }            
        } 
        return status;
    }

    @Override
    public int removeAllCartItem(int cartId) {
        int status=0;
        try{
            conn=connect();
            conn.setAutoCommit(false);
            stmt=conn.prepareStatement("DELETE FROM ROOT.CARTITEMS WHERE CARTID ="+cartId);
            status=stmt.executeUpdate();
            conn.commit();
        }catch(SQLException sqle){
            System.out.println("Cart removeAllCartItem Error::"+sqle.getMessage());
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(conn!=null) conn.close();
            }catch(SQLException sqle){
                System.out.println("Cart removeAllCartItem Error::"+sqle.getMessage());
            }            
        } 
        return status;
    }

    @Override
    public ResultSet getCartItem(int CartItemId) {
        try{
        conn=connect();
        stmt=conn.prepareStatement("select ct.PRODUCTID,ct.QUANTITY from CARTITEMS ct where ct.CARTITEMID="+CartItemId);
        rs=stmt.executeQuery();
        System.out.println("get Cart");
        }catch(SQLException sqle){
            System.out.println("Cart getCartItem Error::"+sqle.getMessage());
        }
        return rs;
    }

    @Override
    public ResultSet getCartItemdet(int CartItemId) {
        try{
        conn=connect();
        stmt=conn.prepareStatement("select pd.PROD_NAME,pd.PRICE,ct.QUANTITY from PRODUCT_DETAILS pd inner join \n" +
        "CARTITEMS ct on ct.PRODUCTID = pd.PROD_ID and ct.CARTITEMID="+CartItemId);
        rs=stmt.executeQuery();
        System.out.println("get Cart");
        }catch(SQLException sqle){
            System.out.println("Cart getCartItem Error::"+sqle.getMessage());
        }
        return rs;
    }
    
    
}
