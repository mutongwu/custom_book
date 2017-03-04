$(function(){
   $('.helpList .helpItem').on('click',function(){
       $(this).addClass("active").siblings(".helpItem").removeClass("active");
   })
});