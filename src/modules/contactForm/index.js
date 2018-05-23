
function ContactForm(config){
    this.config = $.extend(true,{
        $container: null,
        data:{
            formCls: 'ui-form-L',
            submitCls: 'ui-button-yellow'
        }
    },config);
    this._id = new Date().getTime();
    this.init();
}
ContactForm.prototype = {
    userInfo: null,
    init: function(){
        this.style();
        this.dom();
        this.event();
        this.$formBox = this.config.$container.find('.contactForm');
        this.validator = new App.FormValidator({
            '$form': this.$formBox
        });
        this.initData();
    },
    initData: function(){
        var _this = this;
        App.ajax({
            data: {
                'call': 'user.getUserInfo'
            }
        }).done(function(json){
            if(json && json.userId){
                _this.userInfo = json;
                _this.fillForm(json);
            }
        });
    },
    fillForm: function(data){
        for(var p in data){
			var el = this.$formBox.find('[name="'+p+'"]');
			if(data[p] && el.length){
				el.val(data[p]);
			}
		}
    },
    event: function(){
        var _this = this;
        var $box = this.config.$container;
        $box.on('click', '.j_submitBtn', function(){
            _this.save();
        });
    },
    check: function(){
        if(this.userInfo.contactEMail || this.userInfo.contactMobile){
            return true;
        }else{
            App.tip('请先保存联系方式.','error');
            return false;
        }
    },
    validate: function(){
        var result = this.validator.validate();
        if(!result.FAILED){
            if(!result.contactMobile && !result.contactEMail){
                App.tip('联系电话和电子邮箱不能同时为空','error');
                return null;
            }
            return result;
        }else{
            App.tip(result.msg,'error');
            return null;
        }
    },
    save: function(){
        var result = this.validate();
        if(result){
            delete this.userInfo.updateTime;
            App.onceAjax({
                'data': $.extend({
                    'call': 'user.modifyUserInfo',
                }, this.userInfo, result),
		        'method': 'POST'
            }).done(function(json){
                _this.userInfo = json;
		        App.tip( '联系方式保存成功！');
		    }).fail(function(res){
		    	App.tip(res && res.message || '联系方式保存失败','error');
		    });
        }
    },
    
    dom: function(){
        var dom = __inline('./dom.html');
        this.domId = this._id + '_dom';
        dom = '<div id="' + this.domId + '">' + dom + '</div>';
        var render = template.compile(dom);
        this.config.$container.append(render(this.config.data));
    },
    style: function(){
        var css = __inline('./style.scss');
        this.styleId = this._id + '_style';
        this.config.$container.append('<style id="' + this.styleId + '">'+css+'</style>');
    },
    destroy: function(){
        this.validator && this.validator.destroy();
        this.config.$container.empty();
        this.config = null;
    }
}

module.exports = ContactForm;