
$(function () {
    var $page = $('.bookResultCnt');
	var params = App.params();

    function initBookFx(vo){
        new App.BookFx({
            $cnt: $('#j_bookCnt'),
            editable: false,
            data: {
                nameStr: vo.pinyinName,
                opt:{
                    sex: vo.gender == 1 ? 'boy':'girl',
                    v:  vo.storyId	
                },
                list: JSON.parse(vo.nameInfo)
            },
            onError: function(){
                App.tip('对不起，暂不支持您的定制要求','error');
            }
        });
    }
    function loadData(orderId){
		App.ajax({
			data:{
				'call': GlobalData.type == '1'? 'admin.showOrderDetail':'order.showMyOrderDetail',
				'orderId':orderId
			}
		}).done(function(json){
			if(json){
                var orderGoodVo = null;
                $.each(json.orderGoodsVoes || [], function(i,item){
                    if(item.orderGoodsId == params['orderGoodsId']){
                        orderGoodVo = item;
                        return false;
                    }
                });
                if(orderGoodVo){
                    $page.html(template('bookTpl', {
                        item: orderGoodVo,
                        _admin: GlobalData.type,
                        _sex: orderGoodVo.gender == 1 ? 'boy':'girl',
                        _v:  orderGoodVo.storyId,
                        _jsonInfo: JSON.parse(orderGoodVo.nameInfo)
                    }));

                    initBookFx(orderGoodVo);
                }
			}else{
				App.tip(res && res.message, 'error');
			}
		}).fail(function(res){
			App.tip(res && res.message, 'error');
		});
	}
	loadData(params.orderId);
});