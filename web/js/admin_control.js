$(document).ready(function(){
   //navigation
   loc=document.getElementsByClassName("inner_content");
   $('.prod_sub_edit div:eq(0)').click(function(){       
       try{
            $.get('AddProd',function(responseText) { 
            scrpturl='js/admin_control.js';
            $.getScript(scrpturl);
            document.getElementsByClassName("inner_content")[0].innerHTML=responseText;
        });
        }catch(e){
            
        }       
   });
   $('.prod_sub_edit div:eq(1)').click(function(){ 
       try{
            $.get('View_prod',function(responseText) { 
            scrpturl='js/admin_control.js';
            $.getScript(scrpturl);
            document.getElementsByClassName("inner_content")[0].innerHTML=responseText;
        });
        }catch(e){
            
        }          
   });
   $('.user_sub_edit div:eq(0)').click(function(){
       try{
            $.get('AddUser',function(responseText) { 
            scrpturl='js/admin_control.js';
            $.getScript(scrpturl);
            document.getElementsByClassName("inner_content")[0].innerHTML=responseText;
        });
        }catch(e){
            
        }         
   });
   $('.user_sub_edit div:eq(1)').click(function(){
       try{
            $.get('ViewUser',function(responseText) { 
            scrpturl='js/admin_control.js';
            $.getScript(scrpturl);
            document.getElementsByClassName("inner_content")[0].innerHTML=responseText;
        });
        }catch(e){
            
        }       
   });
   
   
   //validation for adding product
   $('.addprod td:nth-child(4)').css('position','absolute');
   
    var height = $(document).height();
   $(document).css("height",height+50);
   
   
   $('#pd').blur(function(){
       if($(this).val()===''){
           $('.er1').html('<span style="color:red;">Enter the product name.</span>'); 
       }else{
           $('.er1').html('');
       }      
   });
   $('#pr').on('blur',function(){
       if($(this).val()===''){
               $('.er2').html('<span style="color:red;">Enter the price !!!.</span>');            
       }else{
           $('.er2').html('');
       }
   });
   $('#txtar').blur(function(){
       if($(this).val()===''){
           $('.er3').html('<span style="color:red;">Enter the product Description.</span>'); 
       }else{
           $('.er3').html('');
       }      
   });
   
   //add product ajax
   $('#frm').submit(function(e){
       if($('#pd').val()==="" || $('#pr').val()==="" || $('#txtar').val()==="" ){
            alert('Enter all fields');
        return false;    
       }
   });
   
    $('#edit,#edit-u').prop("disabled", true);
    $('#del,#del-u').prop("disabled", true);
    $('.table_data input[type="checkbox"]:eq(0)').on('click',function(){
        
       if($(this).prop("checked")===true){
           $('input[type="checkbox"]').prop("checked", true);
           $('#del,#del-u').prop("disabled", false);
           $('#edit,#edit-u').prop("disabled", true);
           
       }else{
           $('input[type="checkbox"]').prop("checked", false);
           $('#edit,#edit-u').prop("disabled", false);
           $('#del,#del-u').prop("disabled", true);
       }
    });    
    $('.table_data input[type="checkbox"]').on('click',function(){
       if($('input:checked').length >0 && $('input:checked').length <2 && $('.table_data input[type="checkbox"]:eq(0)').prop("checked")===false){
           $('#edit,#edit-u').prop("disabled", false);           
       }else{
           $('#edit,#edit-u').prop("disabled", true);
       }    
       if($(this).prop("checked")===true){
           $('#del,#del-u').prop("disabled", false);
       }else if($('input:checked').length===0){
           $('#del,#del-u').prop("disabled", true);
       }
    });  
    //delete prod
    $('#del').on('click',function (){
        //alert($('input:checked').val());
        var con=confirm('Deleting request!!!');
        if(con){
            
            $.ajax({
                async: true,
                cache: false,
                type: 'POST',
                url: "DeleteProd",
                data: {"ProdID":$('input:checked').val()},
                success: function (data, textStatus, jqXHR) {
                    $.get('View_prod',function(responseText) { 
                        scrpturl='js/admin_control.js';
                        $.getScript(scrpturl);
                        document.getElementsByClassName("inner_content")[0].innerHTML=responseText;
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    });
    //delete User
    $('#del-u').on('click',function (){
        //alert($('input:checked').val());
        var con=confirm('Deleting request!!!');
        if(con){
            $.ajax({
                async: true,
                cache: false,
                type: 'POST',
                url: "DeleteUser",
                data: {"usd":$('input:checked').val()},
                success: function (data, textStatus, jqXHR) {
                    $.get('ViewUser',function(responseText) { 
                        scrpturl='js/admin_control.js';
                        $.getScript(scrpturl);
                        document.getElementsByClassName("inner_content")[0].innerHTML=responseText;
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(errorThrown);
                }
            });
        }
    });
    
    //view Image
    $('.imgs img').on('click',function(){
       $('.view-img img').fadeIn().attr("src",$(this).attr("src"));
    });
    $('.view-img img').on('click',function(){
        $(this).fadeOut(1000);
        $(this).attr("src","");
    });   
    
    
    
    
    
    //User VAlidation

    $('#fname').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".err-fn").html("<p>Please Enter your First Name</p>");
            return false;
        }else{
            $(".err-fn").html("");
        }
    });
    $('#fname').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".err-fn").html("");
        }
    });
    $('#uname').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".err-usr").html("<p>Please Enter your Username</p>");
            return false;
        }else{
            $(".err-usr").html("");
        }
    });
    $('#uname').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".err-usr").html("");
        }
    });
    $('#pwd').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".err-pwd").html("<p>Please Enter your password</p>");
            return false;
        }else{
            $(".err-pwd").html("");
        }
    });
    $('#pwd').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".err-pwd").html("");
        }
    });
    $('#c-pwd').on('blur',function(){
        if($(this).val()!==$('#pwd').val()){
            $(".err-c-pwd").html("<p>Password not match</p>");
            return false;
        }else{
            $(".err-c-pwd").html("");
        }
    });
    $('#c-pwd').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".err-c-pwd").html("");
        }
    });
    $('#age').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".err-age").html("<p>Please Enter your age</p>");
            return false;
        }else{
            $(".err-age").html("");
        }
    });
    $('#age').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".err-age").html("");
        }
    });
    $('#email').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".err-em").html("<p>Please Enter your Email</p>");
            return false;
        }else{
            $(".err-em").html("");
        }
        if(!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($(this).val())){
            $(".err-em").html("Invalid Email Id!!!");
        }
    });
    $('#email').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".err-em").html("");
        }
        
    });
    $('#mobile-n').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".err-mn").html("<p>Please Enter your Phone No</p>");
            return false;
        }else{
            $(".err-mn").html("");
        }
        if(!/([0-9]{10})+$/.test($(this).val())){
            $(".err-mn").html("only numbers");
        }
    });
    $('#mobile-n').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".err-mn").html("");
        }
    });
    $('#txtarea').on('blur',function(){
        if($(this).val()===null || $(this).val()===""){
            $(".err-add").html("<p>Please Enter your Address</p>");
            return false;
        }else{
            $(".err-add").html("");
        }
    });
    $('#txtarea').keyup(function(){
        if($(this).val()!==null || $(this).val()!==""){
            $(".err-add").html("");
        }
    });
    
    
    $('#frm-action').on('submit',function(){
        if($('.frm-in input[type="text"]').val()===null || $('.frm-in input[type="text"]').val()==="" || $('.frm-in textarea').val()==="" || $('.frm-in textarea').val()===null || $('.frm-in input[type="email"]').val()==="" || $('.frm-in input[type="email"]').val()===null || $("input[name=gender]:checked").length===0 ){
            
            $(".err-sm").html("Must Fill All Fields!!!");
            return false;
        }
        
    });
    
});
