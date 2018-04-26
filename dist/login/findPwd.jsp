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

    <div class="container findPwdCnt" >
        <h1 class="title tc green">找回密码</h1>

        <div class="contentBox tc">

            <form class="ui-form existForm tl">
                <div class="ui-form-item">
                    <h2 class="tc ">输入与您注册的电子邮件地址或者手机号码</h2>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">账号：</label>
                    <div class="ui-form-group">
                        <input required="required" class="ui-input" name="source" placeholder="邮箱/手机号" maxlength="18" />
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input  type="button" class="ui-button ui-button-L" value="下一步" id="j_checkExist" />
                    </div>
                </div>
            </form>
            <form class="ui-form findPwdForm tl">
               
                <div class="ui-form-item">
                    <label class="ui-form-label">验证码：</label>
                    <div class="ui-form-group">
                        <input required="required"  class="ui-input" name="code" placeholder="验证码"/>
                        <input type="hidden" name="verificationId" class="j_verificationId" />
                        <a href="javascript:;" class="ui-button  j_getCode">获取</a>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">新的密码：</label>
                    <div class="ui-form-group">
                        <input type="password" required="required" class="ui-input" name="userPwd" placeholder="密码" minlength="6" maxlength="18" />
                        <span class="tip">6位以上字符</span>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">确认密码：</label>
                    <div class="ui-form-group">
                        <input type="password" required="required" class="ui-input" name="userPwd2" placeholder="密码"  minlength="6"  maxlength="18" />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input  type="button" class="ui-button ui-button-L" value="提交" id="j_submit" />
                    </div>
                </div>
            </form>
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
<script src="//www.sy111.com/book/static/js/login/findPwd.js"></script>
</body>
</html>