(function(mod){
	function slider(cfg){
	    this.init(cfg);
	    return this;
	}
	$.extend(slider.prototype,{
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
	        this._initWH();
	        this._initDom();
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
	    _animateFn: function(nextIdx){
	    	var _this = this;
	    	if(this.animateLock){
	            return;
	        }
	        this.animateLock = true;
	        var num = this.config.num;
	        var curr = this.config.curr;
	        nextIdx = typeof nextIdx === "undefined" ? (curr + this.config.direction + num)%num : nextIdx;

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
	            _this.animateLock = false;
	            _this.config.curr = nextIdx;
	            _this.$sliderBox.find(".sliderNavItem").eq(_this.config.curr).addClass("active").siblings(".sliderNavItem").removeClass("active");
	        });

	        this.activeTimer();
	    },
	    _initDom: function(){
	    	this.config.$slider = this.config.$sliderBox.children('.slider');
	        this.config.$items = this.config.$slider.children('.sliderItem');
	        this.config.w0 = 0;
	        this.config.num = this.config.$items.length;
	    },
	    _initWH: function(){
	        var w0 = this.config.w0 = Math.max($(document.body).width(),980);//$slider.width();
	        this.config.$sliderBox.width(w0);
	        // $items.width(w0).filter(":not(" + curr + ")").css("left", w0 + "px");
	        // $items.width(w0).filter(":eq("+ curr + ")").css("zIndex",1);
	        // $slider.width(w0 * num);

	        this.config.$items.width(w0).filter(":not(" + this.config.curr + ")").css( this.config.effect,0);
	        this.config.$items.filter(":eq("+ this.config.curr + ")").css(this.config.effect,1);
	    },

	    _initEvent: function(){
	        var _this = this;
            $(window).resize(function(){
		        _this._initWH();
		    });

		    $sliderBox.on("click",".sliderNavLeft",function(){
		        _this.config.direction = -1;
		        _this.clearTimer();
		        _this.animateFn();
		    }).on("click",".sliderNavRight",function(){
		        _this.config.direction = 1;
		        _this.clearTimer();
		        _this.animateFn();
		    }).on("click",".sliderNavItem",function(){
		        if($(this).hasClass("active")){
		            return;
		        }
		        var idx = $(this).index();

		        $(this).addClass("active").siblings(".sliderNavItem").removeClass("active");

		        _this.animateFn(idx);
		    });
	    }
	});


	mod.SimpleSlider = slider;
})(window.App)