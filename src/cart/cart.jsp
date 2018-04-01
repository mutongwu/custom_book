<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container cartCnt">
        <h1 class="tc">购物车</h1>
        <div class="bookList">
            <ul>
                <li class="pure-g item">
                    <div class="pure-u-5-24">
                        <img class="pic" src="/images/core/book.png" />
                    </div>
                    <div class="pure-u-12-24">
                         <h4>《找朋友-张三的神奇之旅》</h4>
                         <p class="text">zhang san</p>
                    </div>
                    <div class="pure-u-7-24">
                        <div class="moreBox">
                            <strong class="price">168元</strong>
                            <p>带礼品包装</p>
                            <a href="./cartItem.html">编辑图书</a>
                        </div>
                    </div>
                    <a class="delBox"></a>
                </li>
                <li class="pure-g item">
                    <div class="pure-u-5-24">
                        <img class="pic" src="/images/core/book.png" />
                    </div>
                    <div class="pure-u-12-24">
                         <h4>《找朋友-张三的神奇之旅》</h4>
                         <p class="text">zhang san</p>
                    </div>
                    <div class="pure-u-7-24">
                        <div class="moreBox">
                            <strong class="price">168元</strong>
                            <p>带礼品包装</p>
                            <a href="./cartItem.html">编辑图书</a>
                        </div>
                    </div>
                    <a class="delBox"></a>
                </li>
            </ul>
        </div>
        <div class="adviceBox tc">
            <h3 >你要帮朋友定一本吗？</h3>
            <h3 >多定一本，一起下订单，可以节约15%哦。</h3>
            <a href="/" class="ui-button ui-button-XL ui-button-yellow moreBtn">马上再订一本</a>
        </div>
        <div class="section addressBox">
            <div class="addAddress">
                <h3 class="tc">填写收货地址</h3>
                <div class="ui-form ui-form-L">
                    <div class="ui-form-item">
                        <input class="ui-input" class="fl username" placeholder="收货人" />
                        <input class="ui-input" class="fl phone" placeholder="联系电话"/>
                    </div>
                    <div class="ui-form-item">
                        <select class="ui-select province">
                            <option>省份</option>
                        </select>
                        <select class="ui-select city">
                            <option>城市</option>
                        </select>
                        <select class="ui-select distinct">
                            <option>区县</option>
                        </select>
                    </div>
                    <div class="ui-form-item">
                        <input class="ui-input address" placeholder="详细地址"/>
                    </div>
                    <div class="btnBox tc">
                        <input type="input" class="ui-button ui-button-XL ui-button-green" value="保存" />
                    </div>
                </div>
            </div>
        </div>
        <div class=" bookEdit">
            <link rel="import" href="../pub/partial_memopic.jsp?__inline">
        </div>
        <div class="section priceBox">
            <h3 class="tc">总价</h3>
            <ul class="pure-g ui-form ui-form-L">
                <li class="pure-u-1-2 item">
                    <p>输入优惠码，还可以再优惠10%<span class="icon icon-question"></span></p>
                    <div class="ui-form-item">
                        <input class="ui-input coupon" placeholder="优惠码"/>
                    </div>
                </li>
                <li class="pure-u-1-2 item">
                    <p><label>价格：</label><strong>218元</strong></p>
                    <p><label>优惠：</label><strong>-18元</strong></p>
                    <p><label>总价：</label><strong class="price">200元</strong></p>
                </li>
            </ul>

        </div>
        <div class="btnBox tc">
            <a class="ui-button ui-button-yellow ui-button-XL" href="./cart.html">提交订单</a>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="/js/cart/cart.js"></script>
</body>
</html>