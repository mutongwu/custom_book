$(function(){
	var $page = $('.adminUserDetailCnt');
    var params = App.params();
	function loadUserInfo(){
		return App.ajax({
			data:{
				call: 'admin.getUserVoAndUserInfoVo',
                userId : params['userId']
			}
		})
	}

	loadUserInfo().done(function(res){
		if(res){
			$page.find('.userDetailBox').html(template('userTpl', res));
		}else{
			App.tip(res && res.message,'error');
		}
	}).fail(function(res){
		App.tip(res && res.message,'error');
	});
})