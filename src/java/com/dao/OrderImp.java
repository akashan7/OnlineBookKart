package com.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hackey.jay
 */
public class OrderImp extends ConnectImp implements IOrder{

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
                stmt=conn.prepareStatement("Create table Orders (OrderID int generated always as identity (start with 1, increment by 1) constraint \n" +
                "PK_ORDID primary key not null,UserID int not null , ProdID int not null, Quantity int not null,\n" +
                "modeOfPay varchar(50) not null,DateOfOrder Timestamp not null,status varchar(30) not null default 'Process', constraint  UserFK foreign key(UserID) \n" +
                "references ROOT.USERDETAILS1(ID), constraint ProdFK foreign key(ProdID) \n" +
                "references ROOT.Product_Details(Prod_ID))");
                stmt.executeUpdate();
                conn.commit();
                tableStatus= true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderImp.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tableStatus;
    }
    
    @Override
    public int setOrderItems(int cartID,int userID) {
        int status=0;
        boolean tbstatus=createTable();
        if(tbstatus==true){
            try{            
                conn=connect();
                stmt=conn.prepareStatement("insert into ORDERS (USERID,PRODID,QUANTITY,DATEOFORDER) values(?,?,?,?)");
                CartImp cart=new CartImp();
                rs=cart.getAllCartItem(userID);
                conn.setAutoCommit(false);
                while(rs.next()){
                    ++status;
                    stmt.setInt(1, userID);
                    stmt.setInt(2, rs.getInt(7));
                    stmt.setInt(3, rs.getInt(3));
                    stmt.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));
                    stmt.addBatch();
                }            
                stmt.executeBatch();
                conn.commit();
                int removeCart=cart.removeAllCartItem(cartID);
                if(removeCart>0){
                    System.out.println("Cart Items Deleted");
                }
            }catch(SQLException sqle){
                System.out.println("Order Exception:::"+sqle.getMessage());
            }finally{
                try{
                    if(stmt!=null) stmt.close();
                    if(conn!=null) conn.close();
                }catch(SQLException sqle){
                    System.out.println("Order Exception Finally:::"+sqle.getMessage());
                }            
            }
        }
        return status;
    }

    @Override
    public ResultSet getOrderItem(int userID) {
        try{
            conn=connect();
            stmt=conn.prepareStatement("select pd.PROD_NAME,pd.PRICE,ud.FULLNAME,ud.EMAIL_ID,ud.MOBILE_NO,ud.ADDRESS,o.DATEOFORDER,o.QUANTITY\n" +
            ",o.STATUS,o.ORDERID from ORDERS o inner join PRODUCT_DETAILS pd on o.PRODID=pd.PROD_ID inner join\n" +
            " USERDETAILS1 ud on o.USERID=ud.ID and ud.ID="+userID,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Order Exception getOrderItem:::"+sqle.getMessage());
        }
        
        return rs;
    }
//Single Order
    @Override
    public int setOrderItem(int cartItemID, int userID) {
        int status=0;
        boolean tbstatus=createTable();
        if(tbstatus==true){
            try{            
                conn=connect();
                stmt=conn.prepareStatement("insert into ORDERS (USERID,PRODID,QUANTITY,DATEOFORDER) values(?,?,?,?)");
                CartImp cart=new CartImp();
                rs=cart.getCartItem(cartItemID);
                conn.setAutoCommit(false);
                if(rs.next()){
                stmt.setInt(1, userID);
                stmt.setInt(2, rs.getInt(1));
                stmt.setInt(3, rs.getInt(2));
                stmt.setTimestamp(4, Timestamp.valueOf(LocalDateTime.now()));              
                }
                status=stmt.executeUpdate();
                conn.commit();
                int removeCart=cart.removeCartItem(cartItemID);
                if(removeCart>0){
                    System.out.println("Cart Item Deleted");
                }
            }catch(SQLException sqle){
                System.out.println("Order Exception:::"+sqle.getMessage());
            }finally{
                try{
                    if(stmt!=null) stmt.close();
                    if(conn!=null) conn.close();
                }catch(SQLException sqle){
                    System.out.println("Order Exception Finally:::"+sqle.getMessage());
                }

            }
        }
        return status;
    }
    

    
}
