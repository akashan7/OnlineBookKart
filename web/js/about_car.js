$(document).ready(function(){
    var counter=0;
    var srcArray = ["img/about_2.png","img/about_1.png","img/about_3.png","img/about_4.png","img/about_5.png"];
    var overall=srcArray.length-1;
    if(counter===0 || counter<0){
           $('.control div:first-child').hide();
    }
    $('.control div:eq(1)').html(counter+"/"+overall);
    if(counter<=srcArray.length){
    $('.control div:first-child').click(function(){
       $('.About_car img').hide().fadeIn(1500).attr('src',srcArray[--counter]); 
       $('.control div:eq(1)').html(counter+"/"+overall);
       if(counter===0 || counter<0){
           $(this).hide();
       }else if(counter===overall-1){
           $('.control div:last-child').show();
       }
    });
    $('.control div:last-child').click(function(){
       $('.About_car img').hide().fadeIn(1500).attr('src',srcArray[++counter]); 
       $('.control div:eq(1)').html(counter+"/"+overall);
       if(counter===srcArray.length-1){           
           $(this).hide();
       }else if(counter===1){
           $('.control div:first-child').show();
       }
    });
    }
});