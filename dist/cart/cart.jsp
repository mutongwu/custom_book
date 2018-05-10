<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    
<meta charset="UTF-8">
<title>书友</title>


    <link type="text/css" rel="stylesheet" href="//www.sy111.com/book/static/pkg/aio.css" />
</head>
<body>
<div class="wrapper">
    <%
String DEBUG = "";
if (DEBUG.equals("") && request.getAttribute("userId") == null){
    response.sendRedirect((String)request.getAttribute("basePath"));
    return;
}
%>
<!-- 公共顶部 -->
<div class="topNav" id="j_topNav">
    <div class="userInfo j_userInfo noLogin">
        <div class="bd cf">
            <h1 class="fl logo">书友</h1>
            <div class="fr userEntry">
                <div class="userBox fl">
                    <img src="//www.sy111.com/book/static/images/user.jpg" class="pic j_headPic" />
                    <span class="userName j_userName">这里用户名八个字</span>
                    <div class="userMenu">
                        <div class="ui-arrow-box">
                            <ul class="ui-arrow-content">
                                <!-- <li><a href="/profile.html">我的主页</a></li> -->
                                <li class="sep"><a href="/book/profile/account.jsp">个人资料</a></li>
                                <li><a href="/book/order/order.jsp">我的订单</a></li>
                                <li class="sep"><a href="/book/agency/coupon.jsp">我的优惠码</a></li>
                                <!-- <li><a href="/myBookShelf.html">我的换书架</a></li>
                                <li><a href="/bookBought.html">我换入的书</a></li>
                                <li class="sep"><a href="/bookSold.html">我换出的书</a></li>
                                <li class="sep"><a href="/shudou.html">我的书豆</a></li>
                                <li><a href="/favorite.html">我的收藏</a></li>
                                <li class="sep"><a href="/privacy.html">账户与隐私设置</a></li> -->
                                <li><a class="j_logout">退出登录</a></li>

                            </ul>
                            <div class="ui-arrow ui-arrow-up">
                                <em>◆</em><i>◆</i>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- <a href="/book/msgList.jsp" class="msg">消息<em></em></a> -->
                <a href="/book/cart/cart.jsp" class="cart">购物车<em></em></a>
            </div>
            <div class="fr guestEntry">
                <a href="/book/login/login.jsp" class="login">登陆</a>
                <a href="/book/login/register.jsp" class="register">注册</a>
            </div>
        </div>
    </div>
    <div class="navMenu">
        <div class="bd">
            <ul class="cf">
                <li class="fl active"><a href="/book/index.jsp">首页</a></li>
                <li class="fl"><a href="/book/index.jsp">产品中心</a></li>
                <li class="fl"><a href="/book/index.jsp">阅读推荐</a></li>
                <li class="fl"><a href="/book/index.jsp">合作伙伴</a></li>
                <li class="fl last"><a href="/book/help/help.jsp">帮助</a></li>
                <!-- <li class="fr quickBtn">
                    <a href="/addBook.html">添加图书</a>
                    <a href="/pubBook.html">上架图书</a>
                </li> -->
            </ul>
        </div>
    </div>

