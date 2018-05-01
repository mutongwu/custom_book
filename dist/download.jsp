<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    
<meta charset="UTF-8">
<title>书友</title>

    <link type="text/css" rel="stylesheet" href="//www.sy111.com/book/static/pkg/aio.css" />
</head>
<body>
<div class="wrapper appDownload">
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

    <div class="bannerBox">
        <img src="//www.sy111.com/book/static/images/banner.jpg" class="banner"/>
        <div class="bd pr">
            <img src="//www.sy111.com/book/static/images/phone.png" class="phone"/>
            <img src="//www.sy111.com/book/static/images/qrcode.jpg" class="qrcode"/>
            <img src="//www.sy111.com/book/static/images/slogo.png" class="slogo"/>
            <img src="//www.sy111.com/book/static/images/downloadTip.png" class="downloadTip"/>
        </div>
    </div>
    <div class="container">
        <div class="appIntro">
            <ul class="cf">
                <li class="fl"><img src="//www.sy111.com/book/static/images/icon_discover.png">
                    <h2>发现附近好书</h2>
                    <p>附件的好书，即时可掌握， 阅读——没有距离</p>
                </li>
                <li class="fl"><img src="//www.sy111.com/book/static/images/icon_book.png">
                    <h2>管理你的藏书</h2>
                    <p>扫描一下条形码，即可把 家里的藏书收进手机中， 轻松管理</p>
                </li>
                <li class="fl"><img src="//www.sy111.com/book/static/images/icon_share.png">
                    <h2>上架闲置图书</h2>
                    <p>闲置的图书，可以进行交 换，让知识流动起来</p>
                </li>
                <li class="fl"><img src="//www.sy111.com/book/static/images/icon_heart.png">
                    <h2>书友分享图书</h2>
                    <p>邀请好友加入，一起分享、 交换图书。好书，与朋友 一起分享！</p>
                </li>
            </ul>
        </div>
        <div class="downloadIntro tc">
            <h2>可在iOS和安卓系统上使用</h2>
            <a class="downloadBtn ios" href="#"></a>
            <a class="downloadBtn" href="#"></a>
            <p>您可以在各大安卓应用市场 <a href="#">豌豆荚</a>, <a href="#">百度</a>,
                <a href="#">360</a>, <a href="#">腾讯</a>, <a href="#">小米</a> 下载我们最新版本的手机App。书友——与那本书不期而遇！</p>
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
<script src="//www.sy111.com/book/static/js/allBooks.js"></script>
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
</body>
</html>