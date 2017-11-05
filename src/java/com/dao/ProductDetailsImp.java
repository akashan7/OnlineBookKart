package com.dao;

import com.model.ProductDetails;
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
public class ProductDetailsImp extends ConnectImp implements IProductDetails{
    PreparedStatement stmt=null;
    ResultSet rs=null;
    private void createTable(){
        try {
            con=connect();
            DatabaseMetaData dbmd=con.getMetaData();
            rs=dbmd.getTables(null, null, "category_details", null);
            if(!rs.next()){
                con.setAutoCommit(false);
                stmt=con.prepareStatement("create table category_details (Cat_id integer primary key not null,Cat_name varchar(50) not null)");
                stmt.execute();
                stmt=con.prepareStatement("create table product_details1 (Prod_ID integer primary key generated always as \n" +
"Identity (start with 1,increment by 1) not null,Cat_id integer,\n" +
"prod_name varchar(30),price int not null,description varchar(2000) not null,prod_Img varchar(30) default 'img/Product_Img/default.png',\n" +
"foreign key(Cat_id) references ROOT.CATEGORY_DETAILS(Cat_id))");
                stmt.execute();
                con.commit();
            }
        } catch (SQLException ex) {
            System.out.println("Product Table Already Exist!!!");
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
                Logger.getLogger(ProductDetailsImp.class.getName()).log(Level.SEVERE, null, sqle);
            } 
        }
    }

    @Override
    public int prodInsert(ProductDetails prod) {
        int status=0;
        try{
            createTable();
            con=connect();
            con.setAutoCommit(false);
            stmt=con.prepareStatement("INSERT INTO ROOT.PRODUCT_DETAILS (CAT_ID, PROD_NAME, PRICE, DESCRIPTION, PROD_IMG) values(?,?,?,?,?)");
            stmt.setInt(1, prod.getCatId());
            stmt.setString(2, prod.getProdName());
            stmt.setInt(3, prod.getPrice());
            stmt.setString(4, prod.getDesc());
            stmt.setString(5, prod.getProdImg());
            status=stmt.executeUpdate();
            con.commit();
        }catch(SQLException sqle){
            System.out.println("Product Details ::"+sqle.getMessage());
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(con!=null) con.close();
            }catch(SQLException sqle){
                System.out.println("prodInsert Error::"+sqle.getMessage());
            }            
        } 
        return status;
    }

    @Override
    public ResultSet prodRetrive(int c_id) {
        
        try{
            con=connect();
            stmt=con.prepareStatement("select * from ROOT.PRODUCT_DETAILS where CAT_ID="+c_id);
            rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Product Details:"+sqle.getMessage());
        }            
        
        return rs;
    }

    @Override
    public ResultSet SelectRetrive(int c_id, int p_id) {
        try{
            con=connect();
            stmt=con.prepareStatement("select * from ROOT.PRODUCT_DETAILS where CAT_ID="+c_id+"and PROD_ID="+p_id);
            rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Product Details:"+sqle.getMessage());
        } 
        return rs;
    }

    @Override
    public ResultSet RetriveAll() {
        try{
            con=connect();
            stmt=con.prepareStatement("select pd.PROD_ID,pd.PROD_NAME,cd.CAT_NAME,pd.PRICE,pd.DESCRIPTION,pd.PROD_IMG \n" +
"from ROOT.PRODUCT_DETAILS pd ,CATEGORY_DETAILS cd \n" +
"where pd.CAT_ID=cd.CAT_ID order by PROD_ID Asc");
            rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Product Details:"+sqle.getMessage());
        } 
        return rs;
    }
//removeing single product using prodID
    @Override
    public int removeSProd(int prodId) {
        int status=0;
        try{
            con=connect();
            con.setAutoCommit(false);
            stmt=con.prepareStatement("DELETE FROM ROOT.PRODUCT_DETAILS WHERE PROD_ID ="+prodId);            
            status=stmt.executeUpdate();
            con.commit();
        }catch(SQLException sqle){
            System.out.println("Product Details ::"+sqle.getMessage());
        }finally{
            try{
                if(stmt!=null) stmt.close();
                if(con!=null) con.close();
            }catch(SQLException sqle){
                System.out.println("removeSProd Error::"+sqle.getMessage());
            }            
        } 
        return status;        
    }

    @Override
    public ResultSet getLatest() {
        try{
            con=connect();
            stmt=con.prepareStatement("select PROD_ID,CAT_ID,PROD_NAME, PROD_IMG from ROOT.PRODUCT_DETAILS Order by PROD_ID desc  fetch next 6 rows only");
            rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Product Details:"+sqle.getMessage());
        }            
        
        return rs;
    }

    @Override
    public ResultSet getNavProd(int catId) {
        try{
            con=connect();
            stmt=con.prepareStatement("select PROD_ID,CAT_ID,PROD_NAME, PROD_IMG from ROOT.PRODUCT_DETAILS where CAT_ID="+catId+"  fetch next 6 rows only");
            rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Product Details:"+sqle.getMessage());
        }            
        
        return rs;
    }

    @Override
    public ResultSet getProdPrice(int catId,int priceLmt) {
        try{
            con=connect();
            stmt=con.prepareStatement("select * from PRODUCT_DETAILS where CAT_ID="+catId+"and PRICE between 0 and"+priceLmt);
            rs=stmt.executeQuery();
        }catch(SQLException sqle){
            System.out.println("Product getProdPrice Details:"+sqle.getMessage());
        }            
        
        return rs;
    }
    
    
    
}
