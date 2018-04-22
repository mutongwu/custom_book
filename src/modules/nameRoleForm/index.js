
function NameRoleForm(config){
    this.config = $.extend({},config);
    this._id = new Date().getTime();
    this.init();
}
NameRoleForm.prototype = {
    init: function(){
        this.style();
        this.dom();
        this.event();
        
        var $box = this.config.$container;
        var charatorBtns  = $box.find('.charatorBox > .sex');
        //初始化数据
        $box.find('.j_pyInput').val(this.config['py']);
        $box.find('.j_zhInput').val(this.config['zh']);
        charatorBtns.addClass('ui-button-gray');
        var selectSex = charatorBtns.filter('.sex[sex="' + this.config['sex'] + '"]');
        selectSex.removeClass('ui-button-gray');
        selectSex.siblings('.charatorPopBox').find('.picBox[key="' + this.config['v']+'"]').click();
    },
    event: function(){
        var _this = this;
        var $box = this.config.$container;
        var charatorBtns  = $box.find('.charatorBox > .sex');
        var popLayers = $box.find('.charatorBox > .charatorPopBox');

         // hide all
        $(document).on('click.hideRolePop',function(event){
            if(!$(event.target).is(charatorBtns) && !$(event.target).is(popLayers)){
                popLayers.hide();
            }
        });

        // 男女角色选择
        charatorBtns.on('click',function(){
            var el = $(this),
                popBox = el.siblings('.charatorPopBox');
            _this.config['sex'] = el.attr('sex');
            if(el.hasClass('ui-button-gray')){
                el.removeClass('ui-button-gray');
                charatorBtns.not(el).addClass('ui-button-gray');
                popLayers.hide();
                popBox.show();
            }else{
                popBox.show();
            }
        });
        // 角色人物选择
        popLayers.on('click','.picBox',function(){
            $(this).addClass('active').siblings('.picBox').removeClass('active');
            popLayers.hide();
            _this.config['v'] = $(this).attr('key');
        });
    },
    validate: function(){
        var $formBox = this.config.$container.find('.nameForm');
        if(!this.validator){
            this.validator = new App.FormValidator({
                '$form': $formBox
            });
        }
        var result = validator.validate();
        if(!result.FAILED){
            if(/[^a-zA-Z\s]$/.test(result.py)){
                App.tip('请填写正确的名字拼音','error');
                this.validator.setInvalid($formBox.find('.j_pyInput'));
                return;
            }
            if(!App.BookData.checkValid(result.py)){
                App.tip('抱歉，暂不支持你的名字拼音','error');
                this.validator.setInvalid($formBox.find('.j_pyInput'));
                return;   
            }
            result.v = this.config.v;
            result.sex = this.config.sex;
            return result;
        }else{
            App.tip(result.msg,'error');
            return null;
        }
    },
    dom: function(){
        var dom = __inline('./dom.html');
        this.domId = this._id + '_dom';
        this.config.$container.append('<div id="' + this.domId + '">' + dom + '</div>');
    },
    style: function(){
        var css = __inline('./style.scss');
        this.styleId = this._id + '_style';
        this.config.$container.append('<style id="' + this.styleId + '">'+css+'</style>');
    },
    destroy: function(){
        $(document).off('click.hideRolePop');
        this.validator && this.validator.destroy();
        this.config.$container.empty();
        this.config = null;
    }
}

module.exports = NameRoleForm;