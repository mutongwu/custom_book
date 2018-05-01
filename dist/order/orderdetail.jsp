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

    <div class="container orderdetailCnt">
    	
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
                    <strong class="price">{{$value.price | priceFormat}} 元</strong>
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
		"username":"${userMap.username}",
		"email":"${userMap.email}",
		"nickname":"${userMap.nickname}",
		"mobile":"${userMap.mobile}"
	};
</script>
<script src="//www.sy111.com/book/static/pkg/aio.js"></script>
<script>
    $(function(){
        function handleRes(json){
            App.User = json;
            var $box = $('#j_topNav .j_userInfo');
            $box.find('.j_userName').text(json.username || json.nickname || json.email || json.mobile || '书友会员');

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
<script src="//www.sy111.com/book/static/js/order/orderdetail.js"></script>
</body>
</html>