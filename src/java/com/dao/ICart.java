package com.dao;

import com.model.CartDetails;
import com.model.CartId;
import java.sql.ResultSet;

/**
 *
 * @author hackey.jay
 */
public interface ICart {
    int setCartItem(CartDetails Cart);
    ResultSet getAllCartItem(int userId);
    ResultSet getCartItem(int CartItemId);
    ResultSet getCartItemdet(int CartItemId);
    int getUserId(int userId);
    int setCartId(CartId cartId);
    int getCartId(int cartId);
    int removeCartItem(int cartItemId);
    int removeAllCartItem(int cartId);
    
}
