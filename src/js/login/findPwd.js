$(function(){
    var $form1= $('.existForm');
    var $form2= $('.findPwdForm');

    var v1 = new App.FormValidator({
    	'$form': $form1
    });
    
    var v2 = new App.FormValidator({
        '$form': $form2
    });

    // 注册
    function doLogin(){
    	var result = validator.validate();
    	if(!result.FAILED){
    		result['call'] = 'user.login';
    		App.onceAjax({
    			'data':result,
    			'method': 'POST'
    		}).done(function(){
    			App.linkTo('/index.jsp');
    		}).fail(function(res){
    			App.tip(res && res.message,'error');
    		});
    	}
    }
    var Constants = {
        mobile:{
            codeApi: 'user.getSmsCode',
            tip: '验证码已发送，请留意您的手机短信'
        },
        email:{
            codeApi: 'user.getEmailCode',
            tip: '验证码已发送，请前往您的邮箱查阅'
        }
    };

    var source = null;
    var type = null;

    function countdown($btn){
        var n = 30;
        function setTxt(){
            if(n > 1){
                $btn.html('请等待' + n + '秒再获取');
                n -= 1;
            }else{
                clearTimer(timer, $btn);
            }
        }
        var timer = setInterval(setTxt,1000);
        setTxt();
        return timer;
    }

    function clearTimer(timer, $btn){
        clearInterval(timer);
        $btn.html('获取').removeClass('disable');
    }

    function goNext(s, t){
        $form1.hide();
        $form2.show();
        source = s;
        type = t;
    }

    function tryGetCode($btn){
        $btn.addClass('disable');
        var timer = countdown($btn);
        var params = {
            'call': Constants[type].codeApi
        };
        params[type] = source;
        App.ajax({
            'data': params,
            'method': 'POST'
        }).done(function(json){
            App.tip(Constants[type].tip);
            $form2.find('.j_verificationId').val(json.verificationId);
        }).fail(function(res){
            App.tip(res && res.message,'error');
            clearTimer(timer, $btn);
        });
    }

    function checkExist(){
        var result = v1.validate();
        if(!result.FAILED){
            if(v1.isEmail(result['source'])){
                App.onceAjax({
                    'data':{
                        'call': 'user.isEmailExists',
                        'email': result['source']
                    },
                    'method': 'POST'
                }).done(function(res){
                    if(res){
                        goNext(result['source'], 'email');    
                    }else{
                        App.tip(res && res.message || '账号不存在','error');    
                    }
                    
                }).fail(function(res){
                    App.tip(res && res.message,'error');
                });
            }else if(v1.isPhone(result['source'])){
                App.onceAjax({
                    'data':{
                        'call': 'user.isMobileExists',
                        'mobile': result['source']
                    },
                    'method': 'POST'
                }).done(function(res){
                    if(res){
                        goNext(result['source'], 'mobile');    
                    }else{
                        App.tip(res && res.message || '账号不存在','error');    
                    }
                }).fail(function(res){
                    App.tip(res && res.message,'error');
                });
            }else{
                App.tip('账号格式不正确，请您填写注册时的手机号或邮箱。','error');
            }
        }
    }

    function resetPwd(){
        var result = v2.validate();
        if(!result.FAILD){
            if(result['userPwd'] !== result['userPwd2']){
                App.tip('密码输入不一致','error');
                return;
            }
            result['call'] = 'user.resetPwd';
            result['source'] = source;
            App.onceAjax({
                'data':result,
                'method': 'POST'
            }).done(function(){
                App.alert('您的密码已重置成功，请前往登陆页面登陆！',function(){
                    App.linkTo('/login/login.jsp');
                },'success');
            }).fail(function(res){
                App.tip(res && res.message,'error');
            });
        }
    }

    $('.findPwdCnt').on('click','#j_checkExist', function(){
    	checkExist();
    }).on('click','.j_getCode', function(){
    	var el = $(this);
    	if(!el.hasClass('disable')){
    		tryGetCode(el);	
    	}
    }).on('click','#j_submit', function(){
        resetPwd();
    });
})