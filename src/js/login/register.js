$(function(){
    var $form = $('.registerForm');
    $form.find('.ui-tab .tabItem').on('click',function(){
        var el = $(this);
        el.addClass("active").siblings().removeClass("active");
        $form.find('.phoneRegister, .emailRegister').toggleClass("none");
    });
})