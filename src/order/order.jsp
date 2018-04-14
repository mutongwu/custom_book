<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container orderCnt">
    	<h1 class="tc">我的订单</h1>
    	<div class="couponInfo fs18 cf">
            <div class="fl">
                你的优惠码<strong class="red">123</strong>&nbsp;<a href="@ROOT_PATH/help/help.jsp?t=coupon" target="_blank">优惠码有什么用？</a>
            </div>
            <div class="fr">
                <a href="@ROOT_PATH/profile/address.jsp">管理我的收货地址</a>
            </div>
        </div>
        <div class="ui-tab ">
            <ul class="cf">
                <li class="tabItem fs18 active"><a href="#" class="j_order" data-status="">全部订单</a></li>
                <li class="tabItem fs18"><a href="#" class="j_order" data-status="0">未支付</a></li>
                <li class="tabItem fs18"><a href="#" class="j_order" data-status="4">已完成</a></li>
            </ul>
        </div>
        <div class="orderData fs16">
            <table class="table table-border-vertical">
                <thead>
                <tr>
                    <th class="tc">订单号</th>
                    <th class="tl">订购的产品</th>
                    <th class="tc">总金额</th>
                    <th class="tc">下单时间</th>
                    <th class="tc">订单状态</th>
                </tr>
                </thead>
                <tbody class="j_tbdBox">
                </tbody>
            </table>
            <div class="pageBox" id="j_pageBox">

            </div>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="orderTpl">
{{each list as item}}
<tr>
    <td>
        <a href="./order/orderdetail.html">{{item.orderId}}</a>
    </td>
    <td class="tl">
        <p><a href="@ROOT_PATH/order/orderItem.jsp?orderId={{item.orderId}}&orderNo={{item.orderNo}}">{{item.summary}}</a></p>
    </td>
    <td>
        <strong class="price">{{item.statementPrice | priceFormat}}元</strong>
    </td>
    <td>
        {{item.createTime | dateFormat}}
    </td>
    <td>
        {{if item.status == 0}}
        <strong class="red">未支付</strong>
        {{else if item.status == 1}}
        <strong class="green">已支付</strong>
        {{else if item.status == 2}}
        <strong class="yellow">制作中</strong>
        {{else if item.status == 3}}
        <strong class="yellow">已发货</strong>
        {{else if item.status == 4}}
        <strong class="green">交易成功</strong>
        {{else if item.status == -3}}
        <strong class="red">订单取消</strong>
         {{else if item.status == -2}}
        <strong class="red">订单作废</strong>
        {{else if item.status == -1}}
        <strong class="red">退货退款</strong>
        {{/if}}
    </td>
</tr>
{{/each}}
</script>
<script src="../js/order/order.js"></script>
</body>
</html>