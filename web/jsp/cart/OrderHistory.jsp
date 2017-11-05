<%-- 
    Document   : OrderHistory
    Created on : Oct 22, 2017, 6:24:26 PM
    Author     : hackey.jay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.OrderImp"%>
<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean status=false;
    int userid=0;
    ResultSet rs=null;
    session=request.getSession(false);
    if(session!=null){
        if(session.getAttribute("user")!=null){
             UserDetailsImp user=new UserDetailsImp();
            int check=user.getUser((String)session.getAttribute("user")); 
            userid=UserDetailsImp.userId;
            if(check>0){
                status=true;
            }      
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
        <link rel="stylesheet" type="text/css" href="css/order.css"/>
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
                <div class="All-orders">
                    <div class="color inner-all-order">
                        <div class="color">
                            <h3>Order History</h3>
                            <hr>
                        </div>
                        <%
                            int total=0;
                            int counter=0;
                            String mobile,address,name,email;
                            if(status==true){
                                OrderImp dborder=new OrderImp();
                                rs=dborder.getOrderItem(userid);
                                if(rs.isBeforeFirst()){
                                    if(rs.next()){
                                        name=rs.getString(3);
                                        address=rs.getString(6);
                                        email=rs.getString(4);
                                        mobile=rs.getString(5);
                                    }%>
                                    <div class="all-details">
                                        <div>
                                            <h4>Orders #</h4>
                                        </div>                                    
                                    <div class="all-orders">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Product Name</th>
                                                    <th>Quantity</th>
                                                    <th>Price</th>
                                                    <th>Total</th>
                                                    <th>Date of Order</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                             <tbody>                                        
                                    <%rs.absolute(0);
                                    while(rs.next()){                                        
                                        counter++;
                                        total=rs.getInt(8)*rs.getInt(2);
                                    %>  
                                        <tr>
                                            <td><%=counter%></td>
                                            <td><%=rs.getString(1)%></td>
                                            <td><%=rs.getString(8) %></td>
                                            <td><%=rs.getString(2) %></td>
                                            <td>Rs.<%=total %>.00</td>
                                            <td><%=rs.getString(7) %></td>                                            
                                            <%
                                            if(rs.getString(9).equalsIgnoreCase("Process")){%>
                                             <td> <span class="bt-cr btn btn-danger"><%=rs.getString(9) %></span></td>   
                                            <%}else if(rs.getString(9).equalsIgnoreCase("Shipped")){%>
                                                <td> <span class="bt-cr btn btn-info"><%=rs.getString(9) %></span></td>   
                                            <%}
                                            %>
                                        </tr>                                    
                                    <%}%>
                                    </tbody>
                                    </table>
                                    </div>                                    
                                <%}else{
                                    out.println("<center><h3>No orders done yet...</h3></center>");
                                }                                
                            }
                        %>  
                            <div class="right-order">
                                <p>
                                    <span></span>
                                </p>
                                <p>
                                    <span></span>
                                </p>
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
