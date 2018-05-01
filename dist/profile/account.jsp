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

    <div class="container accountCnt" >
        <h1 class="title tc green">基本资料</h1>
        <div class="ui-tab">
            <ul class="cf">
                <li class="tabItem active"><a href="./account.jsp">基本资料</a></li>
                <li class="tabItem "><a href="./address.jsp">收货地址</a></li>
                <li class="tabItem "><a href="./pwd.jsp">修改密码</a></li>
            </ul>
        </div>
        <div class="contentBox ">
            <div class="bd">
                <div class="ui-form accountForm">
                    <div class="ui-form-item">
                        <label class="ui-form-label">头像：</label>
                        <div class="ui-form-group">
                            <img src="//www.sy111.com/book/static/images/user-L.jpg" class="headPic j_headPic" />
                            <a class="ui-button uploadCnt" href="javascript:;">修改头像
                                <input type="file" id="j_fileupload" class="uploadFile " name="bytes"/>
                            </a>
                            <input type="hidden" name="attachmentId" />
                        </div>
                    </div>

                    <div class="ui-form-item">
                        <label class="ui-form-label">用户名：</label>
                        <div class="ui-form-group">
                            <p class="ui-form-text j_uname"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">昵称：</label>
                        <div class="ui-form-group">
                            <input maxlength="16" class="ui-input" name="nickname" placeholder="昵称"/>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">手机号码：</label>
                        <div class="ui-form-group">
                            <input required="required" vtype="phone" class="ui-input" name="mobilePhone" placeholder="手机号码"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">电子邮箱：</label>
                        <div class="ui-form-group">
                            <input required="required" vtype="email" class="ui-input" name="email" placeholder="电子邮箱"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">性别：</label>
                        <div class="ui-form-group">
                            <label><input type="radio" value="1" class="ui-radio" name="sex" checked>男</label>
                            <label><input type="radio" value="0" class="ui-radio" name="sex">女</label>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">所在城市：</label>
                        <div class="ui-form-group" id="j_distpicker">
                            <select class="ui-select" name="province">
                                <option>请选择省份</option>
                            </select>
                            <select class="ui-select" name="city">
                                <option>请选择城市</option>
                            </select>
                            <select class="ui-select" name="county">
                                <option>请选择区县</option>
                            </select>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">个性签名：</label>
                        <div class="ui-form-group">
                            <textarea class="ui-textarea" name="signature" placeholder="20个字以内"></textarea>
                        </div>
                    </div>

                    <div class="ui-form-item">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <input type="button" class="ui-button ui-button-L ui-button-yellow" value="提交" id="j_submit" />
                        </div>
                    </div>
                </div>
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
		"username":"${userMap.username}",
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
        }else{
            handleRes(GlobalData);
        }
        $('.j_logout').on('click',function(){
            Cookies.remove('onlineId',{path:'/',domain:'.sy111.com'});
            Cookies.remove('user',{path:'/',domain:'.sy111.com'});
            App.linkTo('/index.jsp');
        })
    });
</script>
<script type="text/javascript" src="//www.sy111.com/book/static/js/profile/account.js"></script>
</body>
</html>