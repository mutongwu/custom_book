$(function(){
    var $form = $('.registerForm');

    var validator = new App.FormValidator({
    	'$form': $form
    });
    
    var Constants = {
    	phone:{
    		api: 'user.mobileRegiste',
    		codeApi: 'user.getSmsCode',
    		tip: '验证码已发送，请留意您的手机短信',
    		el: '.j_phone'
    	},
		email:{
    		api: 'user.emailRegiste',
    		codeApi: 'user.getEmailCode',
    		tip: '验证码已发送，请前往您的邮箱查阅',
    		el: '.j_email'
    	}
    };
    var registerType = 'phone';
    // 注册
    function registerByType(type){
    	var result = validator.validate();
    	if(!result.FAILED){
    		if(result['userPwd'] !== result['userPwd2']){
    			App.tip('密码输入不一致','error');
    			return;
    		}
    		result['call'] = Constants[type].api;
    		App.ajax({
    			'data':result,
    			'method': 'POST'
    		}).done(function(){
    			App.alert('您的账号已注册成功，请前往登陆页面登陆！',function(){
    				App.goLogin();
    			},'success');
    		}).fail(function(res){
    			App.tip(res && res.message,'error');
    		});
    	}
    }
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
    function tryGetCode($btn){
    	var $el = $form.find( Constants[registerType].el );
    	var result = validator.validateField($el[0]);
    	if(result === true){
    		$btn.addClass('disable');
    		var timer = countdown($btn);
    		var params = {
				'call': Constants[registerType].codeApi
			};
			params[$el.attr('name')] = $el.val();
    		App.ajax({
    			'data': params,
    			'method': 'POST'
    		}).done(function(json){
    			App.tip(Constants[registerType].tip);
    			$form.find('.j_verificationId').val(json.verificationId);
    		}).fail(function(res){
    			App.tip(res && res.message,'error');
    			clearTimer(timer, $btn);
    		});
    	}else{
    		validator.setInvalid($el[0], result);
    	}
    }


    $form.on('click','.ui-tab .tabItem', function(){
        var el = $(this);
        registerType = el.attr('type');
        el.addClass("active").siblings().removeClass("active");
        $form.find('.j_email,.j_phone').toggleClass('disable');
        $form.find('.phoneRegister, .emailRegister').toggleClass("none");
    }).on('click','#j_submit', function(){
    	registerType = $('.ui-tab .tabItem.active').attr('type');
    	registerByType(registerType);
    }).on('click','.j_getCode', function(){
    	var el = $(this);
    	if(!el.hasClass('disable')){
    		tryGetCode(el);	
    	}
    });
})