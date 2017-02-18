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
	    _activeIdx: 0,
	    _btnTpl: '<input type="button" class="ui-button change_btn" value="更改" />',
	    _popTpl: (function(){
	    	return [
	    		'<div class="picPopBox ui-arrow-box ui-arrow-box-gray border-radius size-xl">',
				'    <div class="contentBox">',
				'        <h3 class="tc">选择另外一个角色</h3>',
				'        <ol class="roleList">',
				'           {{each roleList}}',
				'        	<dd class="roleItem {{$value.id == currentId? "disable" : ""}} cf">',
				'        		<img src="./images/sample/{{$value.thumb}}" class="pic fl"/>',
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
	    _baseTpl: (function(){
	    	return [
				'<div class="bookfxBox">',
				'    <div class="hd">',
				'        <ul class="lettersBox tc cf">',
				'            <li class="letterItem cover"><div class="coverDot"></div></li>',
				'            {{each list as item}}',
				'            <li class="letterItem tc" data-id="5">',
				'                <div class="charBox"><strong>{{item.ch}}</strong></div>',
				'                <div class="picBox"><img src="./images/sample/{{item.thumb}}" class="pic"/></div>',
				'            </li>',
				'            {{/each}}',
				'            <li class="letterItem cover back"><div class="coverDot"></div></li>',
				'        </ul>',
				'    </div>',
				'    <div class="bd">',
				'        <div class="Heidelberg-Book with-Spreads ">',
				'            <div class="Heidelberg-Spread">',
				'              <img src="images/sample/Front.jpg" />',
				'            </div>',
				'            <div class="Heidelberg-Spread">',
				'              <img src="images/sample/Intro_s_Page_1.jpg" />',
				'            </div>',
				'            {{each list as item}}',
				'            <div class="Heidelberg-Spread">',
				'              <img src="./images/sample/{{item.pic[0]}}" />',
				'            </div>',
				'            <div class="Heidelberg-Spread">',
				'              <img src="./images/sample/{{item.pic[1]}}" />',
				'            </div>',
				'            {{/each}}',
				'            <div class="Heidelberg-Spread">',
				'              <img src="images/sample/Outro_s_Page_1.jpg" />',
				'            </div>',
				'            <div class="Heidelberg-Spread">',
				'              <img src="images/sample/Back.jpg" />',
				'            </div>',
				'         </div>',
				'    </div>',
				'</div>'
	    	].join('')
	    })(),
	    init: function(cfg){
	        this.config = $.extend({},this.defaultCfg,cfg);
	        this._initData();
	        this._initDom();
	        this._initEvent();
	        this.start();
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
	    	this.config.$cnt.html(template.compile(this._baseTpl)(this.config.data));
	    	this.config.$lettersBox = this.config.$cnt.find('.lettersBox');
	        this.config.$bookBox = this.config.$cnt.find('.Heidelberg-Book');
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
	    	var rs = this.config.$bookBox.find('.Heidelberg-Page').filter(function(index){
	    		return (index === _this._activeIdx*4  || index === _this._activeIdx*4 + 1);
	    	}).find('img').attr('src',this.config.picBase + item.pic[0]);
	    	this.config.$bookBox.find('.Heidelberg-Page').filter(function(index){
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
	    	if(!el.find('.picPopBox').size()){
	    		// console.log(this._getOptions(item.ch))
    			el.append(template.compile(this._popTpl)({
    				roleList: this._getOptions(item.ch),
    				currentId: item.id
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
	    	// 介绍页
	    	this.instance.turnPage( Math.max(idx * 4 + 1, 4));
	    	this._activeIdx = idx;
	    },
	    start: function(){
	    	var _this = this;
	    	this.instance = new Heidelberg(this.config.$bookBox, {
              hasSpreads: true,
              onPageTurn: function(el, els) {
                var picIdx = els.pagesTarget.index();
                var newIdx = Math.floor((picIdx - 1)/4);
                
                if(newIdx != _this._activeIdx){
                	_this._activeIdx = newIdx;
                	_this.config.$lettersBox.find('.letterItem').removeClass('active').eq(newIdx).addClass('active');
                	_this.config.$lettersBox.find('.picPopBox').hide();
                	_this._checkChangeBtn();
                }
              }
            });
	    }
	});


	mod.BookFx = BookFx;
})(window.App)