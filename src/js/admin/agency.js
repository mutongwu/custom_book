$(function(){
	var agencyStatusData = {
		'-2': '停止合作',
		'-1': '不通过',
		'0': '待审核',
		'1': '审核通过'
	};

	var $page = $('.adminAgencyCnt');
	var validator = new App.FormValidator({
		$form: $page.find('.queryForm')
	});
	var defaultParams = {
		'call': 'admin.listPartnerInfo',
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
				$page.find('.j_tbdBox').html(template('itemTpl', json));
				initPageBar(json, params);
			}else{
				$page.find('.j_tbdBox').html('<tr><td colspan="'+$page.find('thead th').length+'"><p class="tc">暂无代理~</p></td></tr>');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
		queryParams = params;
	}
	function initStatusSelect(){
		var str = '';
		$.each(agencyStatusData, function(key, val){
			str += '<option value="'+key+'">'+val+'</option>';
		});
		$page.find('.j_agencyStatus').append(str);
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

	function auditApply(applyId, isAccept){
		new App.LightBox({
			type:'confirm',
			title: '填写('+ (isAccept ? '通过' : '不通过') + ')审核意见',
			msg: $('#popFormTpl').html(),
			msgType:'none',
			timeout:null,
			confirmFn: function(){
				var validator = new App.FormValidator({
					$form: $('.j_agencyAuditForm')
				});
				var result = validator.validate();
				
				if(!result.FAILED){
					var data = $.extend({
						'call': isAccept? 'admin.approvePartnerInfo' : 'admin.disagreePartnerInfo',
						'partnerInfoId':applyId
					},result);
					App.onceAjax({
						data:data
					}).done(function(data){
						if(data == 1){
							App.tip('申请信息审核成功！');
							reloadData();
						}else{
							App.tip('申请信息审核失败！','error');
						}
					}).fail(function(res){
						App.tip(res && res.message || '申请信息审核失败！', 'error');
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
		loadData($.extend({},defaultParams,filterEmpty(result)));
		resetPager();
	}).on('click', '.j_accept',function(){
		var $tr = $(this).closest('tr');
		var id = $tr.data('id');
		auditApply(id,true);
	}).on('click', '.j_deny',function(){
		var $tr = $(this).closest('tr');
		var id = $tr.data('id');
		auditApply(id, false);
	}).on('click', '.j_lock',function(){
		var $tr = $(this).closest('tr');
		var id = $tr.data('uid');
		var name = decodeURIComponent($tr.data('name'));
		App.confirm('确定终止代理【<span class="red">'+ name + '</span>】的合作伙伴关系吗？',function(){
			App.onceAjax({
				'call': 'admin.discontinuePartnerInfo',
				'userId':id
			}).done(function(data){
				if(data > 0){
					App.tip('停止合作操作成功！');
					reloadData();
				}else{
					App.tip('停止合作操作失败！','error');
				}
			}).fail(function(res){
				App.tip(res && res.message || '停止合作操作失败！', 'error');
			});
		});
	});
	initDatePicker();
	initStatusSelect();
	$('.j_distinctSelect').distpicker();
});