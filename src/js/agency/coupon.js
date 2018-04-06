$(function(){
	var $page = $('.couponCodeCnt');
	function agentNameByType(type){
		switch(+type){
			case 1: return '个人代理';
			case 2: return '网店代理';
			case 3: return '实体店代理';
		}
	}
	App.ajax({
		data:{
			'call': 'agent.getCouponVo'
		}
	}).done(function(json){
		if(json){
			var $box = $page.find('.j_agencyTxt');
			$box.find('.type').text(agentNameByType(json.level));
			$box.find('.num').text(json.couponNo);
			$box.removeClass('none');
		}else{
			$page.find('.j_noAgency').removeClass('none');
		}
	}).fail(function(res){
		App.tip(res && res.message);
	})
});