$(document).ready(function(){    
    $('#cross').click(function(){
        try{
            $('.log_resp').fadeOut().empty();
        }catch(e){            
        }       
    });
    $('form').on('submit',function(){        
        if($('#user_txt').val()==='' && $('#pass_txt').val()===''){            
            $('#user_txt').css({'border':'1px solid red'});  
            $('#pass_txt').css({'border':'1px solid red'});  
            return false;
        }else if($('#user_txt').val()===''){
            $('#user_txt').css({'border':'1px solid red'});  
            return false;
        }else if($('#pass_txt').val()===''){
            $('#pass_txt').css({'border':'1px solid red'});  
            return false;
        }       
    });
    $('#user_txt').blur(function(){                  
       if($('#user_txt').val()===''){
           $(this).css({'border':'1px solid red'});
//           $('.usr').show().html("<p class='text-danger'>Enter your username...</p>");
            return false;
        }else{
            $(this).css({'border':'inherit'});
//            $('.usr').empty().hide();
            return false;
        }
    });
    $('#pass_txt').blur(function(){                  
       if($('#pass_txt').val()===''){           
           $(this).css({'border':'1px solid red'});
//           $('.pas').show().html("<p class='text-danger'>Enter your password...</p>");
            return false;
        }else{
            $(this).css({'border':'inherit'});
            return false;
        }
    });
    $('#user_txt').keyup(function(){                  
       if($('#user_txt').val()!==''){           
           $('.usr').hide();            
        }
    });
    $('#pass_txt').keyup(function(){                  
       if($('#pass_txt').val()!==''){           
           $('.pas').hide();            
        }
    });
    $('#user_txt').blur(function(){  
        if($('#user_txt').val()!==''){
            try{
                $.ajax({
                    cache: false,
                    type: 'POST',
                    url: "LoginCheck?user="+encodeURIComponent($('#user_txt').val()),
                    success: function(data,status){
                        $('.er_usr').html(data);
                    }                    
                });
            }catch(e){

            }
        }
    });
});