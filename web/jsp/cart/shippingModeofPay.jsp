<%-- 
    Document   : shippingModeofPay
    Created on : Oct 28, 2017, 4:11:41 PM
    Author     : hackey.jay
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.CartImp"%>
<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!int total=0;%>
<%!int alltotal=0;%>
<%!int Quantity=0;%>
<%
    int userId=0;    
    String sorder=request.getParameter("ordlt");
    String allorder=request.getParameter("ord");;
    String loc=(String)session.getAttribute("path");
      try{
            ResultSet rs=null;
            session=request.getSession(false);
            if(session!=null){
                if(session.getAttribute("user")!=null){
                UserDetailsImp userdb=new UserDetailsImp();
                int check=userdb.getUser((String)session.getAttribute("user"));
                userId=UserDetailsImp.userId;
                if(check==0){                
                    response.sendError(403, "Forbidden Access");
                }
                else{
                    CartImp cart=new CartImp();
                    rs=cart.getAllCartItem(UserDetailsImp.userId);
                    if(!rs.isBeforeFirst()){
                        response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                    }
                }
            }else{
                response.sendRedirect("home");
            }
            }else{
                response.sendRedirect("home");
            }
      }catch(Exception e){
        response.sendRedirect("home");
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
        <title>Shipping Payment</title>
    </head>
    <body>
        <div class="main">
            <nav class="header">
                <jsp:include page="/nav"></jsp:include>
            </nav>
            <section class="content">
                <div class="Payment-mode color">
                    <h3>Payment Information</h3>
                    <div class="shipping-payment">                        
                        <div class="shipping-mode-pay">
                            <h3>Payment Gateway</h3>
                            <div class="mrg-gt">
                                <%                                    
                                    boolean stat=false;
                                    boolean mstat=false;
                                    if(sorder!=null){
                                        System.out.println("Single Order");
                                        stat=true;
                                    }else if(allorder!=null){
                                        System.out.println("Multi Order");
                                        mstat=true;
                                    }  %> 
                                    <%
                                    if(stat==true){%>
                                    <form action="orderSingle?<%=loc%>" method="post">  
                                        <div class="shipping-pay">
                                            <div class="card-hd-name">
                                                <label>Card Holder Name</label>
                                                <input class="form-control" type="text" name="cdname" placeholder="Enter your name"/>
                                            </div>                                            
                                            <div class="fold-card">
                                                <div class="shipping-mode-pay-0">
                                                <label>Credit/Debit Card Number</label>
                                                <input class="form-control" type="text" name="cardno" placeholder="16 digit number"/>
                                                </div>
                                                <div class="shipping-mode-pay-1">
                                                    <label>Security Code</label>
                                                    <input class="form-control" type="password" name="cvv" placeholder="CVV" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Exp-shipping">
                                            <label>Expiry:</label>
                                            <select class="form-control" name='expireMM' id='expireMM'>
                                                <option value='01'>January</option>
                                                <option value='02'>February</option>
                                                <option value='03'>March</option>
                                                <option value='04'>April</option>
                                                <option value='05'>May</option>
                                                <option value='06'>June</option>
                                                <option value='07'>July</option>
                                                <option value='08'>August</option>
                                                <option value='09'>September</option>
                                                <option value='10'>October</option>
                                                <option value='11'>November</option>
                                                <option value='12'>December</option>                                            
                                            </select> 
                                            <select class="form-control" name='expireYY' id='expireYY'>
                                                <option value='18'>2018</option>
                                                <option value='19'>2019</option>
                                                <option value='20'>2020</option>                                            
                                                <option value='21'>2021</option>                                            
                                                <option value='22'>2022</option>                                            
                                                <option value='23'>2023</option>                                            
                                                <option value='24'>2024</option>                                            
                                                <option value='25'>2025</option>                                            
                                            </select> 
                                        </div>
                                        <div class="smt-pmt">
                                            <input class="btn btn-danger" type="submit" value="Confirm"/>
                                        </div>
                                    </form>                                 
                                    <%}else if(mstat==true){%>
                                        <form action="OrderServ?<%=loc%>" method="post">  
                                            <div class="shipping-pay">
                                                <div class="card-hd-name">
                                                    <label>Card Holder Name</label>
                                                    <input class="form-control" type="text" name="cdname" placeholder="Enter your name"/>
                                                </div>                                            
                                                <div class="fold-card">
                                                    <div class="shipping-mode-pay-0">
                                                    <label>Credit/Debit Card Number</label>
                                                    <input class="form-control" type="text" name="cardno" placeholder="16 digit number"/>
                                                    </div>
                                                    <div class="shipping-mode-pay-1">
                                                        <label>Security Code</label>
                                                        <input class="form-control" type="password" name="cvv" placeholder="CVV" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="Exp-shipping">
                                                <label>Expiry:</label>
                                                <select class="form-control" name='expireMM' id='expireMM'>
                                                    <option value='01'>January</option>
                                                    <option value='02'>February</option>
                                                    <option value='03'>March</option>
                                                    <option value='04'>April</option>
                                                    <option value='05'>May</option>
                                                    <option value='06'>June</option>
                                                    <option value='07'>July</option>
                                                    <option value='08'>August</option>
                                                    <option value='09'>September</option>
                                                    <option value='10'>October</option>
                                                    <option value='11'>November</option>
                                                    <option value='12'>December</option>                                            
                                                </select> 
                                                <select class="form-control" name='expireYY' id='expireYY'>
                                                    <option value='18'>2018</option>
                                                    <option value='19'>2019</option>
                                                    <option value='20'>2020</option>                                            
                                                    <option value='21'>2021</option>                                            
                                                    <option value='22'>2022</option>                                            
                                                    <option value='23'>2023</option>                                            
                                                    <option value='24'>2024</option>                                            
                                                    <option value='25'>2025</option>                                            
                                                </select> 
                                            </div>
                                            <div class="smt-pmt">
                                                <input class="btn btn-danger" type="submit" value="Confirm"/>
                                            </div>
                                        </form>                                
                                    <%}%>   
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
