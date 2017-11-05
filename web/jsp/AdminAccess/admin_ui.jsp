<%-- 
    Document   : admin_ui
    Created on : Oct 15, 2017, 9:50:50 PM
    Author     : hackey.jay
--%>

<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session=request.getSession(false);
    if(session!=null){
        if(session.getAttribute("user_Admin")!=null){
            UserDetailsImp user=new UserDetailsImp();
            int check=user.getUser((String)session.getAttribute("user_Admin"));
            String nickName=UserDetailsImp.fullName;
            String role=UserDetailsImp.role;            
            if(check!=0){ 
                if(!nickName.equals(session.getAttribute("user_Admin")) && !role.equals(session.getAttribute("role"))){
                    response.sendRedirect("home");
                }
            }else{
                System.out.println("No user found");
                response.sendRedirect("home");
            }  
        }else{
            System.out.println("Check your Credential...");
            response.sendRedirect("home");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='shortcut icon' href='img/t_ico.png' type='image/x-icon'>
        <link rel='icon' href='img/t_ico.png' type='image/x-icon'>
        <link rel="stylesheet" type="text/css" href="css/align.css"/> 
        <link rel="stylesheet" type="text/css" href="css/Admin_all_prod.css"/>
        <script src="js/vendor/jquery-3.2.1.min.js"></script>   
        <title></title>
    </head>
    <body>
        <div class="main">
            <nav class="header">
                <jsp:include page="admin_nav"></jsp:include>
            </nav>
            <section class="content">
                <div class="inner_content">
                    <span style="color: red;"><%=(session.getAttribute("success")==null) ? "" : session.getAttribute("success") %>
                    <% session.removeAttribute("success"); %></span>
                    <span style="color: red;"><%=(session.getAttribute("error")==null) ? "" : session.getAttribute("error") %>
                    <% session.removeAttribute("error"); %>
                    </span>
                </div>
                
            </section>            
        </div>
        <footer class="footer">
            <jsp:include page="/admin_foot"></jsp:include>
        </footer>
    </body>
</html>
