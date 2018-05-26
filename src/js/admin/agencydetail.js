$(function(){
	var $page = $('.adminAgencyDetailCnt');
    var params = App.params();
	function loadParterInfo(){
		return App.ajax({
			data:{
				call: 'admin.getPartnerInfo',
                partnerInfoId : params['partnerInfoId']
			}
		})
	}
	function loadParterAccountInfo(){
		return App.ajax({
			data:{
				call: 'admin.getAccountVo',
                userId : params['uid']
			}
		})
	}
	loadParterInfo().done(function(res){
		if(res){
			$page.find('.j_agencySection').html(template('agencyTpl', res));
		}else{
			App.tip(res && res.message,'error');
		}
	}).fail(function(res){
		App.tip(res && res.message,'error');
	});

	loadParterAccountInfo().done(function(res){
		if(res){
			$page.find('.j_agencyAccountSection').html(template('agencyAccountTpl', res));
		}else{
			App.tip(res && res.message || '未填银行信息','warn');
		}
	}).fail(function(res){
		App.tip(res && res.message,'error');
	});
})