$(function(){function e(e){new App.BookFx({$cnt:$("#j_bookCnt"),editable:!1,data:{nameStr:e.pinyinName,zhNameStr:e.chineseName,opt:{sex:1==e.gender?"boy":"girl",v:e.storyId},list:JSON.parse(e.nameInfo)},onError:function(){App.tip("对不起，暂不支持您的定制要求","error")}})}function o(o){App.ajax({data:{call:"1"==GlobalData.type?"admin.showOrderDetail":"order.showMyOrderDetail",orderId:o}}).done(function(o){if(o){var a=null;$.each(o.orderGoodsVoes||[],function(e,o){return o.orderGoodsId==n.orderGoodsId?(a=o,!1):void 0}),a&&(r.html(template("bookTpl",{item:a,_admin:GlobalData.type,_sex:1==a.gender?"boy":"girl",_v:a.storyId,_jsonInfo:JSON.parse(a.nameInfo)})),e(a))}else App.tip(res&&res.message,"error")}).fail(function(e){App.tip(e&&e.message,"error")})}var r=$(".bookResultCnt"),n=App.params();o(n.orderId)});