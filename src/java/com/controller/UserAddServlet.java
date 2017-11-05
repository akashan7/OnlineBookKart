package com.controller;

import com.dao.UserDetailsImp;
import com.model.UserDetails;
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
public class UserAddServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            PrintWriter out=response.getWriter();
            if("POST".equalsIgnoreCase(request.getMethod())){
                String name=(String)request.getParameter("fname");
                String username=(String)request.getParameter("uname");
                String password=(String)request.getParameter("pwd");
                String age=(String)request.getParameter("age");
                String gender=(String)request.getParameter("gender");
                String email=(String)request.getParameter("email");
                String mobile=(String)request.getParameter("mobile");
                String address=(String)request.getParameter("address");
                String role=(String)request.getParameter("role");
//                System.out.println(name+"::"+username+"::"+password+"::"+age+"::"+gender+"::"+email+"::"+mobile+"::"+address+"::"+role+"::");
                HttpSession session=request.getSession(false);
                if(session.getAttribute("user_Admin")!=null){
                    UserDetailsImp user=new UserDetailsImp();
                int check=user.getUser((String)session.getAttribute("user_Admin"));
                if(check!=0){ 
                    UserDetails userDetails=new UserDetails(name, username, password, age, gender, email, mobile, address, role);
                    int added=user.insertAdmin(userDetails);
                    if(added>0){
                        session.setAttribute("success", "Account Created Successfully");
                        response.sendRedirect("admin_home");
                    }else{
                        session.setAttribute("error", "Account not Created");
                        response.sendRedirect("admin_home");
                    }
                }else{
                    out.println("No user found");
                    request.getRequestDispatcher("home").include(request, response);
                } 
                }
            }
        }catch(IOException |ServletException se){
            System.out.println("User Add Servlet Exception:::"+se.getMessage());
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
