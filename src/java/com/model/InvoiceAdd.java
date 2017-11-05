package com.model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author hackey.jay
 */
public class InvoiceAdd implements Serializable{
    private String name,quantity,price;
    private Date date;

    public InvoiceAdd() {
    }

    public InvoiceAdd(String name, String quantity, String price, Date date) {
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
