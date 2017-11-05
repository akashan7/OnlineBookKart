$(document).ready(function(){
    $('.price').on('input',function(){
      $('.p_f').html($(this).val());
    });
    $('.prod_list').hover(function(){
        $(this).css({"box-shadow": "0px 0px 10px 5px #4e4e4e"});},function(){
        $(this).css({"box-shadow": ""});
    });
//    $('#frm').on('submit',function(){
//        try{
//            $.ajax({
//              type: 'POST',
//              async: false,
//              cache: false,
//              data: {'cname':$('.cname').val(),'cmail':$('.cmail').val(),'cmessage':$('.cmessage').val() },
//              url: $(this).attr('action'),
//              success: function (data) {
//                $('.msg').html(data);
//            }            
//            });
//        }catch(e){
//            
//        }
//      
//      return false;
//    });
});