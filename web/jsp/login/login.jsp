<%-- 
    Document   : login
    Created on : Oct 7, 2017, 10:50:12 AM
    Author     : hackey.jay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/login.js"></script>
        <link rel="stylesheet" type="text/css" href="css/login_reg.css"/>
        <title>Login Page</title>
        <style>
            table{
                color:#fff;
            }
            .er{                
                position: absolute;
            }
            
        </style>
    </head>
    <body>
        <center>
            <div id="close" style="color: #fff !important;">
                <div id="cross">
                    <p>&KHcy;</p>
                </div>
                <form id="login_frm_usr" action="home*do" method="post">                    
                    <table>
                        <thead>
                            <tr>
                                <td colspan="3" align="center"><h1>Login</h1></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><label for="user_txt">Username</label></td>
                                <td><label>:</label></td>
                                <td><input id="user_txt" name="user_id" title="Enter username" class="form-control" type="text" placeholder="Enter your username" /></td><td class="er er_usr"><span class="usr"></span></td>
                            </tr>
                            <tr>
                                <td><label for="pass_txt">Password</label></td>
                                <td><label>:</label></td>
                                <td><input id="pass_txt" name="pass_id" class="form-control" type="password" placeholder="Enter your password"/></td><td class="er er_pwd"><span class="pas"></span></td>
                            </tr>
                            <tr>
                                <td colspan="2"><button type="submit" class="btn btn-primary">Login</button></td>
                                <td><button type="reset" class="btn btn-danger">Clear</button></td><td class="er er_smt"><span class="smt"></span></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </center>
    </body>
</html>
