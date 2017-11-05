//order VAlidation
$(document).ready(function(){
    $('#fname').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".error-fn").html("<p>Please Enter your First Name</p>");
            return false;
        }else{
            $(".error-fn").html("");
        }
    });
    $('#fname').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".error-fn").html("");
        }
    });
    $('#lname').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".error-ln").html("<p>Please Enter your Last Name</p>");
            return false;
        }else{
            $(".error-ln").html("");
        }
    });
    $('#lname').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".error-ln").html("");
        }
    });
    $('#ord-mail').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".error-em").html("<p>Please Enter your Email</p>");
            return false;
        }else{
            $(".error-em").html("");
        }
        if(!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($(this).val())){
            $(".error-em").html("Invalid Email Id!!!");
        }
    });
    $('#ord-mail').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".error-em").html("");
        }
        
    });
    $('#ord-ph').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".error-ph").html("<p>Please Enter your Phone No</p>");
            return false;
        }else{
            $(".error-ph").html("");
        }
        if(!/([0-9]{10})+$/.test($(this).val())){
            $(".error-ph").html("only numbers");
        }
    });
    $('#ord-ph').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".error-ph").html("");
        }
    });
    $('#ord-ad').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".error-da").html("<p>Please Enter your Address</p>");
            return false;
        }else{
            $(".error-da").html("");
        }
    });
    $('#ord-ad').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".error-da").html("");
        }
    });
    
    
    $('#frm-action').on('submit',function(){
        if($('.frm-in input[type="text"]').val()===null || $('.frm-in input[type="text"]').val()==="" || $('.frm-in textarea').val()==="" || $('.frm-in textarea').val()===null || $('.frm-in input[type="email"]').val()==="" || $('.frm-in input[type="email"]').val()===null){
            $(".error-sm").html("Must Fill All Fields!!!");
            return false;
        }
        
    });
});