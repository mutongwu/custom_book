<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container orderdetailCnt">
    	
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
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
            <span>{{ordersVo.province}}{{ordersVo.city}}{{ordersVo.county}}</span>
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
                <img class="pic" src="/images/core/book.png" />
            </div>
            <div class="pure-u-12-24">
                <a href="@ROOT_PATH/book/result.jsp?orderId={{ordersVo.orderId}}&orderGoodsId={{$value.orderGoodsId}}" target="_blank">
                <h4>《找朋友-<span>{{$value.chineseName}}</span>的神奇之旅》</h4>
                <p class="text">{{$value.pinyinName}}</p>
                </a>
            </div>
            <div class="pure-u-7-24">
                <div class="moreBox">
                    <strong class="price">{{$value.price | priceFormat}} 元</strong>
                    {{if $value.isPacking}}
                    <p>带礼品包装</p>
                    {{/if}}
                    <p><a href="@ROOT_PATH/book/result.jsp?orderId={{ordersVo.orderId}}&orderGoodsId={{$value.orderGoodsId}}" target="_blank">
                    查看详细
                    </a></p>
                </div>
            </div>
        </div>
    </li>
    {{/each}}
</div>
</script>
<script src="../js/order/orderdetail.js"></script>
</body>
</html>