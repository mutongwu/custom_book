(function(mod){
	function FlipBook(cfg){
	    this.init(cfg);
	    return this;
	}
	$.extend(FlipBook.prototype,{
		defaultCfg: {
	        $el: null,
	        curr: 1,
	        duration: 1000,
	        collapseCover: true,
	        atFontCls: 'at-front-cover',
	        atBackCls: 'at-back-cover',
	    },
	    init: function(cfg){
	        this.config = $.extend({},this.defaultCfg,cfg);
	        
	        this._initDom();
	        this._initWH();
	        this._showPage(this.config.curr);
	        this._initEvent();
	    },
	    _initDom: function(){
	    	this.config.$flipBook = this.config.$el.addClass('.flipBook');
	        this.config.$flipBook.children('.j_flipItem').each(function(){
	        	var el = $(this);
	        	el.after(el.clone());
	        });
	        this.config.$flipItems = this.config.$flipBook.children('.j_flipItem');
	        if(this.config.collapseCover){
	        	this.config.$flipBook.addClass('collapseCover');
	        }
	    },
	    _initWH: function(){
	        this.config.w0 = this.config.$flipItems.eq(this.config.curr).width();
	        this.config.h0 = this.config.$flipItems.eq(this.config.curr).height();

	        this.config.$flipItems.css({
				'clip': 'rect(0,' + this.config.w0 + 'px, ' + this.config.h0 + 'px,0)'
			}).filter(function(idx){
				return idx % 2 !== 0
			}).addClass('evenItem');
		},
		_showPage: function(num){
			this._beforePageChange(num);
			this.config.$flipItems.eq(num * 2 - 2).addClass('active');
	        this.config.$flipItems.eq(num * 2 - 1).addClass('active');
	        this._pageChanged(num);
		},
		_flipBack: function(num){
			var _this = this;
			if(!this._beforePageChange(num)){
				return;
			}

			var $flipEl = this.config.$flipItems.eq(num*2 - 1);
			$flipEl.css({
				width: 0,
				left: 0
			}).addClass('fliping');

			var $nextEl = this.config.$flipItems.eq(num*2 - 2);
			$nextEl.addClass('next').css({
				clip: 'rect(0px 0px ' + this.config.h0 + 'px 0px)'
			});
			$nextEl.animate({
				clip: 'rect(0px ' + this.config.w0 + 'px ' +
							 this.config.h0 + 'px  0px)'
			}, 1000,function(){
				_this.config.$flipItems.not(function(idx){
					return (idx === num*2 - 2)  || (idx === num*2 - 1)
				}).removeClass('active');
				$(this).removeClass('next').addClass('active')
			});
			$flipEl.animate({
				width: this.config.w0,
				left: '50%'
			}, 1000,function(){
				_this.config.curr = num;
				$(this).removeClass('fliping').addClass('active');
				_this._pageChanged();
			});
		},
		_flipForward: function(num){
			var _this = this;
			var $flipEl = this.config.$flipItems.eq(num*2 - 2);

			if(!this._beforePageChange(num)){
				return;
			}
			$flipEl.css({
				width: 0,
				left: '100%'
			}).addClass('fliping');

			var $nextEl = this.config.$flipItems.eq(num*2 - 1);
			$nextEl.addClass('next').css({
				clip: 'rect(0px ' + this.config.w0 + 'px ' +
							 this.config.h0 + 'px ' + this.config.w0+ 'px)'
			});
			$nextEl.animate({
				clip: 'rect(0px ' + this.config.w0 + 'px ' +
							 this.config.h0 + 'px  0px)'
			}, this.config.duration,function(){
				_this.config.$flipItems.not(function(idx){
					return (idx === num*2 - 2)  || (idx === num*2 - 1)
				}).removeClass('active');
				$(this).removeClass('next').addClass('active')
			});
			$flipEl.animate({
				width: this.config.w0,
				left: 0
			}, this.config.duration,function(){
				_this.config.curr = num;
				$(this).removeClass('fliping').addClass('active');
				_this._pageChanged();
			});
		},
		_beforePageChange: function(num){
			if(this.config._locked){
				return false;
			}
			this.config._locked = true;
			if(num !== 1){
				this.config.$flipBook.removeClass(this.config.atFontCls);
			}
			if(num !== this.config.$flipItems.length/2){
				this.config.$flipBook.removeClass(this.config.atBackCls);
			}
			return true;
		},
		_pageChanged: function(){
			var _this = this;
			this.config._locked = false;
			var curr = this.config.curr;
			if(curr === 1){
				this.config.$flipBook.addClass(this.config.atFontCls);
			}else if(curr === this.config.$flipItems.length/2){
				this.config.$flipBook.addClass(this.config.atBackCls);
			}
			this.config.onPageTurn && this.config.onPageTurn(curr);
		},
	    _initEvent: function(){
	        var _this = this;
            $(window).on('resize.flipBook',function(){
		        _this._initWH();
		    });

		    this.config.$flipItems.click(function(){
		    	if($(this).next().hasClass('active')){

		    		if(_this.config.curr > 1){
		    			_this._flipBack(_this.config.curr - 1)	
		    		}
		    	}else if($(this).next().size()){
		    		_this._flipForward(_this.config.curr + 1)
		    	}
		    }).hover(function(){
		    	var idx = $(this).index(),
		    		curr = _this.config.curr;
				if($(this).next().hasClass('active')){
					if(curr > 1){
						_this.config.$flipItems.eq(idx - 2).addClass('prevNextItem');	
					}
					
		    	}else if($(this).next().size() && !_this.config.$flipBook.hasClass(_this.config.atBackCls)){
		    		_this.config.$flipItems.eq(idx + 2).addClass('prevNextItem');
		    	}
		    },function(){
		    	_this.config.$flipItems.removeClass('prevNextItem');
		    });
	    },
	    turnPage: function(num){
	    	num = Math.min(Math.max(1, num), this.config.$flipItems.length/2);
	    	if(num > this.config.curr){
	    		this._flipForward(num);
	    	}else if(num < this.config.curr){
	    		this._flipBack(num);
	    	}
	    },
		destroy: function(){
			$(window).off('resize.flipBook');
		}
	});


	mod.FlipBook = FlipBook;
})(window.App)