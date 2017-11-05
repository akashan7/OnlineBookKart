<%-- 
    Document   : AddProduct
    Created on : Oct 14, 2017, 9:55:41 PM
    Author     : hackey.jay
--%>

<%@page language="java" contentType="text/html;charSet=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="js/admin_control.js"></script>      
        <title>Product Add</title>
    </head>
    <body>
    <center>
        <div class="Add color">
            <h2>Add Product</h2>
            <div class="form_add">
                <form id="frm" action="ProdServ" method = "post" enctype= "multipart/form-data">
                    <table class="addprod">
                        <tbody>
                            <tr>
                                <td><lable>Product Name</lable><span class="err er1"></span></td>
                            </tr>
                            <tr>
                                <td><input id="pd" name="p_name" type="text"/></td>
                            </tr>
                            <tr>
                                <td><lable>Category</lable></td>
                            </tr>
                            <tr>
                                <td><select id="sel" name="sel_cat">
                                        <optgroup label="Categories"></optgroup>
                                        <option value="1">Arts and Photography</option>
                                        <option value="2">Computer and Technology</option>
                                        <option value="3">Education and Teaching</option>
                                        <option value="4">Engineering and Transport</option>
                                        <option value="5">Love and Others</option>
                                </select></td>                        
                            </tr>                        
                            <tr>
                                <td><lable>Price</lable><span class="err er2"></span></td>
                            </tr>
                            <tr>
                                <td><input id="pr" name="price" type="number"/></td>
                            </tr>
                            <tr>
                                <td><lable>Product Image</lable></td>
                            </tr>
                            <tr>
                                <td><input id="file" name="file" type="file"/></td>
                            </tr>
                            <tr>
                                <td><lable>Product Description</lable><span class="err er3"></span></td>
                            </tr>
                            <tr>
                                <td><textarea id="txtar"  name="desp" ></textarea></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right"><input id="prod_ad" type="submit" value="Add Product"/></td>                                
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </center>        
    </body>
</html>
