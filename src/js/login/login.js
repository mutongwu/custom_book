$(function(){
    var $form = $('.loginForm');

    var validator = new App.FormValidator({
    	'$form': $form
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
    			App.goHome();
    		}).fail(function(res){
    			App.tip(res && res.message,'error');
    		});
    	}
    }
    $form.on('click','#j_submit', function(){
    	doLogin();
    }).on('click','.j_getCode', function(){
    	var el = $(this);
    	if(!el.hasClass('disable')){
    		tryGetCode(el);	
    	}
    });
})