$(document).ready(function(){
    
    var loc=document.getElementsByClassName("log_resp");
    $('#login').on('click',function(){
        try{
            $.get('login',function(responseText) { 
            scrpturl='js/login.js';
            $.getScript(scrpturl);
            document.getElementsByClassName("log_resp")[0].innerHTML=responseText;
            $(loc).fadeIn();
            
        });
        }catch(e){
            
        }
    });
       
      
    $('#reg_user').click(function(){
        try{
            $.get('register',function(responseText) { 
            scrpturl='js/register.js';
            $.getScript(scrpturl);
            document.getElementsByClassName("log_resp")[0].innerHTML=responseText;
            $(loc).fadeIn();            
            });            
        }catch(e){
            
        }
    });
    $('.log-in').click(function(){
        try{
            $.get('login',function(responseText) { 
            scrpturl='js/login.js';
            $.getScript(scrpturl);
            document.getElementsByClassName("log_resp")[0].innerHTML=responseText;
            $(loc).fadeIn();
            
        });
        }catch(e){
            
        }
    });
});