</div>
<!-- END:公共顶部 -->

    <div class="container cartCnt">
        <h1 class="tc">购物车</h1>
        <div class="bookList" id="j_cartList">
        </div>
        <div class="adviceBox none tc">
            <h3 >你要帮朋友定一本吗？</h3>
            <h3 >多定一本，一起下订单，可以节约<span class="j_discount"><span>哦。</h3>
            <a href="/book/index.jsp" class="ui-button ui-button-XL ui-button-yellow moreBtn">马上再订一本</a>
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
                        <select class="ui-select"  name="county" required label="区县">
                            <option>区县</option>
                        </select>
                        <p class="ui-field-error"></p>
                    </div>
                    <div class="ui-form-item">
                        <input required class="ui-input address_input" name="address" placeholder="详细地址" maxlength="30"/>
                    </div>
                    <div class="btnBox tc">
                        <input type="button" class="ui-button ui-button-XL ui-button-green j_saveAddress" value="保存" />
                    </div>
                </div>
            </div>
        </div>
        <div class="section priceBox none">
            <h3 class="tc">总价</h3>
            <ul class="pure-g ui-form ui-form-L">
                <li class="pure-u-1-2 item">
                    <p>输入优惠码，结算价可获得优惠<span class="icon icon-question j_showCouponTip"></span></p>
                    <div class="ui-form-item">
                        <input class="ui-input coupon j_couponInput" placeholder="优惠码"/>
                    </div>
                </li>
                <li class="pure-u-1-2 item j_priceTotal">
                    <p><label>价格：</label><strong class="j_total">0元</strong></p>
                    <p><label>优惠：</label><strong class="j_discount">0元</strong></p>
                    <p><label>总价：</label><strong class="price j_price">0元</strong></p>
                </li>
            </ul>

        </div>
        <div class="btnBox tc none">
            <a class="ui-button ui-button-yellow ui-button-XL" id="j_submit">提交订单</a>
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
<script type="text/html" id="itemTpl">
<ul>
{{each}}
<li class="bookList-item j_cartItem" data-orderId="{{$value.orderId}}" data-idx="{{$index}}">
    <div class="pure-g bookList-inner">
        <div class="pure-u-5-24">
            <img class="pic" src="//www.sy111.com/book/static/images/core/book.png" />
        </div>
        <div class="pure-u-12-24">
            <h4>《找朋友-<span>{{$value.chineseName}}</span>的神奇之旅》</h4>
            <p class="text">{{$value.pinyinName}}</p>
        </div>
        <div class="pure-u-7-24">
            <div class="moreBox">
                <strong class="price">{{$value.statementPrice | priceFormat}} 元</strong>
                <span class="oldPrice">原价:<span class="price">{{$value.originalPrice | priceFormat}}</span> 元</span>
                {{if $value.isPacking}}
                <p>带礼品包装</p>
                {{/if}}
                <div><a class="j_cartItemEdit"  data-idx="{{$index}}">编辑图书</a></div>
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
    
<div class="memoPicBox">
	<div class="bd">
		<ul class="pure-g">
		    <li class="pure-u-14-24 item">
		    	<h3>写下你的独特寄语吧</h3>
		    	<p>我们将印刷在绘本的第2页上</p>
		    	<textarea required="required" class="ui-textarea memo" name="message" maxlength="300" label="寄语"></textarea>
		    	<p>只能写300字以内</p>
		    </li>
		    <li class="pure-u-10-24 item">
		    	<!--<link rel="import" href="/pub/partial_photoUpload.jsp?__inline">-->
				<div class="j_photoUploadDiv"></div>
		    	<h3>需要包装成礼品吗？</h3>
		    	<p>我们为您提供精致的礼品包装</p>
		    	<div class="giftBox">
		    		<div class="fieldItem">
		    			<label><input type="radio" name="gift" value="1"  class="j_isPacking"/>需要加礼品包装:5元</label>
		    		</div>
		    		<div class="fieldItem">
		    			<label><input type="radio" name="gift" value="0" checked class="j_isPacking"/>不需要礼品包装</label>
		    		</div>
		    	</div>
		    </li>
		</ul>
	</div>
</div>
</div>
<div class="btnBox tc">
    <a class="ui-button ui-button-green ui-button-XL disable" id="j_cancelUpdate">取消修改</a>
    <a class="ui-button ui-button-yellow ui-button-XL" id="j_updateCartItem">确认修改</a>
</div>
</script>
<script type="text/html" id="couponTipTpl">
    <div class="couponTipPop">
    <strong>什么是优惠码？</strong>
    <p>用户订单产品时，输入优惠码结算，结算价可获得优惠。</p>
    <strong>如何获得优惠码？</strong>
    <p>您可以从我们的个人、网店、实体店合作伙伴处获得优惠码，也可以在首次订购产品成功后，申请成为我们的合作伙伴，即可获得优惠码。</p>
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
<script type="text/javascript">
    $(function(){
        function handleRes(json){
            App.User = json;
            var $box = $('#j_topNav .j_userInfo');
            $box.find('.j_userName').text(json.userName || json.nickname || json.email || json.mobile || '书友会员');

            json.attachmentId && $box.find('.j_headPic').attr('src', '/book/u/s.do?attachmentId=' + json.attachmentId);
            $box.removeClass('noLogin');
        }
        if(""){
            App.ajax({
                data: {
                    'call': 'user.getUserInfo'
                }
            }).done(handleRes);
        }else if(GlobalData.userId){
            handleRes(GlobalData);
        }
        $('.j_logout').on('click',function(){
            Cookies.remove('onlineId',{path:'/',domain:'.sy111.com'});
            Cookies.remove('user',{path:'/',domain:'.sy111.com'});
            App.linkTo('/index.jsp');
        })
    });
</script>
<script type="text/javascript" src="//www.sy111.com/book/static/pkg/cart/cart.jsp_aio.js"></script>
</body>
</html>