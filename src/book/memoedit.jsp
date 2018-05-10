<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
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
                <li class=" bookList-item">
                    <div class=" pure-g bookList-inner">
                        <div class="pure-u-5-24">
                            <img class="pic" src="../images/core/book.png" />
                        </div>
                        <div class="pure-u-12-24">
                            <h4>《找朋友-<span class="j_zhName"></span>的神奇之旅》</h4>
                            <p class="text j_pyName"></p>
                        </div>
                        <div class="pure-u-7-24">
                            <div class="moreBox j_goodsPriceBox">
                                <strong class="price j_statementPrice">--</strong>
                                <span class="oldPrice">原价:<span class="price j_originalPrice">--</span> 元</span>
                                <p class="j_isPackingTxt none">带礼品包装</p>
                                <p><a class="j_goEdit">编辑图书</a></p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    	<div class="bookEdit">
            <link rel="import" href="../pub/partial_memopic.jsp?__inline">
        </div>
        <div class="btnBox tc">
            <a class="ui-button ui-button-green ui-button-XL" href="javascript:history.back()">返回预览</a>
            <a class="ui-button ui-button-yellow ui-button-XL" id="j_addToCart">加入购物车</a>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="../js/book/memoedit.js"></script>
</body>
</html>