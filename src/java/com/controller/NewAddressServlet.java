package com.controller;

import com.dao.UserDetailsImp;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hackey.jay
 */
public class NewAddressServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            int UID=Integer.parseInt((String)request.getParameter("uid"));
            String NewAddress=(String)request.getParameter("UPaddress");
            String action=(String)request.getParameter("action");
            HttpSession session=request.getSession(false);
            String loc=(String)session.getAttribute("path");
            System.out.println(loc);
            
            if("POST".equalsIgnoreCase(request.getMethod())){
                if("nads".equalsIgnoreCase(action)){
                    
                    UserDetailsImp dbuser=new UserDetailsImp();
                    int status=dbuser.setNewAddress(UID, NewAddress);
                    if(status>0){
                        
                        response.sendRedirect("modeofpay?"+loc);
                    }else{
                        response.sendError(response.SC_NOT_FOUND);
                    }                      
                }else if("skip".equalsIgnoreCase(action)){
                    response.sendRedirect("modeofpay?"+loc);
                }
            }
        }catch(NumberFormatException nfe){
            System.out.println("New Address Servlet :::"+nfe.getMessage());
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
