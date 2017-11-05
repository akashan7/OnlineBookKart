<%-- 
    Document   : ViewUser
    Created on : Oct 20, 2017, 7:31:12 PM
    Author     : hackey.jay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.UserDetailsImp"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/admin_control.js"></script>
        <title>Admin View</title>
    </head>
    <body>
        <body>
    <center>
        <div class="control_all">
            <div class="inner_control">
                <input id="edit-u" type="button" value="Edit"/><input id="del-u" type="button" value="Delete"/>
            </div>
        </div>
        <div class="table_inner">
            <table class="table_data">
                <thead>
                    <tr>
                        <td><input type="checkbox" value=""/></td>
                        <td><b>#</b></td>
                        <td><b>Name</b></td>
                        <td><b>Username</b></td>
                        <td><b>Password</b></td>
                        <td><b>Age</b></td>
                        <td><b>Gender</b></td>
                        <td><b>Email</b></td>                  
                        <td><b>Mobile</b></td>                  
                        <td><b>Address</b></td>                  
                        <td><b>Role</b></td>                        
                    </tr>
                </thead>
                <tbody>
                   <%
                       int i=0;
                        UserDetailsImp userdall=new UserDetailsImp();
                        ResultSet rs=userdall.getAllUsers();
                        while(rs.next()){
                            i++;
                    %> 
                    <tr>
                        <td>
                            <div class=":0u">
                                <input type="checkbox" value="<%=rs.getInt(1)%>"/>
                            </div>
                        </td>
                        <td>
                            <div class=":1u">
                                <%=i%>
                            </div>
                        </td>
                        <td>
                            <div class=":2u">
                                <%=rs.getString(2)%>
                            </div>
                        </td>
                        <td>
                            <div class=":3u">
                                <%=rs.getString(3)%>
                            </div>
                        </td>
                        <td>
                            <div class=":4u">
                                <%=rs.getString(4)%>
                            </div>
                        </td>
                        <td>
                            <div class=":5u">
                                <%=rs.getString(5)%>
                            </div>
                        </td>
                        <td>
                            <div class=":6u">
                                <%=rs.getString(6)%>
                            </div>
                        </td>
                        <td>
                            <div class=":7u">
                                <%=rs.getString(7)%>
                            </div>
                        </td>
                        <td>
                            <div class=":8u">
                                <%=rs.getString(8)%>
                            </div>
                        </td>
                        <td>
                            <div class=":9u">
                                <%=rs.getString(9)%>
                            </div>
                        </td>
                        <td>
                            <div class=":10u">
                                <%=rs.getString(10)%>
                            </div>
                        </td>
                        
                    </tr>
                    <%}%>
                </tbody>            
            </table>
            <center>
                <div class="view-img">
                <img src=""/>
                </div>
            </center>
        </div>        
    </center>
    </body>
    </body>
</html>
