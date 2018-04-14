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
	function formatRmb(price) {
	    return (price/100).toFixed(2);
	}
	function dateFormat(val) {
		consol.log(val);
	    return App.Format.fmDate(val, 'yyyy-MM-dd hh:mm:ss');
	}
	template.helper('dateFormat', dateFormat);
	template.helper('priceFormat', formatRmb);
	function loadData(pageNo,pageSize){
		App.ajax({
			data:{
				'call': 'order.listMyOrder',
				'pageNo':pageNo,
				'pageSize': pageSize
			}
		}).done(function(json){
			if(json && json.list){
				$page.find('.j_tbdBox').html(template('orderTpl', json));
				initPageBar(json,pageSize);
			}else{
				$page.find('.j_tbdBox').html('<tr><td class="5"><p class="tc">暂无订单~</p></td></tr>');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}
	
	loadData(1, 10);
})