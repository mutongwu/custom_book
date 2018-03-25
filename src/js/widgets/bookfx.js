function initGlobalData(){

	var pinyin = ["aoxia", "baozi", "changjinglu", "daishu", "tiane", "fengniao", "gezi", "haitun", "yilong", "ji", "kongque", "luotuo", "mifeng", "nainiu", "haiou", "pangxie", "qie", "rongshu", "shizi", "tuzi", "wugui", "lv", "woniu", "xiongmao", "yingwu", "zhizhu"];
	var hanzi = ["螯虾", "豹子", "长颈鹿", "袋鼠", "天鹅", "蜂鸟", "鸽子", "海豚", "翼龙", "鸡", "孔雀", "骆驼", "蜜蜂", "奶牛", "海鸥", "螃蟹", "企鹅", "榕树", "狮子", "兔子", "乌龟", "驴", "蜗牛", "熊猫", "鹦鹉", "蜘蛛"];
	var pinyin2 = ["anchun", "banma", "ciwei", "daxiang", "eyu", "fenghuang", "gou", "houzi", "yipinhong", "jingyu", "kaola", "lu", "maotouying", "ningmeng", "ou", "panyang", "qingwa", "rougui", "songshu", "tuoniao", "wuya", "lvluo", "wandou", "xiyi", "yingtao", "zhangyu"];
	var hanzi2 =  ["鹌鹑", "斑马", "刺猬", "大象", "鳄鱼", "凤凰", "狗", "猴子", "一品红", "鲸鱼", "考拉", "鹿", "猫头鹰", "柠檬", "莲藕", "盘羊", "青蛙", "肉桂", "松鼠", "鸵鸟", "乌鸦", "绿箩", "豌豆", "蜥蜴", "樱桃", "章鱼"];

	var roles = {};
	var alphabet = 'abcdefghijklmnopqrstuvwxyz';
	for(var i = 0;i < 26; i++){
		roles[alphabet.charAt(i)] = [
		{
			'zh': hanzi[i],
			'py':pinyin[i]
		},{
			'zh': hanzi2[i],
			'py':pinyin2[i]
		}
		]
	}
	var tyRoles = [{
		'zh':'白云',
		'py': 'baiyun',
		'idx':1
	},{
		'zh':'宝贝',
		'py': 'baobei',
		'idx':2
	},{
		'zh':'地洞',
		'py': 'didong',
		'idx':3
	},{
		'zh':'龙卷风',
		'py': 'longjuanfen',
		'idx':4
	}];

	var getNextTy = (function(){
		var currMap = {};
		return function(ch){
			var result = null;
			var curr = currMap[ch];
			if(!curr){
				curr = currMap[ch] = 0;
			}
			if(curr < tyRoles.length){
				var item = tyRoles[curr];
				result = $.extend({
					thumb: '/img_s/' +  ['ty','0'+item.idx,item.py,'s'].join('_') + '.jpg',
					first:'/ty/' + ['ty','0'+item.idx,item.py,1].join('_') + '.jpg',
					second:'/ty/' + ['ty','0'+item.idx,item.py,ch].join('_') + '.jpg'
				},item);
				currMap[ch] += 1;
			}
			return result;
		};
	})();

	var getNextRole = (function(){
		var currMap = {};
		return function(ch){
			var result = null;
			var curr = currMap[ch];
			if(!curr){
				curr = currMap[ch] = 0;
			}
			if(curr < roles[ch].length){
				var item = roles[ch][curr];
				result = $.extend({
					thumb: '/img_s/' +  [ch,'0'+(curr+1),item.py,'s'].join('_') + '.jpg',
					first:'/role/' + [ch,'0'+(curr+1),item.py,1].join('_') + '.jpg',
					second:'/role/' + [ch,'0'+(curr+1),item.py,2].join('_') + '.jpg'
				},item);
				currMap[ch] += 1;
			}
			return result;
		};
	})();

	var getFrontEnd = function(){
		return {
			cover: '/name/fengmian_1.jpg',
			kaishi:['/gushi/kaishi_1.jpg','/gushi/kaishi_2.jpg'],
			jiewei:['/name/jiewei_1.jpg','/gushi/jiewei_2.jpg'],
			end: '/gushi/fengdi_2.jpg'
		};
	};
	var rootPath = '//www.sy111.com/book/samples/cn';
	var getBase = function(opt){
		opt = $.extend({
			'sex':'boy',
			'type':'type_1',
			'v':'v1'
		},opt);
		return [rootPath,opt.v,opt.type,opt.sex].join('/');
	};

	var getRootPath = function(){
		return rootPath;
	};
	var getRoleOptionsByChar = function(ch){
		var result = [];
		ch = ch.toLowerCase();
		$.each(roles[ch], function(i, item){
			result.push($.extend({
				thumb: '/img_s/' +  [ch,'0'+(i+1),item.py,'s'].join('_') + '.jpg',
				first:'/role/' + [ch,'0'+(i+1),item.py,1].join('_') + '.jpg',
				second:'/role/' + [ch,'0'+(i+1),item.py,2].join('_') + '.jpg'
			}, item))
		});
		return result;
	};
	return  {
		getRootPath: getRootPath,
		getNextTy: getNextTy,
		getNextRole: getNextRole,
		getBase:getBase,
		getFrontEnd:getFrontEnd,
		getRoleOptionsByChar: getRoleOptionsByChar
	};
}
(function(mod){
	var globalData = initGlobalData();
	function BookFx(cfg){
	    this.init(cfg);
	    return this;
	}
	$.extend(BookFx.prototype,{
		defaultCfg: {
	        $cnt: null,
	        data: {
	        	nameStr:'',
	        	opt:{
	        	}
	        },
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
				'        	<dd class="roleItem {{$value.py == currentId? "disable" : ""}} cf">',
				'        		<img src="{{_rootPath}}{{$value.thumb}}" class="pic fl"/>',
				'        		<strong>{{$value.zh}}</strong>',
				'                {{if $value.py === currentId}}',
				'        		<input type="button" class="ui-button ui-button-L fr disable" value="已选" />',
				'                {{else}}',
				'                <input data-py="{{$value.py}}" type="button" class="ui-button ui-button-L fr selBtn" value="可选" />',
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
				'            <li class="letterItem tc" >',
				'                <div class="charBox"><strong>{{item.ch}}</strong></div>',
				'                <div class="picBox"><img src="{{_rootPath}}{{item.thumb}}" class="pic"/></div>',
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
	        if(!this._checkValid(cfg.data.nameStr)){
	        	this.config.onError && this.config.onError();
	        	return;
	        }
	        this._initData();
	        this._initDom();
	        this._initEvent();
	        this.start();
	    },
	    getResult: function(){
	    	return this.config.data.list;
	    },
	    _isIE: function(){
	    	return !!window.ActiveXObject || "ActiveXObject" in window;
	    },
	    _getBookTpl: function(){
	    	return this._isIE() ? [
	    		'        <div class="flipBook j_bookFx">',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}{{_frontEnd.cover}}" class="pic"/>',
				'            	</div>',
				'            </div>',
				// 开始引导
				'            {{each _frontEnd.kaishi }}',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}{{$value}}" class="pic"/>',
				'            	</div>',
				'            </div>',
				'            {{/each}}',
				// 字母故事
				'            {{each list as item}}',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}{{item.first}}"  class="pic"/>',
				'            	</div>',
				'            </div>',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}{{item.second}}"  class="pic"/>',
				'            	</div>',
				'            </div>',
				'            {{/each}}',
				// 故事结尾
				
				'            {{each _frontEnd.jiewei }}',
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}{{$value}}" class="pic"/>',
				'            	</div>',
				'            </div>',
				'            {{/each}}',
				// 封底
				'            <div class="flipItem j_flipItem">',
				'				<div class="picBox">',
				'              		<img src="{{_picBase}}{{_frontEnd.end}}" class="pic"/>',
				'            	</div>',
				'            </div>',
				'         </div>',
	    	].join(''):[
				'        <div class="Heidelberg-Book with-Spreads j_bookFx">',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}{{_frontEnd.cover}}" />',
				'            </div>',

				'            {{each _frontEnd.kaishi }}',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}{{$value}}" />',
				'            </div>',
				'            {{/each}}',

				'            {{each list as item}}',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}{{item.first}}" />',
				'            </div>',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}{{item.second}}" />',
				'            </div>',
				'            {{/each}}',

				'            {{each _frontEnd.jiewei }}',
				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}{{$value}}" />',
				'            </div>',
				'            {{/each}}',

				'            <div class="Heidelberg-Spread">',
				'              <img src="{{_picBase}}{{_frontEnd.end}}" />',
				'            </div>',
				'         </div>',
	    	].join('');
	    },
	    _checkValid: function(nameStr){
	    	// 通用图出现不能大于4.
	    	var arr = nameStr.split('');
	    	var chMap = {};
	    	var count = 0;
	    	var MAX = 4;
	    	$.each(arr, function(i, ch){
	    		if(!chMap[ch]){
	    			chMap[ch] = 1;
	    		}else{
	    			chMap[ch] += 1;
	    			if(chMap[ch] > 2){
	    				count += 1;
	    			}
	    		}
	    		if(count > MAX){
	    			return false;
	    		}
	    	});
	    	return count <= MAX;
	    },
	    _initData: function(){
	    	var bookData = this.config.data;
	    	if(!bookData.list){
	    		bookData.list = [];
	    		$.each(bookData.nameStr.split(''), function(i, ch){
		    		var item = globalData.getNextRole(ch) || globalData.getNextTy(ch);
		    		if(item){
		    			item.ch = ch.toUpperCase();
		    			bookData.list.push(item);
		    		}else{
		    			throw new Error('[bookFx]不支持的名字。');
		    		}
		    	});
	    	}
	    	this.config.data._picBase =  globalData.getBase(this.config.data.opt); //this.config.picBase;
	    	this.config.data._rootPath = globalData.getRootPath();
	    	this.config.data._frontEnd = globalData.getFrontEnd();
	    },
	    _initDom: function(){
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
		    		id = $(this).attr('data-py');
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
	    	$.each(options,function(i, newItem){
	    		if(newItem.py === newId){
	    			$.extend(item , newItem);
	    		}
	    	});
	    	
	    	el.find('.pic').attr('src', this.config.data._rootPath + item.thumb);
	    	// 一张封面+2张开始，共占据了 2*(1+2) = 6个位置
	    	var startNum = (this._activeIdx - 1)*4 + 6;
	    	var pageItem = this.config.$bookBox.find('.Heidelberg-Page,.j_flipItem').filter(function(index){
	    		return (index === startNum  || index === startNum + 1);
	    	});
	    	pageItem.find('img').attr('src',this.config.data._picBase + item.first);
	    	pageItem = this.config.$bookBox.find('.Heidelberg-Page,.j_flipItem').filter(function(index){
	    		return (index === startNum + 2 || index === startNum + 3);
	    	});
	    	pageItem.find('img').attr('src',this.config.data._picBase + item.second);
	    },
	    _getOptions: function(ch){
	    	return globalData.getRoleOptionsByChar(ch);
	    },
	    _showOptions: function(){
	    	var el = this.config.$lettersBox.find('.letterItem').eq(this._activeIdx);
	    	var item = this.config.data.list[this._activeIdx - 1];
	    	if(item && !el.find('.picPopBox').size()){
	    		// console.log(this._getOptions(item.ch))
    			el.append(template.compile(this._popTpl)({
    				roleList: this._getOptions(item.ch),
    				currentId: item.py,
    				_rootPath: globalData.getRootPath()
    			}));
    			// 处理被隐藏的情况
    			var tempEl = el.find('.picPopBox');
    			var left = tempEl.offset().left;
    			var bdWidth = Math.max($('body').width(), $('.container').width());
    			if(left < 40){ //左侧必须大于40px才能完成显示
    				left = 40 - left;//计算差距
    				var marginLeft = parseInt(tempEl.css('marginLeft'), 10);
    				tempEl.css('marginLeft',marginLeft+left);
    				tempEl = el.find('.picPopBox').find('.ui-arrow');
    				marginLeft = parseInt(tempEl.css('marginLeft'), 10);
    				tempEl.css('marginLeft',marginLeft-left);
    			}else if(left + tempEl.outerWidth() > bdWidth){
    				left = left + tempEl.outerWidth() - bdWidth + 40;//计算差距
    				var marginLeft = parseInt(tempEl.css('marginLeft'), 10);
    				tempEl.css('marginLeft',marginLeft-left);
    				tempEl = el.find('.picPopBox').find('.ui-arrow');
    				marginLeft = parseInt(tempEl.css('marginLeft'), 10);
    				tempEl.css('marginLeft',marginLeft+left);
    			}
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
	    	// 存在重复的字母
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
	    			idx = idx*2 + 2; // 加上开始2页
	    		}else{
	    			idx = 2; // 显示介绍页
	    		}
	    	}else{
	    		idx = (idx+1)*4 - 1;
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
	    				
	    				var newIdx = Math.max(pageNo - 3, 0);// 减去一张封面、两张介绍
	    				newIdx = Math.ceil(newIdx / 2);
	    				console.log(pageNo , newIdx)
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
	                var newIdx = null;
	                if(picIdx%4 === 1){
	                	newIdx = Math.floor(picIdx/4) - 1;
	                }else{
	                	newIdx = Math.floor(picIdx/4);
	                }
	                newIdx = Math.max(newIdx, 0);
	                newIdx = Math.min(newIdx, _this.config.$lettersBox.find('.letterItem').length - 1);
	                // console.log(picIdx, newIdx);
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