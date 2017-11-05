$(document).ready(function(){
    $('#cross').click(function(){
        try{
            $('.log_resp').fadeOut().empty();            
        }catch(e){            
        }       
    });
    $('form').on('submit',function(){        
        if($('#rname_txt').val()==='' && $('#ruser_txt').val()==='' && $('#rpass_txt').val()==='' 
                && $('#crpass_txt').val()==='' 
                && $('#rAge').val()==='' 
                && $('#rEmail').val()==='' && $('#mobile').val()==='' && $('#address').val()===''){            
            $('#rname_txt').css({'border':'1px solid red'});  
            $('#ruser_txt').css({'border':'1px solid red'});  
            $('#rpass_txt').css({'border':'1px solid red'});  
            $('#crpass_txt').css({'border':'1px solid red'});  
            $('#rAge').css({'border':'1px solid red'});  
            $('#rEmail').css({'border':'1px solid red'});  
            $('#mobile').css({'border':'1px solid red'});  
            $('#address').css({'border':'1px solid red'});  
            return false;
        }
        else if($('#rname_txt').val()===''){
            $('#rname_txt').css({'border':'1px solid red'});  
            return false;
        }
        else if($('#ruser_txt').val()===''){
            $('#ruser_txt').css({'border':'1px solid red'});  
            return false;
        }       
        else if($('#rpass_txt').val()===''){
            $('#rpass_txt').css({'border':'1px solid red'});  
            return false;
        }       
        else if($('#crpass_txt').val()===''){
            $('#crpass_txt').css({'border':'1px solid red'});  
            return false;
        }       
        else if($('#rAge').val()===''){
            $('#rAge').css({'border':'1px solid red'});  
            return false;
        }       
        else if($('#rEmail').val()===''){
            $('#rEmail').css({'border':'1px solid red'});  
            return false;
        }       
        else if($('#mobile').val()===''){
            $('#mobile').css({'border':'1px solid red'});  
            return false;
        }       
        else if($('#address').val()===''){
            $('#address').css({'border':'1px solid red'});  
            return false;
        }       
    });
    $('#rname_txt').blur(function(){                  
       if($('#rname_txt').val()===''){
           $(this).css({'border':'1px solid red'});
            return false;
        }else{
            $(this).css({'border':'1px'});
            return false;
        }
    });
    $('#ruser_txt').blur(function(){                  
       if($('#ruser_txt').val()===''){
           $(this).css({'border':'1px solid red'});
            return false;
        }else{
            $(this).css({'border':'1px'});
            return false;
        }
    });
    $('#rpass_txt').blur(function(){                  
       if($('#rpass_txt').val()===''){
           $(this).css({'border':'1px solid red'});
            return false;
        }else{
            $(this).css({'border':'1px'});
            return false;
        }
    });
    $('#crpass_txt').on('blur',function(){ 
        pass=$('#rpass_txt').val();        
       if($('#crpass_txt').val()===''|| pass!==$(this).val()){
           $(this).css({'border':'1px solid red'});
            return false;
        }else{
            $(this).css({'border':'1px'});
            return false;
        }
    });
    $('#rAge').blur(function(){                  
       if($('#rAge').val()===''){
           $(this).css({'border':'1px solid red'});
            return false;
        }else{
            $(this).css({'border':'1px'});
            return false;
        }
    });
    $('#rEmail').on('blur',function(){    
        if(!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($(this).val())){
            $(this).css({'border':'1px solid red'});
            return false;
        }
       if($('#rEmail').val()===''){
           $(this).css({'border':'1px solid red'});
            return false;
        }else{
            $(this).css({'border':'1px'});
            return false;
        }
    });
    $('#mobile').blur(function(){                  
       if($('#mobile').val()===''){
           $(this).css({'border':'1px solid red'});
            return false;
        }else{
            $(this).css({'border':'1px'});
            return false;
        }
    });
    $('#address').blur(function(){                  
       if($('#address').val()===''){
           $(this).css({'border':'1px solid red'});
            return false;
        }else{
            $(this).css({'border':'1px'});
            return false;
        }
    });
});