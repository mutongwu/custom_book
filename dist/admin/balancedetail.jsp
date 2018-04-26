<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    
<meta charset="UTF-8">
<title>书友</title>

    <link type="text/css" rel="stylesheet" href="//www.sy111.com/book/static/pkg/aio.css" />
    <link rel="stylesheet" type="text/css" href="./css/admin.css" />
</head>
<body>
<div class="wrapper adminPage">
    
<!-- 公共顶部 -->
<div class="topNav">
    <div class="userInfo ">
        <div class="bd cf">
            <h1 class="fl logo">书友</h1>
        </div>
    </div>
    <div class="navMenu">
        <div class="bd">
            <ul class="cf">
                <!-- <li class="fl active"><a href="./admin/order.html">首页</a></li> -->
                <li class="fl active"><a href="./order.jsp" class="link">订单管理</a></li>
                <li class="fl"><a href="./member.jsp"  class="link">会员管理</a></li>
                <li class="fl"><a href="./agency.jsp"  class="link">合作伙伴管理</a></li>
                <li class="fl last"><a href="./balance.jsp" class="link">结算列表</a></li>
                 <!--<li class="fr quickBtn">
                    <a href="./addBook.jsp">退出登陆</a>
                </li> -->
            </ul>
        </div>
    </div>
</div>
<!-- END:公共顶部 -->

    <div class="container applyCnt adminBalanceDetailCnt">
        <h1 class="tc">新增汇款记录</h1>
        <div class="applyBox tc">
            <form class="ui-form applyForm tl">
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>汇款日期：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="shopname" placeholder="店铺名称"   />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>合作伙伴：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="shopurl" placeholder="合作伙伴"   />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>收款人：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="site" placeholder="收款人"   />
                    </div>
                </div>
               
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>汇入银行：</label>
                    <div class="ui-form-group">
                        <select class="ui-select" name="bank">
                            <option>请选择</option>
                        </select>
                    </div>
                </div>
                
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>汇款金额：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="qq" placeholder="汇款金额"   />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button ui-button-XL" value="提交" />
                    </div>
                </div>
            </form>
        </div>
    </div><!-- END container-->

    
<div class="copyright ">
	<div class="bd cf">
    <p><a href="#">关于书友</a><a href="#">联系我们</a><a href="#">媒体报道</a>
       <a href="#">友情链接</a><a href="#">换书故事</a><a href="#">帮助中心</a>
    </p>
    <p>Copyright@2013-2015 书友 www.sy111.com 版权所有 000350号</p>
    <div class="followUs">
        <span class="fl">关注我们</span>
        <a class="weibo"></a>
        <a class="weixin"></a>
    </div>
    </div>
</div>
</div>

<script>
	var GlobalData = {
		"rootPath" :'/book/',
		"userId" : "${userId}",
		"admin":"${userMap.role}"
	};
</script>
<script src="//www.sy111.com/book/static/pkg/aio.js"></script>
<script>
    $(function(){
        var url = document.location.href;
        var page = null;
        if(/\/(\w+)\.jsp/.test(url)){
            page = RegExp.$1;
        }
        $('.topNav .link').filter('[href*='+page+']').closest('li').addClass('active').siblings().removeClass('active');
    });
</script>
</body>
</html>