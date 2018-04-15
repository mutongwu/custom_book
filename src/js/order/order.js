$(function(){
	var $page = $('.orderCnt');

	var pageBar = null;
	function initPageBar(json,pageSize){
		if(pageBar){return;}
		pageBar = new App.PageBar({
			el: $('#j_pageBox'),
			cls: 'ui_pageBar_L',
			totalNum: json.count,
			jumpTo: false,
			onPage: function(p){
				loadData(p, pageSize);
			}
		})
	}
	function resetPager(){
		if(pageBar){
			pageBar.destroy();
		}
	}
	function formatRmb(price) {
	    return (price/100).toFixed(2);
	}
	function dateFormat(val) {
	    return App.Format.fmDate(val, 'yyyy-MM-dd hh:mm:ss');
	}
	template.helper('dateFormat', dateFormat);
	template.helper('priceFormat', formatRmb);
	function loadData(params){
		App.ajax({
			data:{
				'call': 'order.listMyOrder',
				'pageNo':params.pageNo,
				'pageSize': params.pageSize,
				'status': params.status
			}
		}).done(function(json){
			if(json && json.list){
				$page.find('.j_tbdBox').html(template('orderTpl', json));
				initPageBar(json, params.pageSize);
			}else{
				$page.find('.j_tbdBox').html('<tr><td class="5"><p class="tc">暂无订单~</p></td></tr>');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}
	
	function loadCoupon(){
		App.ajax({
			data:{
				'call': 'agent.getCouponVo'
			}
		}).done(function(json){
			if(json){
				$('.j_couponInfo').find('.red').text(json.couponNo).end().removeClass('none');
			}
		}).fail(function(res){
			App.tip(res && res.message);
		});
	}
	$page.on('click', '.j_order',function(){
		var el = $(this);
		if(el.hasClass('active')){
			return;
		}
		el.parent().addClass('active').siblings().removeClass('active');
		loadData({
			pageNo:1,
			pageSize: 10,
			status: el.data('status')
		});
		resetPager();
	});
	loadData({
		pageNo:1,
		pageSize: 10
	});
	loadCoupon();
})