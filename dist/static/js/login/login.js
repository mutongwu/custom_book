$(function(){function n(){var n=i.validate();n.FAILED||(n.call="user.login",App.onceAjax({data:n}).done(function(){App.linkTo("/index.jsp")}).fail(function(n){App.tip(n&&n.message,"error")}))}var o=$(".loginForm"),i=new App.FormValidator({$form:o});o.on("click","#j_submit",function(){n()}).on("click",".j_getCode",function(){var n=$(this);n.hasClass("disable")||tryGetCode(n)})});