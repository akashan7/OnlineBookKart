<%-- 
    Document   : shipping
    Created on : Oct 27, 2017, 9:30:38 PM
    Author     : hackey.jay
--%>

<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String address=null;
    String fullname=null;
    String CID=(String)request.getParameter("ord");
    String UID=(String)request.getParameter("usd");
    session=request.getSession(false); 
    if(session.getAttribute("user")!=null){
        UserDetailsImp dbuser=new UserDetailsImp();
        int status=dbuser.getUser((String)session.getAttribute("user"));
        if(status>0){
            address=UserDetailsImp.address;
            fullname=UserDetailsImp.fullName;                        
        }else{
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
        <link rel="stylesheet" type="text/css" href="css/cart.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
        <script src="js/vendor/jquery-3.2.1.min.js"></script>        
        <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
        <title>Shipping</title>
    </head>
    <body>
        <div class="main">
            <nav class="header">
                <jsp:include page="/nav"></jsp:include>
            </nav>
            <section class="content">
                <div class="shipping-container color">
                    <h3>Confirm Shipping Address</h3>
                    <div class="shipping-inner">
                        <div class="shipping-address">
                            <div class="address">
                                <div class="odaddress">
                                    <h5>Shipping address :</h5>
                                    <p><%= fullname %></p>
                                    <p><%=address%></p>
                                </div>
                                <form action="address" method="POST">
                                <div class="naddress">
                                    <h5>New Shipping address :</h5>
                                    <input type="hidden" value="<%=UID%>" name="uid"/>
                                    <input type="hidden" value="<%=CID%>" name="cid"/>
                                    <textarea name="UPaddress" class="form-control adtxt" placeholder="Alternative Address"></textarea>
                                </div>
                                <div class="btn-address right">
                                    <button class="btn btn-default" type="submit" name="action" value="nads">Update Address</button>
                                    <button class="btn btn-default" type="submit" name="action" value="skip">skip</button>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>            
        </div>
        <footer class="footer">
            <jsp:include page="/footer"></jsp:include>
        </footer>
    </body>
</html>
