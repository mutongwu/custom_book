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
        <div class="bookList" id="j_cartList">
        </div>
        <div class="adviceBox none tc">
            <h3 >你要帮朋友定一本吗？</h3>
            <h3 >多定一本，一起下订单，可以节约<span class="j_discount"><span>哦。</h3>
            <a href="@ROOT_PATH/index.jsp" class="ui-button ui-button-XL ui-button-yellow moreBtn">马上再订一本</a>
        </div>
        <div class="section addressBox none">
            <div class="addAddress">
                <h3 class="tc">填写收货地址</h3>
                <div class="ui-form ui-form-L j_addressForm">
                    <input type="hidden" name="addressId" />
                    <div class="ui-form-item">
                        <input class="ui-input" class="fl username" placeholder="收货人" required  name="name" maxlength="16" />
                        <input required="required" vtype="phone" class="ui-input" name="mobile" class="fl phone" placeholder="联系电话"/>
                        <p class="ui-field-error"></p>
                    </div>
                    <div class="ui-form-item" id="j_distpicker">
                        <select class="ui-select"  name="province" required label="省份">
                            <option>省份</option>
                        </select>
                        <select class="ui-select"  name="city" required label="城市">
                            <option>城市</option>
                        </select>
                        <select class="ui-select"  name="contry" required label="区县">
                            <option>区县</option>
                        </select>
                        <p class="ui-field-error"></p>
                    </div>
                    <div class="ui-form-item">
                        <input required class="ui-input" name="address" placeholder="详细地址" maxlength="30"/>
                    </div>
                    <div class="btnBox tc">
                        <input type="input" class="ui-button ui-button-XL ui-button-green" value="保存" />
                    </div>
                </div>
            </div>
        </div>
        <div class="section priceBox none">
            <h3 class="tc">总价</h3>
            <ul class="pure-g ui-form ui-form-L">
                <li class="pure-u-1-2 item">
                    <p>输入优惠码，还可以再优惠10%<span class="icon icon-question"></span></p>
                    <div class="ui-form-item">
                        <input class="ui-input coupon" placeholder="优惠码"/>
                    </div>
                </li>
                <li class="pure-u-1-2 item j_priceTotal">
                    <p><label>价格：</label><strong class="j_total">218元</strong></p>
                    <p><label>优惠：</label><strong class="j_discount">-18元</strong></p>
                    <p><label>总价：</label><strong class="price j_price">200元</strong></p>
                </li>
            </ul>

        </div>
        <div class="btnBox tc none">
            <a class="ui-button ui-button-yellow ui-button-XL" id="j_submit">提交订单</a>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="itemTpl">
<ul>
{{each}}
<li class="bookList-item j_cartItem" data-orderId="{{$value.orderId}}" data-idx="{{$index}}">
    <div class="pure-g bookList-inner">
        <div class="pure-u-5-24">
            <img class="pic" src="/images/core/book.png" />
        </div>
        <div class="pure-u-12-24">
            <h4>《找朋友-<span>{{$value.chineseName}}</span>的神奇之旅》</h4>
            <p class="text">{{$value.pinyinName}}</p>
        </div>
        <div class="pure-u-7-24">
            <div class="moreBox">
                <strong class="price">{{$value.price | priceFormat}} 元</strong>
                {{if $value.isPacking}}
                <p>带礼品包装</p>
                {{/if}}
                <a class="j_cartItemEdit"  data-idx="{{$index}}">编辑图书</a>
            </div>
        </div>
        <a class="delBox j_delItem" data-idx="{{$index}}"></a>
    </div>
    <div class="pure-u-1-1 editItemCnt j_editItemCnt">

    </div>
</li>
{{/each}}
</ul>
</script>

<script type="text/html" id="editItemTpl">
<div class="bookPreview">
    <div id="j_bookCnt"></div>
</div>
<div class="bookEdit">
    <link rel="import" href="../pub/partial_nameform.jsp?__inline">
    <link rel="import" href="../pub/partial_memopic.jsp?__inline">
</div>
<div class="btnBox tc">
    <a class="ui-button ui-button-green ui-button-XL disable" id="j_cancelUpdate">取消修改</a>
    <a class="ui-button ui-button-yellow ui-button-XL" id="j_updateCartItem">确认修改</a>
</div>
</script>
<script src="/js/cart/cart.js"></script>
</body>
</html>