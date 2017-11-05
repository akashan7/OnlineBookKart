package com.model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author hackey.jay
 */
public class CartId implements Serializable{
    private int userId;
    private Date date;
    public CartId() {
    }

    public CartId(int userId, Date date) {
        this.userId = userId;
        this.date = date;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    
}
