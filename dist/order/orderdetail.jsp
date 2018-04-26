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
                        <img class="pic" src="//www.sy111.com/book/static/images/core/book.png" />
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
                        <img class="pic" src="//www.sy111.com/book/static/images/core/book.png" />
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