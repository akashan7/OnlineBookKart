$(document).ready(function(){
    $('.number_cart').val(1);
    $('#prc-view').val($('#prc').val()).prop("disabled",true);
    $('.number_cart').on('input',function(){
        $('#prc-view').val($(this).val()*$('#prc').val());
        if($(this).val()>=5){
            $('.cart-result').show().html("max 5 only.").delay(1000).fadeOut();
        }else{
            $('.cart-result').empty();
        }
    });
    
    $('#btn-cart').on('click',function(){
      //alert($('#id_prd').val() + " "+ $(".number_cart").val());
      $.ajax({
            cache: false,
            type: 'POST',            
            data: {"id_prd" : $('#id_prd').val(), "noCart": $(".number_cart").val(),"prd_price" : $('#prc-view').val()},
            url: "CartSer",
            success: function (data, textStatus, jqXHR) {
                $('.cart-result').show().html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('.cart-result').show().html(jqXHR);
            }
      });
      return false;
   });
   
   $('.ord-del').on('click',function(){
       //alert($(this).val());
        var check =confirm('Are you sure to remove?');
        if(check){
            $.ajax({
                 cache: false,
                 type: 'POST',            
                 data: {"cit-id": $(this).val()},
                 url: "DeleteCart",
                 success: function (data, textStatus, jqXHR) {                     
                     window.location.reload(true);
                 },
                 error: function (jqXHR, textStatus, errorThrown) {
                     alert('try again...');
                 }
           });
        }
      return false;
   });
   //all cart delete
   $('.ord-del-all').on('click',function(){
       //alert($(this).val());
        var check =confirm('Are you sure to remove all?');
        if(check){
            $.ajax({
                 cache: false,
                 type: 'POST',            
                 data: {"c-id-all": $(this).val()},
                 url: "DeleteACS",
                 success: function (data, textStatus, jqXHR) {                     
                     window.location.reload(true);
                 },
                 error: function (jqXHR, textStatus, errorThrown) {
                     alert('try again...');
                 }
           });
        }
      return false;
   });
   $('#ord-cfm-all').on('click',function(){
       $('.order-prd-all').slideToggle();
      return false;
   });
});