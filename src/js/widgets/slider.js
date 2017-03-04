(function(mod){
	function SimpleSlider(cfg){
	    this.init(cfg);
	    return this;
	}
	$.extend(SimpleSlider.prototype,{
		defaultCfg: {
	        $sliderBox: null,
	        effect: 'opacity',
	        auto: true,
	        curr: 0,
	        direction: 1,
	        duration: 7000

	    },
	    init: function(cfg){
	        this.config = $.extend({},this.defaultCfg,cfg);
	        
	        this._initDom();
	        this._initWH();
	        this._initEvent();
	    },

	    activeTimer: function(){
	        if(!this.timer && this.config.auto){
	            this.timer = setInterval(this._animateFn.bind(this), this.config.duration)  ;
	        }
	    },

	    clearTimer: function(){
	        if(this.timer){
	            clearInterval(this.timer);
	            this.timer = null;
	        }
	    },
	    _translateFx: function(pre, next, callback){

	        next.css({
	        	"left": this.config.w0 * this.config.direction,
	        	"zIndex": 2
	        });
	        pre.css({
	        	"left": 0,
	        	"zIndex": 1
	        });
	        pre.animate({
	            "left": -this.config.w0 * this.config.direction
	        },"slow",function(){
	        });

	        next.animate({
	            "left":  0
	        },"slow",callback);
	    },
	    _opacityFx: function(pre, next, callback){
	        next.css({
	        	"zIndex": 2,
	        	"opacity": 0
	        });
	        pre.css({
	        	"zIndex": 1,
	        	"opacity": 1
	        });

	        pre.animate({
	            "opacity": 0
	        },"slow",function(){
	        });

	        next.animate({
	            "opacity": 1
	        },"slow",callback);
	    },
	    _animateFn: function(nextIdx){
	    	var _this = this;
	    	if(this.animateLock){
	            return;
	        }
	        this.animateLock = true;
	        var num = this.config.num;
	        var curr = this.config.curr;
	        nextIdx = typeof nextIdx === "undefined" ? (curr + this.config.direction + num)%num : nextIdx;

	        var pre = this.config.$items.eq(curr),
	            next = this.config.$items.eq(nextIdx);

	        var fx = this._opacityFx;
	        if(this.config.effect === 'translate'){
	        	fx = this._translateFx;
	        }
	        fx.call(this, pre, next, function(){
	        	_this.animateLock = false;
	            _this.config.curr = nextIdx;
	            _this.config.$sliderBox.find(".sliderNavItem").eq(_this.config.curr).addClass("active").siblings(".sliderNavItem").removeClass("active");
	            _this.config.direction = 1;
	        })
	        this.activeTimer();
	    },
	    _initDom: function(){
	    	this.config.$slider = this.config.$sliderBox.children('.slider');
	        this.config.$items = this.config.$slider.children('.sliderItem');
	        this.config.w0 = 0;
	        this.config.num = this.config.$items.length;
	    },
	    _initWH: function(){
	        var w0 = this.config.w0 = this.config.$sliderBox.width(); //Math.max($(document.body).width(),980);//
	        
	        this.config.$sliderBox.width(w0);
	        // $items.width(w0).filter(":not(" + curr + ")").css("left", w0 + "px");
	        // $items.width(w0).filter(":eq("+ curr + ")").css("zIndex",1);
	        // $slider.width(w0 * num);
	        this.config.$items.width(w0).filter(":not(" + this.config.curr + ")").css("z-index", 0);
	        this.config.$items.filter(":eq("+ this.config.curr + ")").css("z-index", 1);
		},
	    _initEvent: function(){
	        var _this = this;
            $(window).resize(function(){
		        _this._initWH();
		    });

		    this.config.$sliderBox.on("click",".sliderNavLeft",function(){
		        _this.config.direction = -1;
		        _this.clearTimer();
		        _this._animateFn();
		    }).on("click",".sliderNavRight",function(){
		        _this.config.direction = 1;
		        _this.clearTimer();
		        _this._animateFn();
		    }).on("click",".sliderNavItem",function(){
		        if($(this).hasClass("active")){
		            return;
		        }
		        var idx = $(this).index();

		        _this.config.direction = idx > _this.config.curr ? 1 : -1;

		        $(this).addClass("active").siblings(".sliderNavItem").removeClass("active");

		        _this._animateFn(idx);
		    });
	    }
	});


	mod.SimpleSlider = SimpleSlider;
})(window.App)