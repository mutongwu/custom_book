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

    <div class="container orderCnt">
    	<h1 class="tc">我的订单</h1>
    	<div class="couponInfo fs18 cf">
            <div class="fl j_couponInfo none">
                你的优惠码<strong class="red">123</strong>&nbsp;<a href="/book/help/help.jsp?t=coupon" target="_blank">优惠码有什么用？</a>
            </div>
            <div class="fr">
                <a href="/book/profile/address.jsp">管理我的收货地址</a>
            </div>
        </div>
        <div class="ui-tab ">
            <ul class="cf">
                <li class="tabItem fs18 active"><a  class="j_order" data-status="">全部订单</a></li>
                <li class="tabItem fs18"><a  class="j_order" data-status="0">未支付</a></li>
                <li class="tabItem fs18"><a  class="j_order" data-status="4">已完成</a></li>
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
<script type="text/html" id="orderTpl">
{{each list as item}}
<tr>
    <td>
        <a href="">{{item.orderNo}}</a>
    </td>
    <td class="tl">
        <p><a href="">{{item.summary}}</a></p>
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

<script>
	var GlobalData = {
		"rootPath" :'/book/',
		"userId" : "${userId}",
		"type":"${userMap.role}"
	};
</script>
<script src="//www.sy111.com/book/static/pkg/aio.js"></script>
<script>
    $(function(){
        App.ajax({
            data: {
                'call': 'user.getUserInfo'
            }
        }).done(function(json){
            if(json && json.userId){
                App.User = json;
                var $box = $('#j_topNav .j_userInfo');
                $box.find('.j_userName').text(json.nickname || '书友会员');
                json.attachmentId && $box.find('.j_headPic').attr('src', '/book/u/s.do?attachmentId=' + json.attachmentId);
                $box.removeClass('noLogin');
            }
        });
        $('.j_logout').on('click',function(){
            Cookies.remove('onlineId',{path:'/',domain:'.sy111.com'});
            Cookies.remove('user',{path:'/',domain:'.sy111.com'});
            App.linkTo('/index.jsp');
        })
    });
</script>
<script src="//www.sy111.com/book/static/js/order/order.js"></script>
</body>
</html>