package com.controller;

import com.dao.CartImp;
import com.dao.UserDetailsImp;
import com.model.CartDetails;
import com.model.CartId;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hackey.jay
 */
public class CartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        int  prodId= new Integer((String)request.getParameter("id_prd"));
        int Qnty=new Integer((String)request.getParameter("noCart"));
        int price=new Integer((String)request.getParameter("prd_price"));
        try{
            if("POST".equalsIgnoreCase(request.getMethod())){
                HttpSession session =request.getSession(false);
                //session to check user is logged in or not
                if(session.getAttribute("user")!=""){
                    int check=0;
                    UserDetailsImp user=new UserDetailsImp();
                    check=user.getUser((String)session.getAttribute("user"));
                    if(check>0){
                        //if user logged in
                        CartImp cartCheck=new CartImp();
                        int status=cartCheck.getUserId(UserDetailsImp.userId);
                        if(status>0){
                            //cart table have already created a cart id
                            int cartInsert=0;
                            System.out.println("Cart Already Created");
                            CartImp cart=new CartImp();
                            cart.getCartId(UserDetailsImp.userId);
                            CartDetails cartItem= new CartDetails(CartImp.CartID, prodId,Qnty, price/Qnty);
                            cartInsert=cart.setCartItem(cartItem);
                            if(cartInsert>0){
                                //insert the cart item into cartItem table
                                out.println("Cart Added");
                                System.out.println("CartItem inserted");
                            }else{
                                out.println("Cart not Added");
                                System.out.println("CartItem not inserted");
                            }

                        }else{
                            //cart table not have a cart id of the user
                            CartId cartid=new CartId(UserDetailsImp.userId, new Date(System.currentTimeMillis()));
                            CartImp dbcart=new CartImp();
                            dbcart.setCartId(cartid);
                            System.out.println("Cartid is Created");                        
                            int cartInsert=0;
                            CartImp cart=new CartImp();
                            cart.getCartId(UserDetailsImp.userId);
                            CartDetails cartItem= new CartDetails(CartImp.CartID, prodId,Qnty, price);
                            cartInsert=cart.setCartItem(cartItem);
                            if(cartInsert>0){
                                //insert the cart item into cartItem table
                                out.println("Cart Added");
                                System.out.println("CartItem inserted");
                            }else{
                                out.println("Cart not Added");
                                System.out.println("CartItem not inserted");
                            }
                        }
                        out.println("Adding Cart");
                    }else{
                        session.removeAttribute("user");
                        out.println("Login First.");
                    }
                }else{
                    out.println("Login First.");
                }
            }        
        }catch(Exception e){
            System.out.println(e);
    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
