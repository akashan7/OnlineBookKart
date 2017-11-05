package com.model;

import java.io.Serializable;

/**
 *
 * @author hackey.jay
 */
public class CartDetails implements Serializable{
    private int cartId,productId,quantity,price;

    public CartDetails() {
    }

    public CartDetails(int cartId, int productId, int quantity, int price) {
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    
    
}
