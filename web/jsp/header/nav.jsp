<%-- 
    Document   : nav
    Created on : Oct 5, 2017, 2:46:12 PM
    Author     : hackey.jay
--%>

<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/navStyle.css"/>
        <script type="text/javascript" src="js/nav.js"></script>
        <style>
            a:hover {
                text-shadow: 0px 0px #fff;
                text-decoration: none;
            }
            
        </style>
        <title>Menu</title>
    </head>
    <body>
        <nav>
            <div class="nav">
                <div id="inner" >
                    <div id="list" >                        
                        <div class="logo"><img width="75px" src="img/logo2.png"/>&nbsp;Book Kart</div>
                        <div id="all_nav">
                            <div class="left_nav">
                            <div id="home" ><a href="home"><h4>Home</h4></a></div>
                            <div class="product">
                                <div class="prod_head"><a href="#"><h4>Product</h4></a></div>
                                <div class="prod_sub">
                                    <div class="sub_hover"><a href="prod_art?cat=1"><h5>Arts & Photography</h5></a></div>
                                    <div class="sub_hover"><a href="prod_comp?cat=2"><h5>Computers & Technology</h5></a></div>
                                    <div class="sub_hover"><a href="prod_edu?cat=3"><h5>Education & Teaching</h5></a></div>
                                    <div class="sub_hover"><a href="prod_engg?cat=4"><h5>Engineering & Transportation</h5></a></div>
                                    <div class="sub_hover"><a href="prod_love?cat=5"><h5>Love Books & Others</h5></a></div>
                                </div>
                            </div>
                            <div id="btn">
                                <div>
                                <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search for..." aria-label="Search for...">
                                <span class="input-group-btn">
                                    <button class="btn btn-secondary" type="button"><span id="color">Go!</span></button>
                                </span>
                                </div>
                                </div>
                            </div>                            
                            </div>
                            <%
                                session=request.getSession(false);
                                session.setAttribute("path",request.getQueryString());
                                session.setAttribute("location", request.getRequestURI()+"?"+request.getQueryString()+"&"+session.getId());
                                if(session.getAttribute("user")!=null){
                                    UserDetailsImp user=new UserDetailsImp();
                                    int check=user.getUser((String)session.getAttribute("user"));
                                    String nickName=UserDetailsImp.fullName;
                                    if(check!=0){                                    
                            %>
                            <div class="user"><h5>Welcome <%=nickName%></h5></div>
                                    <%}
                                }
                            %>
                            
                                  <div class="status">
                                <span >
                                    <%=(session.getAttribute("success")==null) ? "" :  session.getAttribute("success")%>
                                    <% session.removeAttribute("success"); %>
                                    <%=(session.getAttribute("error")==null) ? "" :  session.getAttribute("error")%>
                                    <% session.removeAttribute("error"); %>
                                </span>
                            </div>  
                                
                            
                                                        
                            <div class="right_nav">
                                <div class="contact"><a href="contact"><h4>Contact Us</h4></a></div>
                                <div class="about"><a href="about"><h4>About Us</h4></a></div>
                                <%
                                    session=request.getSession(false);
                                    if(session.getAttribute("user")==null){                                        
                                    %>
                                        <div class="cart"><a href="cart"><h4>Cart</h4></a></div>
                                    <%}else if(session.getAttribute("user")!=null){                                        
                                    %>
                                        <div class="cart drop_cart">
                                            <div class="cart_head"><a href="#"><h4>Cart</h4></a></div>
                                            <div class="cart_sub">
                                                <div class="sub_hover"><a href="cart"><h5>Cart</h5></a></div>
                                                <div class="sub_hover"><a href="orderAll"><h5>Order</h5></a></div>
                                            </div>
                                        </div>   
                                    <%}%>
                                
                                <!-- Login logout -->
                                <%
                                    session=request.getSession(false);
                                    if(session.getAttribute("user")==null){                                        
                                    %>
                                        <div class="Sign drop_sign">
                                            <div class="sign_head"><a href="#"><h4>Sign In</h4></a></div>
                                            <div class="sign_sub">
                                                <div id="reg_user" class="sub_hover"><a href="#"><h5>New user</h5></a></div>
                                                <div id="login" class="sub_hover"><a href="#"><h5>Login</h5></a></div>
                                            </div>
                                        </div>
                                    <%}else if(session.getAttribute("user")!=null){                                        
                                    %>
                                        <div class="Sign Logout">
                                            <div class="logout"><a href="Logout"><h4>Sign Out</h4></a></div>
                                        </div>    
                                    <%}
                                %>
                                                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <div class="log_resp"></div>
    </body>
</html>
