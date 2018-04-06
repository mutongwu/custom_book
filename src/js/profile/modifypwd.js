$(function(){
	var $page = $('.modifyPwdCnt');
	var $form = $page.find('.modifyPwdForm');
    var validator = new App.FormValidator({
    	'$form': $form
    });

	function submitForm(){
		var result = validator.validate();
		if(!result.FAILED){
			result['call'] = 'user.changePwd';
			if(result.userPwd !== result.userPwd2){
				App.tip('新密码输入不一致','error');
				return;
			}
			App.onceAjax({
		        data: result,
		        method: 'POST'
		    }).done(function(json){
		        App.tip( '用户密码修改成功！');
		    }).fail(function(res){
		    	App.tip(res && res.message || '密码修改失败','error');
		    });
		}
	}

  	$page.on('click', '#j_submit',function(){
  		submitForm();
  	});
});