(function(mod){
	function BookFx(cfg){
	    this.init(cfg);
	    return this;
	}
	$.extend(BookFx.prototype,{
		defaultCfg: {
	        $cnt: null,
	        data: null,
	        thumbBase: './images/sample/',
	        picBase: './images/sample/'
	    },
	    _activeIdx: 0, // 当前选择的字母/封面元素索引。
	    _btnTpl: '<input type="button" class="ui-button change_btn" value="更改" />',
	    _popTpl: (function(){
	    	return [
	    		'<div class="picPopBox ui-arrow-box ui-arrow-box-gray border-radius size-xl">',
				'    <div class="contentBox">',
				'        <h3 class="tc">选择另外一个角色</h3>',
				'        <ol class="roleList">',
				'           {{each roleList}}',
				'        	<dd class="roleItem {{$value.id == currentId? "disable" : ""}} cf">',
				'        		<img src="{{_thumbBase}}{{$value.thumb}}" class="pic fl"/>',
				'        		<strong>{{$value.name}}</strong>',
				'                {{if $value.id === currentId}}',
				'        		<input type="button" class="ui-button ui-button-L fr disable" value="已选" />',
				'                {{else}}',
				'                <input data-id="{{$value.id}}" type="button" class="ui-button ui-button-L fr selBtn" value="可选" />',
				'                {{/if}}',
				'        	</dd>',
				'           {{/each}}',
				'        </ol>',
				'    </div>',
				'    <div class="ui-arrow ui-arrow-up">',
				'       <em>◆</em><i>◆</i>',
				'    </div>',
				'</div> '
	    	].join('');
	    })(),
	    _baseTpl: function(){
	    	return [
				'<div class="bookfxBox">',
				'    <div class="hd">',
				'        <ul class="lettersBox tc cf">',
				'            <li class="letterItem cover"><div class="coverDot"></div></li>',
				'            {{each list as item}}',
				'            <li class="letterItem tc" data-id="5">',
				'                <div class="charBox"><strong>{{item.ch}}</strong></div>',
				'                <div class="picBox"><img src="{{_thumbBase}}{{item.thumb}}" class="pic"/></div>',
				'            </li>',
				'            {{/each}}',
				'            <li class="letterItem cover back"><div class="coverDot"></div></li>',
				'        </ul>',
				'    </div>',
				'    <div class="bd">',
						this._getBookTpl(),
				'    </div>',
				'</div>'
	    	].join('')
	    },
	    init: function(cfg){
	        this.config = $.extend({},this.defaultCfg,cfg);
	        this._initData();
	        this._initDom();
	        this._initEvent();
	        this.start();
	    },
	    _isIE: function(){
	    	return !!window.ActiveXObject || "ActiveXObject" in window;
	    },
	    _getBookTpl: function(){
	    	return this._isIE() ? [
	    		'        <div class="flipBook j_bookFx">',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}Front.jpg" class="pic"/>',
				'            	</div>',
				'            </div>',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}Intro_s_Page_1.jpg" class="pic"/>',
				'            	</div>',
				'            </div>',
				'            {{each list as item}}',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}{{item.pic[0]}}"  class="pic"/>',
				'            	</div>',
				'            </div>',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}{{item.pic[1]}}"  class="pic"/>',
				'            	</div>',
				'            </div>',
				'            {{/each}}',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}Outro_s_Page_1.jpg" class="pic"/>',
				'            	</div>',
				'            </div>',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}Back.jpg" class="pic"/>',
				'            	</div>',
				'            </div>',
				'         </div>',
	    	].join(''):[
				'        <div class="Heidelberg-Book with-Spreads j_bookFx">',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}Front.jpg" />',
				'            </div>',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}Intro_s_Page_1.jpg" />',
				'            </div>',
				'            {{each list as item}}',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}{{item.pic[0]}}" />',
				'            </div>',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}{{item.pic[1]}}" />',
				'            </div>',
				'            {{/each}}',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}Outro_s_Page_1.jpg" />',
				'            </div>',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}Back.jpg" />',
				'            </div>',
				'         </div>',
	    	].join('');
	    },
	    _initData: function(){
	    	var bookData = this.config.data;
	    	var globalData = window.globalAllData;
	    	bookData.list.forEach(function(item){
	    		globalData[item.ch].forEach(function(bk){
	    			if(bk.id === item.id){
	    				$.extend(item ,bk);
	    			}
	    		})
	    	});
	    },
	    _initDom: function(){
	    	this.config.data._picBase = this.config.picBase;
	    	this.config.data._thumbBase = this.config.thumbBase;
	    	this.config.$cnt.html(template.compile(this._baseTpl())(this.config.data));
	    	this.config.$lettersBox = this.config.$cnt.find('.lettersBox');
	        this.config.$bookBox = this.config.$cnt.find('.j_bookFx');
	        this.config.$lettersBox.find('.letterItem').eq(0).addClass('active');
	    },

	    _initEvent: function(){
	        var _this = this;

            // hide picPopBox
            $(document).on('click',function(event){
            	var picPopBox = _this.config.$lettersBox.find('.letterItem').eq(_this._activeIdx).find('.picPopBox');
            	// console.log(picPopBox.size(), event.target)
                if(picPopBox.size() && !$.contains(picPopBox[0], event.target) && !$(event.target).hasClass('change_btn')){
                    _this._rmPicPop(picPopBox);
                }
            });

		    this.config.$lettersBox.on("click",".letterItem",function(){
		       	var el = $(this);
		       	_this._checkLetter(el);
		       	_this._checkChangeBtn();
		    }).on("click",".change_btn",function(){
		       	$(this).fadeOut();
		       	_this._showOptions();
		    }).on("click",'.selBtn',function(){
		    	var el = $(this),
		    		id = $(this).attr('data-id');
		    	_this._updateRole(id);
		    	_this._rmPicPop(el.closest('.picPopBox'))
		    });

	    },
	    _rmPicPop: function(el){
	    	el.siblings('.change_btn').fadeIn();
	    	el.remove();
	    },
	    _updateRole: function(newId){
	    	var _this = this;
	    	var el = this.config.$lettersBox.find('.letterItem').eq(this._activeIdx);
	    	var item = this.config.data.list[this._activeIdx - 1];
	    	var options = this._getOptions(item.ch);
	    	options.forEach(function(newItem){
	    		if(newItem.id === newId){
	    			$.extend(item , newItem);
	    		}
	    	}.bind(this));
	    	
	    	el.find('.pic').attr('src', this.config.thumbBase + item.thumb);
	    	var rs = this.config.$bookBox.find('.Heidelberg-Page,.j_flipItem').filter(function(index){
	    		return (index === _this._activeIdx*4  || index === _this._activeIdx*4 + 1);
	    		
	    	}).find('img').attr('src',this.config.picBase + item.pic[0]);
	    	this.config.$bookBox.find('.Heidelberg-Page,.j_flipItem').filter(function(index){
	    		return (index === _this._activeIdx*4 + 2 || index === _this._activeIdx*4 + 3);

	    	}).find('img').attr('src',this.config.picBase + item.pic[1]);
	    },
	    _getOptions: function(ch){
	    	var globalData = window.globalAllData;
	    	return globalData[ch.toUpperCase()];
	    },
	    _showOptions: function(){
	    	var el = this.config.$lettersBox.find('.letterItem').eq(this._activeIdx);
	    	var item = this.config.data.list[this._activeIdx - 1];
	    	if(item && !el.find('.picPopBox').size()){
	    		// console.log(this._getOptions(item.ch))
    			el.append(template.compile(this._popTpl)({
    				roleList: this._getOptions(item.ch),
    				currentId: item.id,
    				_thumbBase: this.config.thumbBase
    			}));
    		}
    		el.find('.picPopBox').show();
	    },
	    _checkChangeBtn: function(){
	    	
	    	var el = this.config.$lettersBox.find('.letterItem').eq(this._activeIdx);
	    	var item = this.config.data.list[this._activeIdx - 1];
	    	el.siblings().find('.change_btn').fadeOut();
	    	if(!item){
	    		return;
	    	}
	    	var repeatReg = new RegExp(item.ch + '([^' + item.ch +'])*' + item.ch,'i');
	    	if(!repeatReg.test(this.config.data.nameStr)){
	    		if(!el.find('.change_btn').size()){
	    			el.append(this._btnTpl);
	    		}
	    		el.find('.change_btn').show();
	    	}
	    },
	    _checkLetter: function(el){
	    	if(el.hasClass('active')){
	    		return;
	    	}else{
	    		el.addClass('active').siblings('.letterItem').removeClass('active').find('.change_btn,.picPopBox').hide();
	    	}
	    	var idx = el.index();
			this._activeIdx = idx;
			
	    	if(this._isIE()){
	    		if(idx > 0){
	    			idx = 2*idx + 1;
	    		}else{
	    			idx = 2; // 显示介绍页
	    		}
	    	}else{
	    		idx = Math.max(idx * 4 + 1, 4)
	    	}
	    	this.instance.turnPage( idx );
	    	
	    },
	    start: function(){
	    	var _this = this;
	    	if(this._isIE()){
	    		this.instance = new App.FlipBook({
	    			$el: this.config.$bookBox,
	    			onPageTurn: function(pageNo){
	    				// pageNo 是图片页索引[每一页占用2张图片]，需转换成对应的 字母索引。
	    				// pageNo 从1开始
	    				
	    				var newIdx = Math.max(pageNo - 2, 0);// 减去一张封面、一张介绍
	    				newIdx = Math.ceil(newIdx / 2);
	    				// console.log(pageNo , newIdx)
	    				if(newIdx != _this._activeIdx){
		                	_this._activeIdx = newIdx;
		                	_this.config.$lettersBox.find('.letterItem').removeClass('active').eq(newIdx).addClass('active');
		                	_this.config.$lettersBox.find('.picPopBox').hide();
		                	_this._checkChangeBtn();
		                }
	    			}
	    		});
	    	}else{
		    	this.instance = new Heidelberg(this.config.$bookBox, {
	              hasSpreads: true,
	              onPageTurn: function(el, els) {
	                var picIdx = els.pagesTarget.index();
	                var newIdx = Math.floor((picIdx - 1)/4);
	                console.log(newIdx);
	                if(newIdx != _this._activeIdx){
	                	_this._activeIdx = newIdx;
	                	_this.config.$lettersBox.find('.letterItem').removeClass('active').eq(newIdx).addClass('active');
	                	_this.config.$lettersBox.find('.picPopBox').hide();
	                	_this._checkChangeBtn();
	                }
	              }
	            });
	    	}
	    }
	});


	mod.BookFx = BookFx;
})(window.App)