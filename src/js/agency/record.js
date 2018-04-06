$(function(){
	var $page = $('.recordCnt');
	var pageBar = null;

	function statusText(status){
		switch(+status){
			case 0: return '未提现';
			case 1: return '已提现';
			case 2: return '退货退款';
		}
	}

	function loadData(pageNo, pageSize){
		App.ajax({
			data:{
				'call': 'agent.listMyRebateDetail',
				pageNo: pageNo,
				pageSize: pageSize
			}
		}).done(function(json){
			var data = json.data;
			var total = json.total;
			if(data){
				$.each(data, function(i, item){
					item._dateStr = App.Format.fmDate(item.rebateTime,'yyyy-MM-dd hh:mm:ss');
					item._statusTxt = statusText(item.status);
				});

				$('.j_dataTBody').html( template('recordTpl', {
					data: data
				}));
				if(!pageBar){
					pageBar = new App.PageBar({
						el: $('#j_pageBox'),
						cls: 'ui_pageBar_L',
						totalNum: total,
						jumpTo: false,
						onPage: function(p){
							loadData(p, pageSize);
						}
					});
				}
			}else{
				$('.j_dataTBody').html( '<tr><td colspan="4"><p class="tc">暂无相关记录</p></td></tr>');	
			}
			
		}).fail(function(res){
			App.tip(res && res.message);
		})		
	}

	loadData(1, 10);
});
