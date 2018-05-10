<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    
<meta charset="UTF-8">
<title>书友</title>

    <link type="text/css" rel="stylesheet" href="//www.sy111.com/book/static/pkg/aio.css" />
    <link rel="stylesheet" type="text/css" href="//www.sy111.com/book/static/css/admin/admin.css" />
</head>
<body>
<div class="wrapper">
    
<!-- 公共顶部 -->
<div class="topNav" id="j_topNav">
    <div class="userInfo j_userInfo">
        <div class="bd cf">
            <h1 class="fl logo">书友</h1>
            <div class="fr userEntry">
                <div class="userBox fl">
                    <img src="//www.sy111.com/book/static/images/user.jpg" class="pic j_headPic" />
                    <span class="userName j_userName"></span>
                </div>
                <a  class="j_logout">退出</a>
            </div>
        </div>
    </div>
    <div class="navMenu">
        <div class="bd">
            <ul class="cf">
                <li class="fl"><a href="./order.jsp" class="link">订单管理</a></li>
                <li class="fl"><a href="./member.jsp"  class="link">会员管理</a></li>
                <li class="fl"><a href="./agency.jsp"  class="link">合作伙伴管理</a></li>
                <li class="fl"><a href="./rebate.jsp" class="link">返利列表</a></li>
                <li class="fl"><a href="./balance.jsp" class="link">结算列表</a></li>
                 <li class="fr quickBtn">
                    <a href="/book/index.jsp">定制书首页</a>
                </li> 
            </ul>
        </div>
    </div>
</div>
<!-- END:公共顶部 -->

    <div class="container orderdetailCnt adminOrderDetailCnt">

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
<script type="text/html" id="orderdetailTpl">
<h1 class="tc">订单号：{{ordersVo.orderNo}}</h1>
<div class="orderInfo fs16">
    <div class="pure-g">
        <div class="item pure-u-1-4">
            <strong>订单总价：</strong>
            <span class="price">{{priceFormat(ordersVo.statementPrice)}}元</span>
        </div>
        <div class="item pure-u-1-4">
            <strong>订单状态：</strong>
            {{if ordersVo.status == 0}}
            <span class="red">未支付</span>
            {{else if ordersVo.status == 1}}
            <span class="green">已支付</span>
            {{else if ordersVo.status == 2}}
            <span class="yellow">制作中</span>
            {{else if ordersVo.status == 3}}
            <span class="yellow">已发货</span>
            {{else if ordersVo.status == 4}}
            <span class="green">交易成功</span>
            {{else if ordersVo.status == -3}}
            <span class="red">订单取消</span>
            {{else if ordersVo.status == -2}}
            <span class="red">订单作废</span>
            {{else if ordersVo.status == -1}}
            <span class="red">退货退款</span>
            {{/if}}
        </div>
        <div class="item pure-u-1-4">
            <strong>物流信息：</strong>
            <span>{{logisticsVo.logisticsCompany}}</span>
        </div>
        <div class="item pure-u-1-4">
            <strong>快递单号：</strong>
            <span>{{logisticsVo.trackingNumber}}</span>
        </div>
        <div class="item pure-u-3-4">
            <strong>收货地址：</strong>
            <span>{{ordersVo.province}} {{ordersVo.city}} {{ordersVo.county}} {{ordersVo.address}}</span>
        </div>
        <div class="item pure-u-1-4">
            <strong>联系电话：</strong>
            <span>{{ordersVo.mobile}}</span>
        </div>
        <div class="item pure-u-1-4">
            <strong>收货人：</strong>
            <span>{{ordersVo.name}}</span>
        </div>
    </div>
</div>
<div class="bookList">
    {{each orderGoodsVoes}}
    <li class="bookList-item">
        <div class="pure-g bookList-inner">
            <div class="pure-u-5-24">
                <img class="pic" src="//www.sy111.com/book/static/images/core/book.png" />
            </div>
            <div class="pure-u-12-24">
                <a href="/book/book/result.jsp?orderId={{ordersVo.orderId}}&orderGoodsId={{$value.orderGoodsId}}" target="_blank">
                <h4>《找朋友-<span>{{$value.chineseName}}</span>的神奇之旅》</h4>
                <p class="text">{{$value.pinyinName}}</p>
                </a>
            </div>
            <div class="pure-u-7-24">
                <div class="moreBox">
                    <strong class="price">{{$value.statementPrice | priceFormat}} 元</strong>
                    <span class="oldPrice">原价:<span class="price">{{$value.originalPrice | priceFormat}}</span> 元</span>
                    {{if $value.isPacking}}
                    <p>带礼品包装</p>
                    {{/if}}
                    <p><a href="/book/book/result.jsp?orderId={{ordersVo.orderId}}&orderGoodsId={{$value.orderGoodsId}}" target="_blank">
                    查看详细
                    </a></p>
                </div>
            </div>
        </div>
    </li>
    {{/each}}
</div>
</script>

<script>
	var GlobalData = {
		"rootPath" :'/book/',
		"userId" : "${userId}",
		"type":"${userMap.role}",
		"attachmentId":"${userMap.attachmentId}",
		"userName":"${userMap.userName}",
		"email":"${userMap.email}",
		"nickname":"${userMap.nickname}",
		"mobile":"${userMap.mobile}"
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


    $(function(){
        App.ajax({
            data: {
                'call': 'user.getUserInfo'
            }
        }).done(function(json){
            if(json && json.userId){
                App.User = json;
                var $box = $('#j_topNav .j_userInfo');
                $box.find('.j_userName').text(json.nickname || '书友管理员');
                json.attachmentId && $box.find('.j_headPic').attr('src', '/book/u/s.do?attachmentId=' + json.attachmentId);
            }
        });
        $('.j_logout').on('click',function(){
            Cookies.remove('onlineId',{path:'/',domain:'.sy111.com'});
            Cookies.remove('user',{path:'/',domain:'.sy111.com'});
            App.linkTo('/index.jsp');
        });
    });
</script>
<script src="//www.sy111.com/book/static/js/admin/orderdetail.js"></script>
</body>
</html>