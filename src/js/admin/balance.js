$(function(){
	var balanceStatusData = {
		'0':'结算中',
		'1':'已结算'
	};
	var jsonList = null;
	var $page = $('.adminBalanceCnt');
	var validator = new App.FormValidator({
		$form: $page.find('.queryForm')
	});
	var defaultParams = {
		'call': 'admin.listStatementVo',
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
			if(json && json.list  && json.list.length){
				jsonList = json.list;
				$.each(json.list, function(i, item){
					item._statusTxt = balanceStatusData[item.status + ""];
				});
				$page.find('.j_tbdBox').html(template('itemTpl', json));
				initPageBar(json, params);
			}else{
				$page.find('.j_tbdBox').html('<tr><td colspan="'+$page.find('thead th').length+'"><p class="tc">暂无结算信息~</p></td></tr>');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
		queryParams = params;
	}
	function initStatusSelect(){
		var str = '';
		$.each(balanceStatusData, function(key, val){
			str += '<option value="'+key+'">'+val+'</option>';
		});
		$page.find('.j_balanceStatusSel').append(str);
	}
	function initDatePicker(){
		var $begin = $page.find('.j_beginTime');
		var $end = $page.find('.j_endTime');
		var begin = new Date();
		var end = new Date();
		begin.setDate(begin.getDate() - 7);
		var beginPicker = new App.DatePicker({
          	el: $begin,
			val:begin,
			hasTime: true,
			format: "yyyy-MM-dd hh:mm:ss",
			beforeEl:$end
		});
		var endPicker = new App.DatePicker({
          	el: $end,
			val: end,
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
	$page.on('click', '.j_queryBtn',function(){
		var result = validator.validate();
		if(result.beginTime){
			result.beginTime = new Date(result.beginTime).getTime();
		}
		if(result.endTime){
			result.endTime = new Date(result.endTime).getTime();
		}
		loadData($.extend({},defaultParams,filterEmpty(result)));
		resetPager();
	}).on('click','.j_accept', function(){
		var idx = $(this).closest('tr').data('idx');
		sessionStorage.setItem('BALANCE_DETAIL', JSON.stringify(jsonList[idx]));
		location.href = './balancedetail.jsp';
	});
	initDatePicker();
	initStatusSelect();
})