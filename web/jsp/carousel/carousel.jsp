<%-- 
    Document   : carousel
    Created on : Oct 6, 2017, 11:10:41 PM
    Author     : hackey.jay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/carousal.css"/>
        <title>Slider</title>        
    </head>
    <body>
        <div id="container"class="container">
          <div id="myCarousel" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li class="item1 active"></li>
              <li class="item2"></li>
              <li class="item3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

              <div class="item active">
                  <img src="img/1.png" alt="Book 1" width="460" height="345">
                <div class="carousel-caption">
                    <a  class="link_sel" href="#"><h3>Online Book Shopping</h3></a>
                  <p>Click to buy your favorite books.</p>
                </div>
              </div>

              <div class="item">
                <img src="img/2.png" alt="Chania" width="460" height="345">
                <div class="carousel-caption">
                    <a class="link_sel" href="#"><h3>Books Library</h3></a>
                  <p>Lets check us.</p>
                </div>
              </div>

              <div class="item">
                <img src="img/3.png" alt="Flower" width="460" height="345">
                <div class="carousel-caption">
                    <a class="link_sel" href="#"><h3>Love Books</h3></a>
                    <p>romeo and juliet,love today, etc.</p>
                </div>
              </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>

        <script>
        $(document).ready(function(){
            // Activate Carousel
            $("#myCarousel").carousel();

            // Enable Carousel Indicators
            $(".item1").click(function(){
                $("#myCarousel").carousel(0);
            });
            $(".item2").click(function(){
                $("#myCarousel").carousel(1);
            });
            $(".item3").click(function(){
                $("#myCarousel").carousel(2);
            });
            // Enable Carousel Controls
            $(".left").click(function(){
                $("#myCarousel").carousel("prev");
            });
            $(".right").click(function(){
                $("#myCarousel").carousel("next");
            });
        });
        </script>
    </body>
</html>
