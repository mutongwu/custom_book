$(function(){var i=App.params(),t=$("#j_nameFormBox"),o=t.find(".charatorBox > .sex"),a=t.find(".charatorBox > .charatorPopBox");$(document).on("click",function(i){$(i.target).is(o)||$(i.target).is(a)||a.hide()});var e=new App.FormValidator({$form:t.find(".nameForm")}),r={sex:"boy",v:"v1"};o.on("click",function(){var i=$(this),t=i.siblings(".charatorPopBox");r.sex=i.attr("sex"),i.hasClass("ui-button-gray")?(i.removeClass("ui-button-gray"),o.not(i).addClass("ui-button-gray"),a.hide(),t.show(),activePop=t[0]):(t.show(),activePop=t[0])}),a.on("click",".picBox",function(){$(this).addClass("active").siblings(".picBox").removeClass("active"),a.hide(),r.v=$(this).attr("key")}),$(".container").on("click","#j_submitBtn",function(){var i=e.validate();if(i.FAILED)App.tip(i.msg,"error");else{if(/[^a-zA-Z\s]$/.test(i.py))return App.tip("请填写正确的名字拼音","error"),void e.setInvalid(t.find(".j_pyInput"));if(!App.BookData.checkValid(i.py))return App.tip("抱歉，暂不支持你的名字拼音","error"),void e.setInvalid(t.find(".j_pyInput"));r.py=i.py,r.zh=i.zh,App.linkTo("/book/preview.jsp",r)}}),/^(boy|girl)$/.test(i.sex)&&(r.sex=RegExp.$1),/^(v1|v2|v3)$/.test(i.v)&&(r.v=RegExp.$1),t.find(".j_pyInput").val(i.py),t.find(".j_zhInput").val(i.zh),o.addClass("ui-button-gray");var s=o.filter('.sex[sex="'+r.sex+'"]');s.removeClass("ui-button-gray"),s.siblings(".charatorPopBox").find('.picBox[key="'+r.v+'"]').click()});