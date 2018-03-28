$(function(){
    var $form = $('.registerForm');

    var validator = new App.FormValidator({
    	'$form': $form
    });
    
    // 注册
    function registerByType(type){
    	var result = validator.validate();
    	if(!result.FAILED){
    		if(result['userPwd'] !== result['userPwd2']){
    			App.tip('密码输入不一致','error');
    			return;
    		}
    		result['call'] = 'user.emailRegiste';
    		App.ajax({
    			'data':result
    		}).done(function(){

    		}).fail(function(res){
    			App.tip(res && res.message,'error');
    		});
    	}
    }

    function tryGetCode($btn){
    	var email = $form.find('.j_email');
    	var result = validator.validateField(email[0]);
    	if(result === true){
    		$btn.addClass('disable');
    		App.ajax({
    			'data':{
    				'call': 'user.getEmailCode',
    				'email': email.val()
    			}
    		}).done(function(json){
    			$form.find('.j_verificationId').val(json.verificationId);
    		}).fail(function(res){
    			App.tip(res && res.message,'error');
    		});
    	}else{
    		validator.setInvalid(email[0], result);
    	}
    }


    $form.on('click','.ui-tab .tabItem', function(){
        var el = $(this);
        el.addClass("active").siblings().removeClass("active");
        $form.find('.j_email,.j_phone').toggleClass('disable');
        $form.find('.phoneRegister, .emailRegister').toggleClass("none");
    }).on('click','#j_submit', function(){
    	var type = $('.ui-tab .tabItem.active').attr('type');
    	registerByType(type);
    }).on('click','.j_getCode', function(){
    	var el = $(this);
    	if(!el.hasClass('disable')){
    		tryGetCode(el);	
    	}
    });
})