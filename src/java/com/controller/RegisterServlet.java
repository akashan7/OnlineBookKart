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
public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String fname=(String)request.getParameter("f_name");
        String user=(String)request.getParameter("r_user");
        String pass=(String)request.getParameter("r_pass");
        String age=(String)request.getParameter("r_age");
        String gender=(String)request.getParameter("gender");
        String email=(String)request.getParameter("r_email");
        String mobile=(String)request.getParameter("r_mobile");
        String address=(String)request.getParameter("r_address");
        HttpSession session=request.getSession();
        if("post".equalsIgnoreCase(request.getMethod())){
            if(!fname.isEmpty()&& !user.isEmpty() && !pass.isEmpty() && !age.isEmpty() && !gender.isEmpty() && !email.isEmpty() && !mobile.isEmpty() && !address.isEmpty()){
                try{
                    String role="Customer";
                    UserDetails userDetails = new UserDetails(fname, user, pass, age, gender, email, mobile, address,role);                
                    UserDetailsImp userdb=new UserDetailsImp();
                    int check=userdb.insert(userDetails);
                    if(0<check){
                        session.setAttribute("success", "Registered Successfully!!!");
                        System.out.println("Registered Successfully!!!"); 
                        response.sendRedirect("home");
                    }else{
                        session.setAttribute("error", "Not Registered Successfully!!!");
                        System.out.println("Not Registered Successfully!!!"); 
                        response.sendRedirect("home");                        
                    }

                }catch(IOException e){
                    System.out.println(e.getMessage());
                }
            }else{
                session.setAttribute("error", "Fill all fields...");
                System.out.println("Fill all fields..."); 
                response.sendRedirect("home");                               
            }
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
