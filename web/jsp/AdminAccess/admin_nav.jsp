<%-- 
    Document   : admin_nav
    Created on : Oct 17, 2017, 9:23:34 AM
    Author     : hackey.jay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% session=request.getSession(false); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/admin.css"/>
        <script type="text/javascript" src="js/admin_control.js"></script>
        <title>Admin Menu</title>
    </head>
    <body>
        <div class="Greet">
            <h1>Welcome <% out.println(session.getAttribute("user_Admin"));%> </h1>
        </div>
        <div class="nav">            
            <div class="outline">
                <div class="Overall">
                    <div class="left_all">
                        <div class="home">
                            <a href="admin_home"><p>Home</p></a>
                        </div>
                        <div class="edit">
                            <div class="ma_prd"><a href="#"><p>Manage product</p></a></div>
                            <div class="prod_sub_edit">
                                <div class="sub"><a href="#"><p>Add</p></a></div>
                                <div class="sub"><a href="#"><p>Edit</p></a></div>                                
                            </div>
                        </div>
                        <div class="UserEdit">
                            <div><a href="#"><p>Manage user</p></a></div>
                            <div class="user_sub_edit">
                                <div class="sub"><a href="#"><p>Add</p></a></div>
                                <div class="sub"><a href="#"><p>Edit</p></a></div>                                
                            </div>
                        </div>                    
                    <div class="right_pos">
                        <div class="signout"><a href="Logout"><p>Logout</p></a></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
