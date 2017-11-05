package com.controller;

import com.dao.CartImp;
import com.dao.OrderImp;
import com.model.InvoiceAdd;
import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hackey.jay
 */
@WebServlet ("/orderSingle")
public class OrderSingleServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String cartItemId=(String) request.getParameter("ordlt");
        String userId=(String) request.getParameter("usd");
        if("POST".equalsIgnoreCase(request.getMethod())){            
            try {
                HttpSession session=request.getSession(false);
                List<InvoiceAdd> name=new ArrayList<>();
                CartImp cart=new CartImp();
                ResultSet rs=cart.getCartItemdet(Integer.parseInt(cartItemId));
                while(rs.next()){
                    name.add(new InvoiceAdd(rs.getString(1), rs.getString(3), rs.getString(2), Date.valueOf(LocalDate.now())));                    
                }                
                session.setAttribute("names", name);
            } catch (SQLException ex) {
                Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }            
            OrderImp order=new OrderImp();
            order.setOrderItem(Integer.parseInt(cartItemId), Integer.parseInt(userId));
            response.sendRedirect("invoiceServ");            
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
