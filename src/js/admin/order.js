$(function(){
	var orderStatusData = {
		'0':'未支付',
		'1':'已支付',
		'2':'制作中',
		'3':'已发货',
		'4':'交易成功',
		'-1':'退货退款',
		'-2':'订单作废',
		'-3':'订单取消'
	};

	var $page = $('.adminOrderCnt');
	var validator = new App.FormValidator({
		$form: $page.find('.queryForm')
	});
	var urlParams = App.params();
	var defaultParams = {
		'call': 'admin.listOrder',
		pageNo:1,
		pageSize: 10
	};
	var queryParams = null;
	var pageBar = null;
	function initPageBar(json,params){
		if(pageBar){return;}
		pageBar = new App.PageBar({
			el: $('#j_pageBox'),
			cls: 'ui_pageBar_L',
			totalNum: json.count,
			jumpTo: false,
			onPage: function(p){
				params.pageNo = p;
				loadData(params);
			}
		})
	}
	function resetPager(){
		if(pageBar){
			pageBar.destroy();
			pageBar = null;
		}
	}
	function reloadData(){
		loadData(queryParams);
	}
	function loadData(params){
		App.ajax({
			data:params
		}).done(function(json){
			if(json && json.list && json.list.length){
				$page.find('.j_tbdBox').html(template('orderTpl', json));
				initPageBar(json, params);
			}else{
				$page.find('.j_tbdBox').html('<tr><td colspan="8"><p class="tc">暂无订单~</p></td></tr>');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
		queryParams = params;
		try{
			history.replaceState({},document.title,'?'+ $.param(params));
		}catch(e){

		}
	}
	function initQueryForm(){
		var $form = $page.find('.queryForm');
		for(var p in urlParams){
			$form.find('[name="' + p + '"]').val(urlParams[p]);
		}
	}
	function initStatusSelect(){
		var str = '';
		$.each(orderStatusData, function(key, val){
			str += '<option value="'+key+'">'+val+'</option>';
		});
		$page.find('.j_orderStatusSel').append(str);
	}
	function initDatePicker(){
		var $begin = $page.find('.j_beginTime');
		var $end = $page.find('.j_endTime');
		var begin = new Date();
		var end = new Date();
		begin.setDate(begin.getDate() - 7);
		var beginPicker = new App.DatePicker({
          	el: $begin,
			val: $begin.val() ? null : begin,
			hasTime: true,
			format: "yyyy-MM-dd hh:mm:ss",
			beforeEl:$end
		});
		var endPicker = new App.DatePicker({
          	el: $end,
			val: $end.val() ? null : end,
			hasTime: true,
			format: "yyyy-MM-dd hh:mm:ss",
			afterEl:$begin
		});
	}
	function filterEmpty(result){
		var obj = {};
		for(var p in result){
			if(result[p] !== ''){
				obj[p] = result[p];
			}
		}
		return obj;
	}

	function sendGoods(orderId, logistics){
		var logisticsId = logistics.logisticsId;
		new App.LightBox({
			type:'confirm',
			title: '填写物流信息',
			msg: template('logisticsTpl',logistics),
			msgType:'none',
			timeout:null,
			confirmFn: function(lightBox){
				var validator = new App.FormValidator({
					$form: lightBox.domEl.find('.logisticsForm')
				});
				var result = validator.validate();
				
				if(!result.FAILED){
					var data = $.extend({
						'call': logisticsId? 'admin.modifyLogistics' : 'admin.addLogistics',
						'orderId':orderId
					},result);
					if(logisticsId){
						data.logisticsId = logisticsId;
					}
					App.onceAjax({
						data:data
					}).done(function(data){
						if(data && (data == 1 || data.logisticsId)){
							App.tip('物流信息填写成功！');
							reloadData();
						}else{
							App.tip('物流信息填写失败！','error');
						}
					}).fail(function(res){
						App.tip(res && res.message || '物流信息填写失败！', 'error');
					});
				}
			}
		}).show();
	}
	$page.on('click', '.j_queryBtn',function(){
		var result = validator.validate();
		if(result.beginTime){
			result.beginTime = new Date(result.beginTime).getTime();
		}
		if(result.endTime){
			result.endTime = new Date(result.endTime).getTime();
		}
		loadData($.extend({},defaultParams, filterEmpty(result)));
		resetPager();
	}).on('click','.j_cancelOrder',function(){
		var $tr = $(this).closest('tr');
		var orderId = $tr.data('orderid'),
			orderNo = $tr.data('orderno');
		App.confirm('确定取消订单号为['+ orderNo +']的订单吗？',function(){
			App.onceAjax({
				data:{
					'call': 'admin.cancelOrder',
					'orderId': orderId
				}
			}).done(function(data){
				if(data == 1){
					App.tip('订单取消成功！');
					reloadData();
				}else{
					App.tip('订单取消失败！','error');
				}
			}).fail(function(res){
				App.tip(res && res.message || '订单取消失败！', 'error');
			});
		});
	}).on('click','.j_sendGoods',function(){
		var $tr = $(this).closest('tr');
		var orderId = $tr.data('orderid');
		App.onceAjax({
			data:{
				'call': 'admin.getLogistics',
				'orderId': orderId
			}
		}).done(function(json){
			sendGoods(orderId, json || {});
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}).on('click','.j_acceptOrder',function(){
		var $tr = $(this).closest('tr');
		var orderId = $tr.data('orderid');
		App.onceAjax({
			data:{
				'call': 'admin.workingOrder',
				'orderId': orderId
			}
		}).done(function(data){
			if(data == 1){
				App.tip('订单确认成功！');
				reloadData();
			}else{
				App.tip('订单确认失败！','error');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}).on('click','.j_refundOrder',function(){
		var $tr = $(this).closest('tr');
		var orderId = $tr.data('orderid');
		App.onceAjax({
			data:{
				'call': 'admin.refundOrder',
				'orderId': orderId
			}
		}).done(function(data){
			if(data == 1){
				App.tip('订单退货退款成功！');
				reloadData();
			}else{
				App.tip('订单退货退款失败！','error');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	});
	
	initStatusSelect();
	initQueryForm();
	initDatePicker();
	if(urlParams.call){
		$page.find('.j_queryBtn').click();
	}
});