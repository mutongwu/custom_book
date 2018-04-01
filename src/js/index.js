

$(function () {
    var nameBox = {
        data:{
            py:'',
            zh:'',
            sex: 'boy',
            v: 1
        },
        $box: $('#j_nameFormBox'),
        validator: null,
        init: function(){
            var _this = this;
            var charatorBtns = this.$box.find('.charatorBox > .sex');
            var popLayers = this.$box.find('.charatorBox > .charatorPopBox');
            var activePop = null;
            this.validator = new App.FormValidator({
                '$form': this.$box.find('.nameForm')
            });
            // hide all
            $(document).on('click',function(event){
                if(!$(event.target).is(charatorBtns) && !$(event.target).is(popLayers)){
                    popLayers.hide();
                }
            });

            // 男女角色选择
            charatorBtns.on('click',function(){
                var el = $(this),
                    popBox = el.siblings('.charatorPopBox');
                _this.data['sex'] = el.attr('sex');
                if(el.hasClass('ui-button-gray')){
                    el.removeClass('ui-button-gray');
                    charatorBtns.not(el).addClass('ui-button-gray');
                    popLayers.hide();
                    popBox.show();
                    activePop = popBox[0];
                }else{
                    popBox.show();
                    activePop = popBox[0];
                }
            });
            // 角色人物选择
            popLayers.on('click','.picBox',function(){
                $(this).addClass('active').siblings('.picBox').removeClass('active');
                popLayers.hide();
                _this.data['v'] = $(this).attr('key');
            });
            
            //预览
            this.$box.on('click', '#j_submitBtn', function(){
                var result = _this.validator.validate();
                if(!result.FAILED){
                    if(/[^a-zA-Z\s]$/.test(result.py)){
                        App.tip('请填写正确的名字拼音','error');
                        _this.validator.setInvalid(_this.$box.find('.j_pyInput'));
                        return;
                    }
                    if(!App.BookData.checkValid(result.py)){
                        App.tip('抱歉，暂不支持你的名字拼音','error');
                        _this.validator.setInvalid(_this.$box.find('.j_pyInput'));
                        return;   
                    }
                    _this.data['py'] = result.py;
                    _this.data['zh'] = result.zh;
                    App.linkTo('/book/preview.jsp',_this.data);
                }else{
                    App.tip(result.msg,'error');
                }
            })
        }
    };

    var bookFx = {
        instance: null,
        init: function(){
            this.instance = new Heidelberg($('#j_bookfxCnt'), {
              hasSpreads: true,
              onPageTurn: function(el, els) {
                console.log('Page turned');
              },
              onSpreadSetup: function(el) {
                console.log('Spread setup');
              }
            });
        }
    };
    var indexPage = {
        init: function(){
            // 轮播
            new App.SimpleSlider({
                $sliderBox: $('.j_commentSliderBox')
            });
            new App.SimpleSlider({
                $sliderBox: $('.j_introSliderBox')
            });
            nameBox.init();
            // bookFx.init();
        }
    };
    indexPage.init();
});
