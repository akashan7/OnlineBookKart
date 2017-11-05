<%-- 
    Document   : contact
    Created on : Oct 7, 2017, 4:26:50 PM
    Author     : hackey.jay
--%>

<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int UserID=0;
    session=request.getSession(false);
    //session to check user is logged in or not
    if(session.getAttribute("user")!=""){
    int check=0;
    UserDetailsImp user=new UserDetailsImp();
    check=user.getUser((String)session.getAttribute("user"));
    if(check>0){
        UserID=UserDetailsImp.userId;
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
    <link rel="stylesheet" type="text/css" href="css/contact.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
    <script src="js/vendor/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
    <title>Contact Us</title>
    <style>
        .link_a:visited{
            color: whitesmoke;
            text-decoration: none;
        }
        .link_a:active{
            color: whitesmoke;
            text-decoration: none;
        }
        .link_a:hover {
            text-shadow: 0px 0px #fff;
            text-decoration: none;
        }
        .link_a:link{
            color: whitesmoke;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="main">
        <nav class="header">
            <jsp:include page="/nav"></jsp:include>
        </nav>
        <section class="content">
            <div class="outer_con">
                <center>
                    <div class="inner_con">
                        <div class="con_left">
                            <h3>Contact Us!</h3>
                            <p>We can't solve your problem if you not tell us about it!</p>
                            <div >
                                <form id="frm" action="ContactUs" method="post">
                                    <ul class="list-unstyled">
                                        <input name="id" type="hidden" value="<%= UserID %>"/>
                                        <li class="list_li" ><input name="cname" class="cname form-control" type="text" placeholder="Your Name"/></li>
                                        <li class="list_li" ><input name="cmail" class="cmail form-control" type="email" placeholder="Email"/></li>
                                        <li class="list_li" ><textarea name="cmessage" class="cmessage txt_area form-control" placeholder="Message"></textarea></li>
                                        <li class="list_li" ><button class="btn btn-info" type="submit">Feedback</button><span style="color:red;position: absolute;margin-left: 50px;margin-top: 7px;" class="msg">
                                        <%=(session.getAttribute("success")==null) ? "" :  session.getAttribute("success")%>
                                        <% session.removeAttribute("success"); %>
                                        <%=(session.getAttribute("error")==null) ? "" :  session.getAttribute("error")%>
                                        <% session.removeAttribute("error"); %>
                                            </span></li>
                                    </ul>
                                </form>
                            </div>
                        </div>
                        <div class="con_right">
                            <div class="con_text">
                                <h4>India,Tamil Nadu</h4>
                                <h4>+91-9677042859</h4>
                                <h5><a class="link_a" href="mailto:Jpn26prakash@gmail.com">Jpn26prakash@gmail.com</a></h5>
                                <div>
                                    <ul class="imgs">
                                        <a href="#"><li class="fb"></li></a>
                                        <a href="#"><li class="gm"></li></a>
                                        <a href="#"><li class="tw"></li></a>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </center>
            </div>        
        </section>        
    </div>
    <footer class="footer">
        <jsp:include page="/footer"></jsp:include>
    </footer>
</body>
</html>
