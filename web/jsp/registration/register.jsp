<%-- 
    Document   : register
    Created on : Oct 7, 2017, 12:22:35 PM
    Author     : hackey.jay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/register.js"></script>
        <link rel="stylesheet" type="text/css" href="css/login_reg.css"/>
        <title>register</title>
        <style>
            table{
                color:#fff;
            }
        </style>
    </head>
    <body>
        <center id="r_size">
            <div id="close" style="">
                <div id="cross">
                    <p>&KHcy;</p>
                </div>
                <form id="login_frm_reg" action="RegSer" method="post">
                    <table class="rtab">
                        <thead>
                            <tr>
                                <td colspan="3" align="center"><h1>Registration</h1></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><label for="rname_txt">Full Name</label></td>
                                <td><label>:</label></td>
                                <td><input id="rname_txt" name="f_name" class="form-control" type="text" placeholder="Enter your fullname"/></td>
                            </tr>
                            <tr>
                                <td><label for="user_txt">Username</label></td>
                                <td><label>:</label></td>
                                <td><input id="ruser_txt" name="r_user" class="form-control" type="text" placeholder="Enter your username"/></td>
                            </tr>
                            <tr>
                                <td><label for="rpass_txt">Password</label></td>
                                <td><label>:</label></td>
                                <td><input id="rpass_txt" name="r_pass" class="form-control" type="password" placeholder="Enter your password"/></td>
                            </tr>
                            <tr>
                                <td><label for="crpass_txt">Confirm Password</label></td>
                                <td><label>:</label></td>
                                <td><input id="crpass_txt" class="form-control" type="password" placeholder="Confirm password"/></td>
                            </tr>
                            <tr>
                                <td><label for="gender">Gender</label></td>
                                <td><label>:</label></td>
                                <td><label class="radio-inline"><input id="rmale" name="gender" class="radio" type="radio" value="M"/>Male</label><label class="radio-inline"><input id="rfmale" name="gender" class="radio-inline" value="F" type="radio" />Female</label></td>
                            </tr>
                            <tr>
                                <td><label for="rAge">Age</label></td>
                                <td><label>:</label></td>
                                <td><input id="rAge" name="r_age" class="form-control" type="text" max="3" placeholder="Enter your age"/></td>
                            </tr>
                            <tr>
                                <td><label for="rEmail">Email</label></td>
                                <td><label>:</label></td>
                                <td><input id="rEmail" name="r_email" class="form-control" type="email" placeholder="Enter your email"/></td>
                            </tr>
                            <tr>
                                <td><label for="mobile">Mobile</label></td>
                                <td><label>:</label></td>
                                <td><input id="mobile" name="r_mobile" class="form-control" type="text" placeholder="Enter your mobile "/></td>
                            </tr>
                            <tr>
                                <td><label for="address">Address</label></td>
                                <td><label>:</label></td>
                                <td><textarea id="address" name="r_address" class="form-control" cols="10" rows="5" placeholder="Enter your address "></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center"><button type="submit" class="btn btn-primary">Register</button></td>
                                <td><button type="reset" class="btn btn-danger">Clear</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </center>
    </body>
</html>
