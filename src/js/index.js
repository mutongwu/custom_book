

$(function () {
    var $sliderBox = $('.sliderBox'),
        $slider = $sliderBox.children('.slider'),
        $items = $slider.children('.sliderItem'),
        w0 = 0,
        num = $items.length;

    var auto = false;
    var curr = 0;
    var direction = 1;
    var timer = null;
    var duration = 7000;

    function initWH(){
        w0 = Math.max($(document.body).width(),980);//$slider.width();
        $sliderBox.width(w0);
        // $items.width(w0).filter(":not(" + curr + ")").css("left", w0 + "px");
        // $items.width(w0).filter(":eq("+ curr + ")").css("zIndex",1);
        // $slider.width(w0 * num);

        $items.width(w0).filter(":not(" + curr + ")").css("opacity",0);
        $items.filter(":eq("+ curr + ")").css("opacity",1);
    }

    initWH();



    var animateLock = false;
    function animateFn(nextIdx){
        if(animateLock){
            return;
        }
        animateLock = true;

        nextIdx = typeof nextIdx === "undefined" ? (curr + direction + num)%num : nextIdx;

        var pre = $items.eq(curr),
            next = $items.eq(nextIdx);

        
        // next.css("left" , w0 * direction);
        pre.animate({
            // "left": -w0 * direction
            "opacity": 0
        },"slow",function(){
            // pre.css("left",w0);
        });

        next.animate({
            // "left": 0
            "opacity": 1
        },"slow",function(){
            animateLock = false;
            curr = nextIdx;
            $sliderBox.find(".sliderNavItem").eq(curr).addClass("active").siblings(".sliderNavItem").removeClass("active");
        });

        activeTimer();
    }

    function activeTimer(){

        if(!timer && auto){
            timer = setInterval(animateFn,duration)  ;
        }
    }

    function clearTimer(){
        if(timer){
            clearInterval(timer);
            timer = null;
        }
    }
    $(window).resize(function(){
        initWH();
    });

    $sliderBox.on("click",".sliderNavLeft",function(){
        direction = -1;
        clearTimer();
        animateFn();
    }).on("click",".sliderNavRight",function(){
        direction = 1;
        clearTimer();
        animateFn();
    }).on("click",".sliderNavItem",function(){
        if($(this).hasClass("active")){
            return;
        }
        var idx = $(this).index();

        $(this).addClass("active").siblings(".sliderNavItem").removeClass("active");

        animateFn(idx);
    });

    activeTimer();
});
