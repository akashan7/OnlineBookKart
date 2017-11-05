<%-- 
    Document   : AddUser
    Created on : Oct 20, 2017, 7:30:54 PM
    Author     : hackey.jay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/admin_control.js"></script>      
        <title>User Add</title>
    </head>
    <body>
    <center>
        <div class="Add-user color">
            <h2>Add User</h2>
            <div class="form_add-user">
                <form id="frm-action" action="UserAdd" method = "post">
                    <div class="frm-in">
                        <table class="adduser">
                            <tbody>
                                <tr>
                                    <td><label>Role</label><span class="err err-rl"></span></td>                                
                                </tr>
                                <tr>
                                    <td><select name="role">
                                            <optgroup label="Role">
                                            <option value="Customer">Customer</option>
                                            <option value="Admin">Admin</option>
                                            </optgroup>
                                        </select></td>                                
                                </tr>
                                <tr>
                                    <td><label>Full Name</label><span class="err err-fn"></span></td>                                
                                </tr>
                                <tr>
                                    <td><input id="fname" name="fname" type="text" placeholder="Enter your name"/></td>                                
                                </tr>
                                <tr>
                                    <td><label>Username</label><span class="err err-usr"></span></td>                                
                                </tr>
                                <tr>
                                    <td><input id="uname" name="uname" type="text" placeholder="Enter your username"/></td>
                                </tr>
                                <tr>
                                    <td><label>Password</label><span class="err err-pwd"></span></td>                                
                                </tr>
                                <tr>
                                    <td><input id="pwd" name="pwd" type="password" placeholder="Enter your password"/></td>
                                </tr>
                                <tr>
                                    <td><label>re-type password</label><span class="err err-c-pwd"></span></td>                                
                                </tr>
                                <tr>
                                    <td><input id="c-pwd" name="c-pwd" type="password" placeholder="Confirm password"/></td>
                                </tr>
                                <tr>
                                    <td><label>Age</label><span class="err err-age"></span></td>           
                                </tr>
                                <tr>
                                    <td><input id="age" name="age" type="number" placeholder="Enter your age"/></td>
                                </tr>
                                <tr>
                                    <td><label>Gender</label> <span class="err err-gn"></span></td>               
                                </tr>
                                <tr>
                                    <td><label class="rd-in"><input id="male" name="gender" value="M" type="radio"/> Male</label>
                                    <label class="rd-in"><input id="fmale" name="gender" value="F" type="radio"/> Female</label></td>
                                </tr>
                                <tr>
                                    <td><label>Email</label><span class="err err-em"></span></td>                                
                                </tr>
                                <tr>
                                    <td><input id="email" name="email" type="email" placeholder="Enter your email"/></td>
                                </tr>
                                <tr>
                                    <td><label>Mobile</label><span class="err err-mn"></span></td>                                
                                </tr>
                                <tr>
                                    <td><input id="mobile-n" name="mobile" type="text" placeholder="Enter your mobile no"/></td>
                                </tr>
                                <tr>
                                    <td><label>Address</label><span class="err err-add"></span></td>                                
                                </tr>
                                <tr>
                                    <td><textarea id="txtarea" name="address" placeholder="Enter your Address"></textarea></td>
                                </tr>
                                <tr>
                                    <td><span class="err err-sm"></span><input type="submit" value="Add User"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </center>        
    </body>
</html>
