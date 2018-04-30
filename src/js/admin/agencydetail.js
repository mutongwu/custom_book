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

	loadParterInfo().done(function(res){
		if(res){
			$page.find('.agencyBox').html(template('agencyTpl', res));
		}else{
			App.tip(res && res.message,'error');
		}
	}).fail(function(res){
		App.tip(res && res.message,'error');
	});
})