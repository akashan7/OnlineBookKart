package com.model;

import java.io.Serializable;

/**
 *
 * @author hackey.jay
 */
public class ProductDetails implements Serializable{
    private int catId,price;
    private String prodName,prodImg,desc;

    public ProductDetails() {
    }

    public ProductDetails( int catId, int price, String prodName, String prodImg, String desc) {
        
        this.catId = catId;
        this.price = price;
        this.prodName = prodName;
        this.prodImg = prodImg;
        this.desc = desc;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdImg() {
        return prodImg;
    }

    public void setProdImg(String prodImg) {
        this.prodImg = prodImg;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
    
    
}
