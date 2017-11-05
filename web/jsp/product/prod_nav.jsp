<%-- 
    Document   : prod_nav
    Created on : Oct 10, 2017, 2:01:52 PM
    Author     : hackey.jay
--%>

<%@page import="com.dao.ProductDetailsImp"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/product.css"/>
        <script type="text/javascript" src="js/prod_nav.js"></script>
        <title>Product</title>
    </head>
    <body>
    <center>
        <div class="outer_prod">
            <div class="prod_sample">
                <div class="prod_sel">
                    <ul>
                        <a ><li class="prod_li">Latest Books</li></a>
                        <a ><li class="prod_li">Computer Books</li></a>
                        <a ><li class="prod_li">Love Books</li></a>
                        <a ><li class="prod_li">Marketing Books</li></a>
                        <a ><li class="prod_li">Technology Books</li></a>
                    </ul>
                </div>
                <%
                    ResultSet rs=null;
                    ProductDetailsImp dbprod = new ProductDetailsImp();
                    
                %>
                <div class="prod_data Latest">
                    <div class="prod_split">
                        <%
                            rs=dbprod.getLatest();
                            while(rs.next()){%>
                            <div class="data">
                                <div class="data_content">
                                    <a href="prod_det?cat_id=<%=rs.getInt(2)%>&prod_id=<%=rs.getInt(1)%>"><img src="<%=rs.getString(4)%>"/><h3 title="New Collections..."><%=rs.getString(3)%></h3></a>                                
                                </div>
                            </div>
                        <%}%>
                    </div>
                </div>
                    
                <div class="prod_data Up_come">
                    <div class="prod_split">
                        <%
                            rs=dbprod.getNavProd(2);
                            while(rs.next()){%>
                        <div class="data">
                            <div class="data_content">
                                <a href="prod_det?cat_id=<%=rs.getInt(2)%>&prod_id=<%=rs.getInt(1)%>"><img src="<%=rs.getString(4)%>"/><h3 title="<%=rs.getString(3)%>"><%=rs.getString(3)%></h3></a>
                            </div>
                        </div>
                        <%}%>
                    </div>                    
                </div>
                <div class="prod_data Love_books">
                    <div class="prod_split">
                        <%
                            rs=dbprod.getNavProd(5);
                            while(rs.next()){%>
                        <div class="data">
                            <div class="data_content">
                                <a href="prod_det?cat_id=<%=rs.getInt(2)%>&prod_id=<%=rs.getInt(1)%>"><img src="<%=rs.getString(4)%>"/><h3 title="<%=rs.getString(3)%>"><%=rs.getString(3)%></h3></a>
                            </div>
                        </div>
                        <%}%>                        
                    </div>
                </div>
                <div class="prod_data Marketing">
                    <div class="prod_split">
                         <%
                            rs=dbprod.getNavProd(3);
                            while(rs.next()){%>
                        <div class="data">
                            <div class="data_content">
                                <a href="prod_det?cat_id=<%=rs.getInt(2)%>&prod_id=<%=rs.getInt(1)%>"><img src="<%=rs.getString(4)%>"/><h3 title="<%=rs.getString(3)%>"><%=rs.getString(3)%></h3></a>
                            </div>
                        </div>
                        <%}%>  
                    </div>
                </div>
                <div class="prod_data Science">
                    <div class="prod_split">
                        <%
                            rs=dbprod.getNavProd(4);
                            while(rs.next()){%>
                        <div class="data">
                            <div class="data_content">
                                <a href="prod_det?cat_id=<%=rs.getInt(2)%>&prod_id=<%=rs.getInt(1)%>"><img src="<%=rs.getString(4)%>"/><h3 title="<%=rs.getString(3)%>"><%=rs.getString(3)%></h3></a>
                            </div>
                        </div>
                        <%}%>  
                    </div>
                </div>
                <div class="data_final">
                    <div class="data_All">
                        <a href="#"></a>
                    </div>
                </div>
            </div>
        </div>
    </center>
    </body>
</html>
