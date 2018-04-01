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
                你的优惠码<strong class="red">123</strong>&nbsp;<a href="./help/help.jsp?t=coupon" target="_blank">优惠码有什么用？</a>
            </div>
            <div class="fr">
                <a href="./profile.html?t=addr">管理我的收货地址</a>
            </div>
        </div>
        <div class="ui-tab ">
            <ul class="cf">
                <li class="tabItem fs18 active"><a href="profile.html">全部订单</a></li>
                <li class="tabItem fs18"><a href="recvComments.html">未支付</a></li>
                <li class="tabItem fs18"><a href="profile.html">已完成</a></li>
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
                <tbody>
                <tr>
                    <td>
                        <a href="./order/orderdetail.html">234567</a>
                    </td>
                    <td class="tl">
                        <p><a href="./book/preview.html">zhangsan 《找朋友-张三的神奇之旅》</a></p>
                        <p><a href="./book/preview.html">lisi 《找朋友-李四的神奇之旅》</a></p>
                    </td>
                    <td>
                        <strong class="price">345元</strong>
                    </td>
                    <td>
                        2016-12-21 11:22
                    </td>
                    <td>
                        <strong class="red">未支付</strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="./order/orderdetail.html">234567</a>
                    </td>
                    <td class="tl">
                        <p><a href="./book/preview.html">zhangsan 《找朋友-张三的神奇之旅》</a></p>
                    </td>
                    <td>
                        <strong class="price">115元</strong>
                    </td>
                    <td>
                        2016-12-21 11:22
                    </td>
                    <td>
                        <strong class="green">已完成</strong>
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="pageBox" id="j_pageBox">

            </div>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="../js/order/order.js"></script>
</body>
</html>