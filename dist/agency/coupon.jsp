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

    <div class="container couponCodeCnt">
        <h1 class="tc">优惠码</h1>
    	<div class="tabBox">
            
<div class="ui-tab mb30">
    <ul class="cf j_agencyTab">
        <li class="tabItem"><a href="./coupon.jsp">优惠码</a></li>
        <li class="tabItem"><a href="./agency.jsp">代理资料</a></li>
        <li class="tabItem"><a href="./record.jsp">返利记录</a></li>
        <li class="tabItem"><a href="./mybank.jsp">结算银行</a></li>
    </ul>
</div>
        </div>
        <div class="j_couponInfoBox">

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
<script type="text/html" id="couponInfoTpl">
{{if level}}
    <h1 class="green tc">您是<span class="type">
         {{if level == 1}}
            个人代理
        {{else if level == 2}}
            网店合作伙伴
        {{else}}
            实体店合作伙伴
        {{/if}}
    </span>，优惠码为：<span class="num red">{{couponNo}}</span></h1>
    <div class="agencyIntro">
        {{if level == 1}}
        <p>用户订购产品时，输入优惠码结算，结算价可优惠5%；赶紧告诉您的朋友吧。同时，您将获得5%的返利！长期可获得收益哦！</p>
        {{else if level == 2}}
        <p>用户订购产品时，输入优惠码结算，结算价可优惠5%；赶紧去推广吧。同时，您将获得10%的返利！长期可获得收益哦！</p>
        {{else}}
        <p>用户订购产品时，输入优惠码结算，结算价可优惠5%；赶紧去推广吧。同时，您将获得15%的返利！长期可获得收益哦！</p>
        {{/if}}
    </div>
{{else}}    
    <h1 class="red tc">赶快申请成为代理吧！</h1>
{{/if}}
<div class="btnBox fs18 tc">
    <div class="applyType">
        <a class="ui-button ui-button-L ui-button-yellow j_applyLink" href="./apply.jsp?level=1">个人代理</a>
        <p class="green">人人都可以申请</p>
    </div>
    <div class="applyType">
        <a class="ui-button ui-button-L ui-button-yellow j_applyLink" href="./apply.jsp?level=2">网店代理</a>
        <p class="green">要求有网络店铺</p>
    </div>
    <div class="applyType">
        <a class="ui-button ui-button-L ui-button-yellow j_applyLink" href="./apply.jsp?level=3">实体店代理</a>
        <p class="green">要求有实体店铺</p>
    </div>
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


	$(function(){
		if(/\/(\w+)\.jsp/.test(location.href)){
			var p = RegExp.$1;
			$('.j_agencyTab').find('a[href*="' + p + '"]').closest('.tabItem').addClass('active');
		}
	})
</script>
<script src="//www.sy111.com/book/static/js/agency/coupon.js"></script>
</body>
</html>