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
		if(json && json.couponNo){
			$page.find('.j_couponInfoBox').html(template('couponInfoTpl', json));

			$page.find('.j_applyLink').filter(function(index){
				return index <= parseInt(json.level) - 1;
			}).addClass('disable');
		}else{
			$page.find('.j_couponInfoBox').html(template('couponInfoTpl'), {});
		}
	}).fail(function(res){
		App.tip(res && res.message);
	});
	$page.on('click','.j_applyLink',function(e){
		if($(this).hasClass('disable')){
			e.preventDefault();
			return false;
		}
	});
});