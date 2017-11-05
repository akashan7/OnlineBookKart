package com.controller;

import com.dao.ContactUsImp;
import com.model.ContactUs;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hackey.jay
 */
public class ContactUsServelt extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        HttpSession session=request.getSession(false);
        String name= (String)request.getParameter("cname");
        String email= (String)request.getParameter("cmail");
        String Message= (String)request.getParameter("cmessage");
        int userId = new Integer((String)request.getParameter("id")); 
        try {        
            if("POST".equalsIgnoreCase(request.getMethod())){

                if(session!=null){
                    if(!name.equals("") && !email.equals("") && !Message.equals("")){
                    if(session.getAttribute("user")!=null){
                    ContactUsImp dbcontact=new ContactUsImp();
                    ContactUs contact=new ContactUs(name, Message, email);
                    int status=dbcontact.setContact(contact,userId);
                        if(status>0){
                            System.out.println("Send Successfully!!!");
                            session.setAttribute("success", "Send Successfully!!!");
                            response.sendRedirect("contact");

                        }else{
                            System.out.println("Not Successfully!!!");
                            session.setAttribute("error", "Not Successfully!!!");
                            response.sendRedirect("contact");
                        }
                        }else{
                            System.out.println("Login First");  
                            session.setAttribute("error", "Login First!!!");
                            response.sendRedirect("contact");
                        }
                    }else{
                        System.out.println("Enter all fields");
                        session.setAttribute("error", "Enter all fields!!!");
                        response.sendRedirect("contact");
                    } 
                }else if(session==null){
                    System.out.println("Login First");
                    session.setAttribute("error", "Login First!!!");
                    response.sendRedirect("contact");
                }             
        }
            
        } catch (NumberFormatException | IOException  e) {
            System.out.println("Contact Servlet Exception:::"+e.getMessage());
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
