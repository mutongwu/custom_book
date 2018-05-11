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
if (DEBUG.equals("") && request.getAttribute("userId") != null){
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

    <div class="container loginCnt" >
        <h1 class="title tc green">登录</h1>
        <div class="contentBox ">
            <div class="thirdLoginBox">
                <p class="tc"><a href="https://api.weibo.com/oauth2/authorize?client_id=1260913599&response_type=code&with_offical_account=1&redirect_uri=http%3A%2F%2Fwww.sy111.com%2Fbook%2Flogin%2Fweibo.do" class="thirdLogin wb"></a></p>
                <p class="tc"><a href="https://graph.qq.com/oauth2.0/authorize?client_id=101473782&response_type=code&redirect_uri=http%3A%2F%2Fwww.sy111.com%2Fbook%2Flogin%2Fqq.do%3FfowardURL%3Dhttp%3A%2F%2Fwww.sy111.com%2Fbook" class="thirdLogin qq"></a></p>
				<p class="tc"><a href="https://open.weixin.qq.com/connect/qrconnect?appid=wxad7fc562739cab87&response_type=code&redirect_uri=http%3A%2F%2Fwww.sy111.com%2Fbook%2Flogin%2Fweixin.do%3Fclient%3Dpc%26fowardURL%3Dhttp%3A%2F%2Fwww.sy111.com%2Fbook&scope=snsapi_login" class="thirdLogin wx"></a></p>
                <p class="tip tc">或者用本站账号登录</p>
            </div>
            <div class="formBox tc">
                <form class="ui-form loginForm">
                    <div class="ui-form-item">
                        <label class="ui-form-label">账号：</label>
                        <div class="ui-form-group">
                            <input required="required" class="ui-input" name="login" placeholder="邮箱/手机号/用户名"/>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">密码：</label>
                        <div class="ui-form-group">
                            <input type="password" required="required" class="ui-input" name="userPwd" placeholder="密码"/>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <label><input type="checkbox" class="ui-checkbox" name="remember" />记住密码</label>
                            <a class="forget fs12" href="./findPwd.jsp">忘记密码？</a>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <input type="button" class="ui-button ui-button-yellow   ui-button-XL" value="登录" id="j_submit" />
                        </div>
                    </div>
                    <div class="ui-form-item registTip">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <p class="">还没有账号？请<a href="./register.jsp">注册。</a></p>
                        </div>
                    </div>
                </form>
            </div>
            
        </div>
    </div>
    
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
<script type="text/javascript" src="//www.sy111.com/book/static/js/login/login.js"></script>
</body>
</html>