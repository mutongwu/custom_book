
$(function () {
	var params = App.params();
	var $formBox= $('#j_nameFormBox');
	var charatorBtns  = $formBox.find('.charatorBox > .sex');
    var popLayers = $formBox.find('.charatorBox > .charatorPopBox');
    // hide all
    $(document).on('click',function(event){
        if(!$(event.target).is(charatorBtns) && !$(event.target).is(popLayers)){
            popLayers.hide();
        }
    });
    var validator = new App.FormValidator({
        '$form': $formBox.find('.nameForm')
    });
    var data = {
    	sex: 'boy',
    	v: 'v1'
    };



    // 男女角色选择
    charatorBtns.on('click',function(){
        var el = $(this),
            popBox = el.siblings('.charatorPopBox');
        data['sex'] = el.attr('sex');
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
        data['v'] = $(this).attr('key');
    });

    $('.container').on('click','#j_submitBtn', function(){
    	var result = validator.validate();
        if(!result.FAILED){
            if(/[^a-zA-Z\s]$/.test(result.py)){
                App.tip('请填写正确的名字拼音','error');
                validator.setInvalid($formBox.find('.j_pyInput'));
                return;
            }
            if(!App.BookData.checkValid(result.py)){
                App.tip('抱歉，暂不支持你的名字拼音','error');
                validator.setInvalid($formBox.find('.j_pyInput'));
                return;   
            }
            data['py'] = result.py;
            data['zh'] = result.zh;
            App.linkTo('/book/preview.jsp',data);
        }else{
            App.tip(result.msg,'error');
        }
    });

	if(/^(boy|girl)$/.test(params['sex'])){
		data.sex = RegExp.$1;
	}
	if(/^(v1|v2|v3)$/.test(params['v'])){
		data.v = RegExp.$1;	
	}
    //初始化数据
    $formBox.find('.j_pyInput').val(params['py']);
    $formBox.find('.j_zhInput').val(params['zh']);
    charatorBtns.addClass('ui-button-gray');
    var selectSex = charatorBtns.filter('.sex[sex="' + data['sex'] + '"]');
    selectSex.removeClass('ui-button-gray');
    selectSex.siblings('.charatorPopBox').find('.picBox[key="' + data['v']+'"]').click();
});