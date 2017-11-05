<%-- 
    Document   : cart
    Created on : Oct 19, 2017, 10:24:56 AM
    Author     : hackey.jay
--%>

<%@page import="java.util.Random"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.CartImp"%>
<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <script src="js/cart.js"></script>
    <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
    <title>Cart Items</title>
</head>
<body>
    <div class="main">
        <nav class="header">
            <jsp:include page="/nav"></jsp:include>
        </nav>
        <section class="content">            
            <div class="cart-items">                              
                <%                     
                    ResultSet rs=null;
                    int userId=0;
                    session=request.getSession(false);
                    if(session.getAttribute("user")!=null){
                        UserDetailsImp userdb=new UserDetailsImp();
                        int check=userdb.getUser((String)session.getAttribute("user"));
                        userId=UserDetailsImp.userId;
                        if(check>0){
                            CartImp cart=new CartImp();
                            rs=cart.getAllCartItem(UserDetailsImp.userId);
                            
                            if(rs.isBeforeFirst()){
                                if(rs.next()){                                    
                                int cartId=rs.getInt(6);
            %>                            
                            <div class="control-cart-all">
                                <div class="control-inner">
                                    <div class="btn-order-all">
                                        <button id="ord-cfm-all" class="btn btn-primary" type="submit">Order All</button>
                                    </div>
                                    <div class="btn-order-cancel-all">
                                        <button  class="btn btn-danger ord-del-all"  value="<%=cartId%>" type="submit">Remove All</button>
                                    </div>
                                </div>                    
                            </div> 
                            </div>                                    
                                <div class="order-prd-all">
                                    <div class="anot-shop">Shopping Cart<span class="glyphicon glyphicon-shopping-cart"></span></div>
                                    <%
                                        rs.absolute(0);
                                        int total=0;
                                        while(rs.next()){
                                    %>
                                    <div class="inner-order">
                                        <div class="img-order">
                                            <img src="<%=rs.getString(2)%>" />
                                        </div>
                                        <div class="name-order">
                                            <h4><%=rs.getString(1)%></h4>
                                        </div>
                                        <div class="price-order">
                                            <%
                                                total+=rs.getInt(4)*rs.getInt(3);
                                            %>
                                            <p class="my-p"><%=rs.getInt(4)*rs.getInt(3)%>.00</p>
                                        </div>
                                    </div>
                                    <%}
                                %>
                                    <div class="order-chk-out">
                                        <%--action="OrderServ?ord=<%=cartId%>&id=<%= URLEncoder.encode(session.getId()) %>&usd=<%= userId %>"--%>
                                        <form action="shipping?ord=<%=cartId%>&id=<%= URLEncoder.encode(session.getId()) %>&usd=<%= userId %>" method="Post">
                                            <div class="chk-out"><button class="btn btn-default"><span class="glyphicon glyphicon-shopping-cart"></span>Checkout</button></div>
                                        </form>                                        
                                        <div class="total-prc"><h5>Total : <b>Rs.<%=total%>.00</b></h5></div>
                                    </div>
                                </div>
                                
                            <%}
                                rs.absolute(0);
                                if(rs.next()){ 
                                  int  cartItemId=rs.getInt(5);
                            rs.absolute(0);
                            while(rs.next()){
                %>
                            <div class="cart-lst">
                                <div class="inner-cart">
                                    <div class="all-cnt">
                                        <div class="cart-img">
                                            <img src="<%=rs.getString(2)%>" />
                                        </div>
                                        <div class="cart-txt">
                                            <div class="cart-title">
                                                <h3>Product Name : <%=rs.getString(1)%></h3>
                                            </div>
                                            <div class="cart-price">
                                                <h3>Price : <span class="rs">Rs.</span><%=rs.getInt(4)%></h3>
                                            </div>
                                            <div class="cart-qty">
                                                <h3>Quantity : <%=rs.getInt(3)%></h3>
                                            </div>
                                        </div>                                        
                                    </div>
                                    <div class="control-cart">
                                        <div class="btn-order">
                                            <!--<form action="orderSingle?ordlt=<//%=cartItemId%>&id=<//%= URLEncoder.encode(session.getId()) %>&usd=<//%= userId %>" method="Post">-->
                                            <form action="shipping?ordlt=<%=cartItemId%>&id=<%= URLEncoder.encode(session.getId()) %>&usd=<%= userId %>" method="Post">
                                                <button class="btn btn-primary ord-cfm" type="submit">Order</button>
                                            </form>                                            
                                        </div>
                                        <div class="btn-order-cancel">
                                            <button  class="btn btn-danger ord-del"  value="<%=rs.getInt(5)%>" type="submit">Remove</button>
                                        </div>
                                    </div>
                                </div>    
                            </div>
                        <%}
                            }
                            }else{
                                out.println("<center><h3>No Cart Added.</h3></center>");
                            }
                        }else{
                            out.println("<center class='log-in'><h3><a href=''>Login First</a></h3></center>");
                            
                        }
                    }else{
                        out.println("<center class='log-in'><h3><a href='#'>Login First</a></h3></center>");
                    }
                %>
        </section>        
    </div>
    <footer class="footer">
        <jsp:include page="/footer"></jsp:include>
    </footer>
</body>
</html>
