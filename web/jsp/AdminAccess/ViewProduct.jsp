<%-- 
    Document   : ViewProduct
    Created on : Oct 18, 2017, 2:08:31 PM
    Author     : hackey.jay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.ProductDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/admin_control.js"></script>
        <title>View Product</title>
    </head>
    <body>
    <center>
        <div class="control_all">
            <div class="inner_control">
                <input id="edit" type="button" value="Edit"/><input id="del" type="button" value="Delete"/>
            </div>
        </div>
        <div class="table_inner">
            <table class="table_data">
                <thead>
                    <tr>
                        <td><input type="checkbox" value=""/></td>
                        <td><b>S.No</b></td>
                        <td><b>Product Name</b></td>
                        <td><b>Category</b></td>
                        <td><b>Price</b></td>
                        <td><b>Description</b></td>
                        <td><b>Image</b></td>                    
                    </tr>
                </thead>
                <tbody>
                   <%
                       int i=0;
                        ProductDetailsImp prodall=new ProductDetailsImp();
                        ResultSet rs=prodall.RetriveAll();
                        while(rs.next()){
                            i++;
                    %> 
                    <tr>
                        <td>
                            <div class=":0">
                                <input type="checkbox" value="<%=rs.getInt(1)%>"/>
                            </div>
                        </td>
                        <td>
                            <div class=":1">
                                <%=i%>
                            </div>
                        </td>
                        <td>
                            <div class=":2">
                                <a href="#"><%=rs.getString(2)%></a>
                            </div>
                        </td>
                        <td>
                            <div class=":3">
                                <%=rs.getString(3)%>
                            </div>
                        </td>
                        <td>
                            <div class=":4">
                                <%=rs.getInt(4)%>
                            </div>
                        </td>
                        <td>
                            <div class=":5">
                                <%=rs.getString(5)%>
                            </div>
                        </td>
                        <td>
                            <div class=":6 imgs">
                                <img src="<%=rs.getString(6)%>" width="30px" height="30px;"/>
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
</html>
