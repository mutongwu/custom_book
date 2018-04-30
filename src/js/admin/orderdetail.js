$(function(){
	var $page = $('.adminOrderDetailCnt');
    var params = App.params();

	function loadData(orderId){
		App.ajax({
			data:{
				'call': 'admin.showOrderDetail',
				'orderId':orderId
			}
		}).done(function(json){
			if(json){
                json.logisticsVo = json.logisticsVo || {
                    logisticsCompany:' ——',
                    trackingNumber:' ——'
                };
                json.orderGoodsVoes = json.orderGoodsVoes || [];
				$page.html(template('orderdetailTpl', json));
			}else{
				App.tip(res && res.message, 'error');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}

	
	loadData(params.orderId);
})