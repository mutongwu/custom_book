$(function(){var o=App.params(),e={nameStr:o.py.toLowerCase(),zhNameStr:o.zh,opt:{sex:"boy",v:"v1"}};/^(boy|girl)$/.test(o.sex)&&(e.opt.sex=RegExp.$1),/^(v1|v2|v3)$/.test(o.v)&&(e.opt.v=RegExp.$1);var t=new App.BookFx({$cnt:$("#j_bookCnt"),data:e,onError:function(){App.tip("对不起，暂不支持您的定制要求","error"),$("#j_goMemoEdit").hide()}});$(".container").on("click","#j_goModify",function(){App.linkTo("/book/editname.jsp",o)}).on("click","#j_goMemoEdit",function(){App.BookData.setInstance(t.getResult()),App.isLogin()?App.linkTo("/book/memoedit.jsp",o):App.confirm("您需要登录才能进行下一步操作。是否前往登录？",function(){App.linkTo("/login/login.jsp",{returnurl:location.href.replace("preview","memoedit")})})})});