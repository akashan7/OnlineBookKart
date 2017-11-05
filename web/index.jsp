<%-- 
    Document   : index
    Created on : Oct 5, 2017, 11:44:42 AM
    Author     : hackey.jay
--%>
<%@page import="com.dao.UserDetailsImp"%>
<%
    session=request.getSession(false);
    session.removeAttribute("names");
    if(session!=null){
        if(session.getAttribute("user_Admin")!=null){
             UserDetailsImp user=new UserDetailsImp();
            int check=user.getUser((String)session.getAttribute("user_Admin"));            
            if(check>0){
                request.getRequestDispatcher("admin_home").forward(request, response);
            }      
        }
    }else{        
        request.getRequestDispatcher("home").forward(request, response);
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='shortcut icon' href='img/t_ico.png' type='image/x-icon'>
        <link rel='icon' href='img/t_ico.png' type='image/x-icon'>
        <link rel="stylesheet" type="text/css" href="css/align.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
        <script src="js/vendor/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
        <title>Book Kart</title>
    </head>
    <body>
        <div class="main">
            <nav class="header">
                <jsp:include page="/nav"></jsp:include>
            </nav>
            <section class="content">
                <div class="inner_caro"style="height: 500px;">
                    <jsp:include page="slider"></jsp:include>
                </div>
                <div class="prod">
                <jsp:include page="prod_nav"></jsp:include>
                </div>
            </section>            
        </div>
        <footer class="footer">
            <jsp:include page="/footer"></jsp:include>
        </footer>
    </body>
</html>
