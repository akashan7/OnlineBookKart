<%-- 
    Document   : education
    Created on : Oct 10, 2017, 10:59:54 PM
    Author     : hackey.jay
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.dao.ProductDetailsImp"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel='shortcut icon' href='img/t_ico.png' type='image/x-icon'>
    <link rel='icon' href='img/t_ico.png' type='image/x-icon'>
    <link rel="stylesheet" type="text/css" href="css/align.css"/>
    <link rel="stylesheet" type="text/css" href="css/product_cate.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>
    <script src="js/vendor/jquery-3.2.1.min.js"></script>
    <script src="js/price_meter.js"></script>    
    <script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
    <title>Education & Teaching</title>
</head>
<body>
    <div class="main">
        <nav class="header">
            <jsp:include page="/nav"></jsp:include>
        </nav>
        <section class="content">
            <div class="display_Prod">
                <div class="search_item">
                    <div class="over">
                        <label>Price</label>
                        <div class="price_tag">
                            <input class="price" type="range" min="100" max="5000" value="50"/>                            
                        </div>
                        <div class="meter">
                        <p class="p_f">0</p>
                        <p>5000</p>
                        </div>
                    </div>
                </div>
                <div class="all_prod">
                    <div class="headding">
                        <div class="nav-finder"><p>Education & Teaching/</p></div>
                        <div class="sort">
                            <select>
                                <option selected disabled>Sort</option>
                                <option>Name</option>
                                <option>Date</option>                            
                            </select>
                        </div>
                    </div>
                    <div class="design_bd">
                        <div class="hov">
                            <%      
                                try{
                                    int counter=0;
                                    int i=0;
                                    String c_id=(String)request.getParameter("cat");
                                    System.out.println(c_id);
                                    int cId=new Integer(c_id);
                                    ProductDetailsImp pd=new ProductDetailsImp();                                
                                    ResultSet rs=pd.prodRetrive(cId);

                                    while(rs.next()){
                                        i++;
                                %>
                                <div class="all-prodnew_<%=counter++%>">
                                    <center>
                                        <div  class="prod_list">
                                            <div class="prod_<%=counter++%>">
                                                <a href="prod_det?cat_id=<%=rs.getString(2)%>&prod_id=<%=rs.getString(1)%>">
                                                    <div><img src="<%=rs.getString(6)%>"/>
                                                        <label class="prc">Rs.<%=rs.getInt(4)%></label>
                                                        <div class="tit_pro"><%=rs.getString(3)%></li></div>
                                                    </div>
                                                </a>
                                                    
                                            </div>
                                    </div>
                                    </center>
                                </div>                                    
                                    <%}
                                    if(i==0){
                                        out.println("<h1 class='text-danger'>No Product Found!!<h1>");
                                    }
                                }catch(IOException sqle){
                                    System.out.println("Products"+sqle.getMessage());
                                }catch(SQLException sqle){
                                    System.out.println("Products"+sqle.getMessage());
                                }catch(NumberFormatException sqle){
                                    out.println("<h1 class='text-danger'>Unknown Access!!<h1>");
                                }catch(Exception e){
                                    System.out.println("Products"+e.getMessage());
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>        
    </div>
    <footer class="footer">
        <jsp:include page="/footer"></jsp:include>
    </footer>
</body>
</html>