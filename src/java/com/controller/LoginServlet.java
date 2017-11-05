package com.controller;

import com.dao.UserDetailsImp;
import com.model.LoginDetails;
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
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        String user=(String)request.getParameter("user_id");        
        String pass=(String)request.getParameter("pass_id");        
        String role="Customer";
        //checking request for post methed
        if("post".equalsIgnoreCase(request.getMethod())){
            if(!user.isEmpty() && !pass.isEmpty()){
            LoginDetails log=new LoginDetails(user, pass);
            UserDetailsImp userDetails=new UserDetailsImp();
            userDetails.get(log);
            
            if(user.equals(UserDetailsImp.username)&&pass.equals(UserDetailsImp.password) && UserDetailsImp.role.equals("Customer")){
                HttpSession session=request.getSession();
                session.setAttribute("user", UserDetailsImp.username);
                session.setAttribute("role", UserDetailsImp.role);      
                String location=(String)session.getAttribute("location");
                System.out.println("User Logged In");
                response.sendRedirect(location);
            }else if(user.equals(UserDetailsImp.username)&&pass.equals(UserDetailsImp.password) && UserDetailsImp.role.equals("Admin")){
                HttpSession session=request.getSession();
                session.setAttribute("user_Admin", UserDetailsImp.username);
                session.setAttribute("role", UserDetailsImp.role); 
                System.out.println("Admin Logged In");
                response.sendRedirect("admin_home");
            }
            else{
                out.println("<p style='color:red;'>Please Check your credential...</p>");
                request.getRequestDispatcher("home").include(request, response);
            }

            }else{
                out.println("<p style='color:red;'>Enter all fields</p>");
                 request.getRequestDispatcher("home").include(request, response);
            }
        }else{
                 response.sendRedirect("home");
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
