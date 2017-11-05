<%-- 
    Document   : product_details
    Created on : Oct 12, 2017, 12:33:34 AM
    Author     : hackey.jay
--%>

<%@page import="com.dao.ProductDetailsImp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.dao.UserDetailsImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='shortcut icon' href='img/t_ico.png' type='image/x-icon'>
        <link rel='icon' href='img/t_ico.png' type='image/x-icon'>
        <link rel="stylesheet" type="text/css" href="css/align.css"/>
        <link rel="stylesheet" type="text/css" href="css/final_product.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
        <script src="js/vendor/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
        <script src="js/cart.js"></script>
        <title></title>
    </head>
    <body>
        <div class="main">
        <nav class="header">
            <jsp:include page="/nav"></jsp:include>
        </nav>
        <section class="content">
            <%
            int i=0;
            String category=request.getParameter("cat_id");
            String prod_id=request.getParameter("prod_id");            
            try{   
                int c=Integer.valueOf(category);
                int p=Integer.valueOf(prod_id);                
                ProductDetailsImp pd=new ProductDetailsImp();
                ResultSet rs;
                rs=pd.SelectRetrive(c, p);
                    while(rs.next()){  
                        i++;
            %>
            <div class="Product <%=rs.getString(3)%>">
                <div class="prod_in">
                    <div class="details">
                        <div class="prod_heading">
                            <h3><%=rs.getString(3)%></h3>
                        </div>
                        <div class="prod_img">
                            <img src="<%=rs.getString(6)%>"/>
                        </div>
                        <div class="prod_desp">
                            <h4>Description:</h4>
                            <p><%=rs.getString(5)%></p>
                        </div>
                    </div>
                </div>
                <div class="cart_option">
                    <div class="inside_menu">
                        <div class="range">
                            <lable>No : </lable><input class="number_cart" type="number" name="quantity" min="1" max="5"/>
                            <label>x</label>
                            <div class="prc_view">
                            <input id="prc" type="hidden" value="<%=rs.getString(4)%>"/>
                            <input id="prc-view" type="text" value=""/>
                            <label>Rs</label>
                            </div>
                            
                        </div>
                        
                        <div class="btn-cart">
                            <input id="id_prd" type="hidden" value="<%=rs.getString(1)%>"/>
                            <button id="btn-cart" class="btn btn-secondary"  type="submit">Add to cart</button>
                        </div>
                        <div>
                            <div class="cart-result">

                            </div>  
                        </div>
                    </div>
		</div>	
            </div>                      
            <%}  if(i==0){
                        out.println("<h1 class='text-danger'>Wrong Product!!<h1>");
                }
            }
            catch(NumberFormatException nfe){
                out.println("<h1 class='text-danger'>Unknown Access!!<h1>");
            }catch(Exception sqle){
                System.out.println(sqle.getMessage());
            }
        %>
        </section>
    </div>
    <footer class="footer ">
        <jsp:include page="/footer"></jsp:include>
    </footer>
    </body>
</html>
