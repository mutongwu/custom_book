$(function(){
	var $page = $('.agencyCnt');
	function loadParterInfo(){
		return App.ajax({
			data:{
				call: 'agent.getPartnerInfo'
			}
		})
	}

	loadParterInfo().done(function(res){
		if(res){
			$page.find('.agencyBox').html(template('agencyTpl'), res);
		}else{
			$page.find('.agencyBox').html('<p class="notAgency">您还未成为代理.</p>');
		}
	}).fail(function(res){
		App.tip(res && res.message,'error');
	});
})