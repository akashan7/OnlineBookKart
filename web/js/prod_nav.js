$(document).ready(function(){  
    //product change and active
   $('.prod_sel a:nth-child(1)').on('click',function(){
       $('.Latest').fadeIn(2000).css({"display":"block","z-index":"1"});
       $('.Up_come').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Love_books').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Marketing').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Science').css({"display":"none","z-index":"0"}).fadeOut(1000);
       
       $('.prod_sel li:eq(0)').css("background-color","#222");
       $('.prod_sel li:eq(1)').css("background-color","#203e57");
       $('.prod_sel li:eq(2)').css("background-color","#203e57");
       $('.prod_sel li:eq(3)').css("background-color","#203e57");
       $('.prod_sel li:eq(4)').css("background-color","#203e57");
   });
   $('.prod_sel a:nth-child(2)').on('click',function(){
       $('.Up_come').fadeIn(2000).css({"display":"block","z-index":"1"});
       $('.Latest').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Love_books').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Marketing').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Science').css({"display":"none","z-index":"0"}).fadeOut(1000);
       
       $('.prod_sel li:eq(1)').css("background-color","#222");
       $('.prod_sel li:eq(0)').css("background-color","#203e57");
       $('.prod_sel li:eq(2)').css("background-color","#203e57");
       $('.prod_sel li:eq(3)').css("background-color","#203e57");
       $('.prod_sel li:eq(4)').css("background-color","#203e57");      
   });
   $('.prod_sel a:nth-child(3)').on('click',function(){
       $('.Love_books').fadeIn(2000).css({"display":"block","z-index":"1"});
       $('.Latest').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Up_come').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Marketing').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Science').css({"display":"none","z-index":"0"}).fadeOut(1000);
       
       $('.prod_sel li:eq(0)').css("background-color","#203e57");
       $('.prod_sel li:eq(1)').css("background-color","#203e57");
       $('.prod_sel li:eq(2)').css("background-color","#222");
       $('.prod_sel li:eq(3)').css("background-color","#203e57");
       $('.prod_sel li:eq(4)').css("background-color","#203e57");
   });
   $('.prod_sel a:nth-child(4)').on('click',function(){
       $('.Marketing').fadeIn(2000).css({"display":"block","z-index":"1"});
       $('.Latest').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Up_come').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Love_books').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Science').css({"display":"none","z-index":"0"}).fadeOut(1000);
       
       $('.prod_sel li:eq(0)').css("background-color","#203e57");
       $('.prod_sel li:eq(1)').css("background-color","#203e57");
       $('.prod_sel li:eq(2)').css("background-color","#203e57");
       $('.prod_sel li:eq(3)').css("background-color","#222");
       $('.prod_sel li:eq(4)').css("background-color","#203e57");
   });
   $('.prod_sel a:nth-child(5)').on('click',function(){
       $('.Science').fadeIn(2000).css({"display":"block","z-index":"1"});
       $('.Latest').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Up_come').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Love_books').css({"display":"none","z-index":"0"}).fadeOut(1000);
       $('.Marketing').css({"display":"none","z-index":"0"}).fadeOut(1000);
       
       $('.prod_sel li:eq(0)').css("background-color","#203e57");
       $('.prod_sel li:eq(1)').css("background-color","#203e57");
       $('.prod_sel li:eq(2)').css("background-color","#203e57");
       $('.prod_sel li:eq(3)').css("background-color","#203e57");
       $('.prod_sel li:eq(4)').css("background-color","#222");
   });
   //end change and active
   
   //product selection
   $('.data_content img').hover(function(){
      $(this).animate({width:"210px",height:"240px"});},function(){
      $(this).animate({width:"200px",height:"230px"});
   });
   var counter=true;
   $('.data_final').on("click",function(){
       if(counter===true){           
           $('.data_All').css({"transform":"rotate(90deg)"});
           $('.prod_sample').animate({height:"700px"});
           $('.prod_data').animate({height:"700px"});
           $('.prod').animate({padding: "0 0 40% 0"});
           counter=false;
       }else if(counter!==true){           
           $('.data_All').css({"transform":"rotate(-90deg)"});
           $('.prod_sample').animate({height:"330px"});
           $('.prod_data').animate({height:"330px"});
           $('.prod').animate({padding: "0 0 10% 0"});
           counter=true;
       }
       
        });
    
   
//   $('.data_final').on("click",function(){
//      $('.prod_sample').animate({height:"700px"}) ;
//      $('.prod').animate({padding: "0 0 40% 0"});
//      $(this).animate({transform:"rotate(90deg)"});
//   });
});