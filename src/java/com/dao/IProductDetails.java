/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.model.ProductDetails;
import java.sql.ResultSet;

/**
 *
 * @author hackey.jay
 */
public interface IProductDetails {
    int prodInsert(ProductDetails prod);
    ResultSet prodRetrive(int c_id);
    ResultSet SelectRetrive(int c_id,int p_id);
    ResultSet RetriveAll();
    ResultSet getLatest();
    ResultSet getNavProd(int catId);
    ResultSet getProdPrice(int catId,int priceLmt);
    int removeSProd(int prodId);
}
