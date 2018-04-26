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
<div class="wrapper">
    
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

    <div class="container orderdetailCnt adminOrderDetailCnt">
    	<h1 class="tc">订单号：234567890</h1>
    	<div class="orderInfo fs16">
            <div class="pure-g">
                <div class="item pure-u-1-4">
                    <strong>订单总价：</strong>
                    <span class="price">458元</span>
                </div>
                <div class="item pure-u-1-4">
                    <strong>订单状态：</strong>
                    <span class="red">已付款</span>
                </div>
                <div class="item pure-u-1-4">
                    <strong>物流信息：</strong>
                    <span>圆通快递</span>
                </div>
                <div class="item pure-u-1-4">
                    <strong>快递单号：</strong>
                    <span>12345678</span>
                </div>
                <div class="item pure-u-2-4">
                    <strong>收货地址：</strong>
                    <span>广东省广州市荔湾区123</span>
                </div>
                <div class="item pure-u-1-4">
                    <strong>下单人：</strong>
                    <span>张三</span>
                </div>
                <div class="item pure-u-1-4">
                    <strong>收件人：</strong>
                    <span>李四</span>
                </div>
                <div class="item pure-u-1-4">
                    <strong>联系电话：</strong>
                    <span>13800138000</span>
                </div>
            </div>
            
        </div>
        <div class="bookList">
            <ul>
                <li class="pure-g item">
                    <div class="pure-u-5-24">
                        <img class="pic" src="//www.sy111.com/book/static/images/core/book.png" />
                    </div>
                    <div class="pure-u-12-24">
                         <h4>《找朋友-张三的神奇之旅》</h4>
                         <p class="text">zhang san</p>
                    </div>
                    <div class="pure-u-7-24">
                        <div class="moreBox">
                            <strong class="price">168元</strong>
                            <p>带礼品包装</p>
                        </div>
                    </div>
                </li>
                <li class="pure-g item">
                    <div class="pure-u-5-24">
                        <img class="pic" src="//www.sy111.com/book/static/images/core/book.png" />
                    </div>
                    <div class="pure-u-12-24">
                         <h4>《找朋友-张三的神奇之旅》</h4>
                         <p class="text">zhang san</p>
                    </div>
                    <div class="pure-u-7-24">
                        <div class="moreBox">
                            <strong class="price">168元</strong>
                            <p>带礼品包装</p>
                        </div>
                    </div>
                </li>
            </ul>
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
<script src="//www.sy111.com/book/static/js/admin/order.js"></script>
</body>
</html>