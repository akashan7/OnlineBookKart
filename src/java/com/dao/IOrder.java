package com.dao;

import java.sql.ResultSet;

/**
 *
 * @author hackey.jay
 */
public interface IOrder {
    int setOrderItems(int cartID,int userID);
    int setOrderItem(int cartItemID,int userID);
    ResultSet getOrderItem(int userID);
}
