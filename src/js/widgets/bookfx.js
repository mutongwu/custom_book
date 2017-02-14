(function(mod){
	function BookFx(cfg){
	    this.init(cfg);
	    return this;
	}
	$.extend(BookFx.prototype,{
		defaultCfg: {
	        $cnt: null,
	        data: null
	    },
	    init: function(cfg){
	        this.config = $.extend({},this.defaultCfg,cfg);
	        
	        this._initDom();
	        this._initEvent();
	    },

	    
	    _initDom: function(){
	    	this.config.$lettersBox = this.config.$cnt.find('.lettersBox');
	        this.config.$bookBox = this.config.$cnt.children('.Heidelberg-Book');
	    },

	    _initEvent: function(){
	        var _this = this;
		    this.config.$lettersBox.on("click",".letterItem",function(){
		       	var el = $(this);
		       	_this._checkLetter(el);
		    });
	    },
	    _checkLetter: function(el){
	    	if(el.hasClass('active')){
	    		return;
	    	}
	    	var idx = el.index();
	    	console.log(idx)
	    }
	});


	mod.BookFx = BookFx;
})(window.App)