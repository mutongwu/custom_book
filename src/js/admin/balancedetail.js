$(function(){
    var $page = $('.adminBalanceDetailCnt');
    var $form = $page.find('.balanceForm');
    var params = App.params();
    var validator = new App.FormValidator({
    	'$form': $form
    });

    var detail = sessionStorage.getItem('BALANCE_DETAIL');

    function initDatePicker(val){
        new App.DatePicker({
          	el: $('.j_date'),
            val: val,
			hasTime: true,
			format: "yyyy-MM-dd hh:mm:ss",
            onUpdate: function(newVal){
                validator.validate($('.j_date'));
            }
		});
    }
    function submitData(){
        var result = validator.validate();
        if(result.FAILED){
            return;
        }
        if(result.statementTime){
			result.statementTime = new Date(result.statementTime).getTime();
		}
        var params = $.extend(detail,result,{
            'call': 'admin.commitStatement',
            'status': 1
        });
        delete params._statusTxt;
        delete params.createTime;
        delete params.updateTime;

        App.onceAjax({
            method:'POST',
            data: params
        }).done(function(data){
            // console.log('data', data);
            sessionStorage.setItem('BALANCE_DETAIL', JSON.stringify(data));
            App.tip('结算记录更新成功');
        }).fail(function(res){
            App.tip(res && res.message,'error');
        });
    }
    
    function updateAccount(uid){
        return App.onceAjax({
            data:{
				call: 'admin.getAccountVo',
                userId : uid
            }
        }).then(function(data){
            if(data){
                fillForm(data);
                $page.find('#j_submit').removeClass('disable');
            }else{
                App.tip('查找用户信息失败,请确认用户ID填写正确','error');
                return false;
            }
            
        },function(res){
            App.tip(res && res.message || '查找用户账户信息失败','error');
            return false;
        });
    }

    $page.on('click', '#j_submit',function(){
        var el = $(this);
        if(!el.hasClass('disable')){
            submitData();
        }
        
    }).on('blur', '.j_userId',function(){
        var el = $(this),
            val = el.val();
        if(/^\d+$/.test(val)){
            updateAccount(val).then(function(isValid){
                if(isValid === false){
                    setTimeout(function(){
                        validator.setInvalid(el, '用户ID不正确');
                    },0)
                }
            });
            $page.find('#j_submit').addClass('disable');
        }
    });
    function fillForm(data){
        for(var p in data){
            $form.find('[name="'+ p +'"]').val(data[p]);
        }
    }
    function initData(detail){

        // initDatePicker(detail.statementTime);
        fillForm(detail);
    }

    if(detail){
        detail = JSON.parse(detail);
        initData(detail);
    }
    
});