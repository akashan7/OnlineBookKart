<%-- 
    Document   : invoice
    Created on : Oct 24, 2017, 11:37:14 AM
    Author     : hackey.jay
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="com.model.InvoiceAdd"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.dao.OrderImp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int total=0;
    String address=null;
    String fullname=null;
    String mobile=null;
    int userid=0;    
    session=request.getSession(false);
    if(session.getAttribute("user")!=null && session.getAttribute("names")!=null){
        UserDetailsImp dbuser=new UserDetailsImp();
        int status=dbuser.getUser((String)session.getAttribute("user"));
        if(status>0){
            address=UserDetailsImp.address;
            fullname=UserDetailsImp.fullName;    
            userid=UserDetailsImp.userId;
            mobile=UserDetailsImp.mobile;
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
        <script>
            function printContent(el){
            var restorepage = $('body').html();
            var printcontent = $('.' + el).clone();
            $('body').empty().html(printcontent);
            window.print();
            $('body').html(restorepage);
            }
        </script>
        <title>Invoice</title>
    </head>
    <body>
        <div class="main">
            <nav class="header">
                <jsp:include page="/nav"></jsp:include>
            </nav>
            <section class="content">
                <div class="invoice color">
                    <h4>Invoice</h4>
                    <div class="invoice-inner bgcolor bcolor">
                        <div class="invoice-head">
                            <div class="invoice-logo">
                                <img src="img/logo.png" width="50px" height="50px"/>
                            </div>
                            <div class="book">
                                <p><span><b>Book Kart Inc.</b></span><br>
                                Tamil Nadu<br> India,Ch-600063</p>
                            </div>
                        </div>
                        <div class="Address-invoice">
                            <div class="inner-address">
                                <span class="bto"><p><b>Bill To</b></p></span>
                                <div class="address-inner">
                                    <p><%=fullname%>,<br>
                                        <%=address%>.<br>
                                        <%=mobile%>.</p>
                                </div>                                
                            </div>
                                <div class="time">
                                    <p><b>Date : </b><%=Date.valueOf(LocalDate.now())%></p>
                                </div>
                        </div>
                        <div class="all-prod">
                            <table>
                                <thead>
                                    <tr>
                                        <td align="center"><b>#</b></td>
                                        <td align="center"><b>Name</b></td>
                                        <td align="center"><b>Quantity</b></td>
                                        <td align="center"><b>Unit Price</b></td>
                                        <td align="center"><b>Amount</b></td>                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    <%      
                                    try{
                                            int i=0;
                                            List<InvoiceAdd> list=(List)session.getAttribute("names");
                                            for(InvoiceAdd value : list){
                                                i++;
                                                total+=Integer.parseInt(value.getPrice())*Integer.parseInt(value.getQuantity());
                                    %>
                                            <tr>
                                                <td align="center"><%=i%></td>
                                                <td><%=value.getName()%></td>
                                                <td align="center"><%=value.getQuantity()%></td>
                                                <td><%=value.getPrice() %>.00</td>
                                                <td align="right"><%=Integer.parseInt(value.getPrice())*Integer.parseInt(value.getQuantity())%>.00</td>
                                            </tr>
                                            <%}                                                
                                    }catch(Exception e){
                                    }
                                      %>
                                </tbody>
                                <tfoot>
                                    <tr><td align="center"><p><b>Total</b></p></td><td colspan="4" align="right"><p><b>Rs.<%=total%>.00</b></p></td></tr>
                                </tfoot>
                            </table>
                            <div class="Grand-total">
                            </div>
                                <div class="tmc">
                                    <p><b>Terms & conditions</b></p>
                                    <p>Payment refund not done once product shipped.</p>
                                    <p>Contact: +91-9677042859</p>
                                    <p>Email: jpn26prakash@bookkart.com</p>
                                </div>    
                        </div>
                                <div class="print"> <input type="button" onclick="printContent('invoice-inner')" name="prnt" value="print" /><form action="home" method="get"><input type="submit" name="done" value="Home" /></form></div>
                    </div>
                </div>                    
            </section>            
        </div>
        <footer class="footer">
            <jsp:include page="/footer"></jsp:include>
        </footer>
    </body>
</html>
