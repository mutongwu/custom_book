<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container orderdetailCnt">
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
                <div class="item pure-u-3-4">
                    <strong>收货地址：</strong>
                    <span>广东省广州市荔湾区123</span>
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
                        <img class="pic" src="../images/core/book.png" />
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
                        <img class="pic" src="../images/core/book.png" />
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

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="../js/order/order.js"></script>
</body>
</html>