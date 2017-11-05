<%-- 
    Document   : aboutus
    Created on : Oct 7, 2017, 4:26:34 PM
    Author     : hackey.jay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel='shortcut icon' href='img/t_ico.png' type='image/x-icon'>
    <link rel='icon' href='img/t_ico.png' type='image/x-icon'>
    <link rel="stylesheet" type="text/css" href="css/align.css"/>
    <link rel="stylesheet" type="text/css" href="css/about.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
    <script src="js/vendor/jquery-3.2.1.min.js"></script>
    <script src="js/about_car.js"></script>
    <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
    <title>About Us</title>
</head>
<body>
    <div class="main">
        <nav class="header">
            <jsp:include page="/nav"></jsp:include>
        </nav>
        <section class="content">
            <div class="About">
                <div>
                    <div class="head_about">
                        <h1>About Us</h1>
                    </div>
                    <div class="para">
                        <p>Bookkart.com Online book seller is the one of the top booking selling company in last 5 years. 
                        We provide all kind of books in affordable price and have a vision to make all persons to get reading habit.                        
                        </p>
                        <p>
                            Now a days we achieve to sold more than 2000 books per month. As soon we achieve our target to 5000 per month.
                        </p>
                    </div>
                </div>
                <div class="About_car">                    
                        <div><img src="img/about_2.png"/></div>
                        <div class="control"><div>◄</div>
                            <div></div>
                            <div>►</div></div>
                </div>
            </div>
        </section>        
    </div>
    <footer class="footer">
        <jsp:include page="/footer"></jsp:include>
    </footer>
</body>
</html>
