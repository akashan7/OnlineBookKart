package com.model;

import java.io.Serializable;

/**
 *
 * @author hackey.jay
 */
public class CategoryDetails implements Serializable{
    private int catId;
    private String catName;

    public CategoryDetails() {
    }

    public CategoryDetails(int catId, String catName) {
        this.catId = catId;
        this.catName = catName;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }

    public String getCatName() {
        return catName;
    }

    public void setCatName(String catName) {
        this.catName = catName;
    }
    
}
