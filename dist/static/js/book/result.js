$(function(){function o(o){new App.BookFx({$cnt:$("#j_bookCnt"),editable:!1,data:{nameStr:o.pinyinName,opt:{sex:1==o.gender?"boy":"girl",v:o.storyId},list:JSON.parse(o.nameInfo)},onError:function(){App.tip("对不起，暂不支持您的定制要求","error")}})}function e(e){App.ajax({data:{call:"order.showMyOrderDetail",orderId:e}}).done(function(e){if(e){var t=null;$.each(e.orderGoodsVoes||[],function(o,e){return e.orderGoodsId==n.orderGoodsId?(t=e,!1):void 0}),t&&(r.html(template("bookTpl",{item:t,_admin:GlobalData.type,_jsonInfo:JSON.parse(t.nameInfo)})),o(t))}else App.tip(res&&res.message,"error")}).fail(function(o){App.tip(o&&o.message,"error")})}var r=$(".bookResultCnt"),n=App.params();e(n.orderId)});