<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container bookEditCnt">
        <h1 class="tc">确认订单</h1>
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
                            <a href="./book/editname.html">编辑图书</a>
                        </div>
                    </div>
                    <a class="delBox"></a>
                </li>
            </ul>
        </div>
    	<div class="bookEdit">
            <link rel="import" href="../pub/partial_memopic.jsp?__inline">
        </div>
        <div class="btnBox tc">
            <a class="ui-button ui-button-green ui-button-XL" href="./book/preview.html">返回预览</a>
            <a class="ui-button ui-button-yellow ui-button-XL" href="./cart/cart.html">加入购物车</a>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="../js/book/book.js"></script>
</body>
</html>