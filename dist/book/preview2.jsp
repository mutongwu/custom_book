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

    <div class="container bookPreviewCnt">
    	<div class="infoBox">
            <h1 class="tc">为孩子定制独一无二、珍藏一生的礼物</h1>
            <h2 class="tc">激发儿童阅读兴趣、培养情商的启蒙绘本</h2>
        </div>
    	<div class="bookPreview">
            

<!-- <script type="text/javascript" src="./js/widgets/flipbook.js"></script> -->
<input type="button" name="" id="left" value="pre">
<input type="button" name="" id="right" value="next">
<div class="cccc" style="width: 1000px;min-height: 360px;margin: 50px auto;position: relative;overflow: hidden;">
	

<div class="flipBook j_flipBook">
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/Front.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/A_Angel_s_Page_1.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/A_Angel_s_Page_2.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/S_Squid_s_Page_1.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/S_Squid_s_Page_2.jpg' class="pic" />
		</div>
	</div>
	<div class="flipItem j_flipItem">
		<div class="picBox">
			<img src='../images/sample/Back.jpg' class="pic" />
		</div>
	</div>
</div>

</div>
        </div>
        <div class="btnBox tc">
            <a class="ui-button ui-button-green ui-button-XL" href="./book/editname.html">修改名字</a>
            <a class="ui-button ui-button-yellow ui-button-XL" href="./book/memopic.html">马上下订单</a>
        </div>
    </div>
    <!-- END container-->

    
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
<!-- <script src="../js/book/book.js"></script> -->

<script>
	var GlobalData = {
		"rootPath" :'/book/',
		"userId" : "${userId}",
		"type":"${userMap.role}"
	};
</script>
<script src="//www.sy111.com/book/static/pkg/aio.js"></script>
<script type="text/javascript">
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


$(function(){
	// var curr = 0;
	// var $flipBook = $('.flipBook');
	// var $flipItem j_flipItems = $flipBook.find('.flipItem j_flipItem');
	// var w0 = $flipItem j_flipItems.eq(curr).width(),
	// 		h0 = $flipItem j_flipItems.eq(curr).height();

	// // $flipItem j_flipItems.height(h0).find('.picBox').height(h0)
	// $flipItem j_flipItems.css({
	// 	'clip': 'rect(0,500px,400px,0)'
	// }).filter(function(idx){
	// 	return idx % 2 !== 0
	// }).addClass('evenItem');

	// $('#left').click(function(){
	// 	var $flipEl = $flipItem j_flipItems.eq(curr - 1);
	// 	$flipEl.css({
	// 		width: 0,
	// 		left: 0
	// 	}).addClass('fliping');

	// 	var $nextEl = $flipItem j_flipItems.eq(curr - 2);
	// 	$nextEl.addClass('next').css({
	// 		clip: 'rect(0px 0px 400px 0px)'
	// 	});
	// 	$nextEl.animate({
	// 		clip: 'rect(0px 500px 400px 0px)'
	// 	}, 1000,function(){
	// 		$flipItem j_flipItems.not(function(idx){
	// 			return (idx === curr - 1)  || (idx === curr - 2)
	// 		}).removeClass('active');
	// 		$(this).removeClass('next').addClass('active')
	// 	});
	// 	$flipEl.animate({
	// 		width: w0,
	// 		left: '50%'
	// 	}, 1000,function(){
	// 		curr -= 2;
	// 		$(this).removeClass('fliping').addClass('active')
	// 	});
	// });

	// $('#right').click(function(){
		
	// 	var $flipEl = $flipItem j_flipItems.eq(curr + 2);
	// 	$flipEl.css({
	// 		width: 0,
	// 		left: '100%'
	// 	}).addClass('fliping');

	// 	var $nextEl = $flipItem j_flipItems.eq(curr + 2 + 1);
	// 	$nextEl.addClass('next').css({
	// 		clip: 'rect(0px 500px 400px 500px)'
	// 	});
	// 	$nextEl.animate({
	// 		clip: 'rect(0px 500px 400px 0px)'
	// 	}, 1000,function(){
	// 		$flipItem j_flipItems.not(function(idx){
	// 			return (idx === curr + 2)  || (idx === curr + 2 + 1)
	// 		}).removeClass('active');
	// 		$(this).removeClass('next').addClass('active')
	// 	});
	// 	$flipEl.animate({
	// 		width: w0,
	// 		left: 0
	// 	}, 1000,function(){
	// 		curr += 2;
	// 		$(this).removeClass('fliping').addClass('active')
	// 	});
	// })
	

})	


	$(function function_name(argument) {
			var p = 1;
			var instance = new App.FlipBook({
				$el: $('.j_flipBook')
			});
			$('#left').click(function(){
				p -= 1;
				instance.turnPage(p);
			});
			$('#right').click(function(){
				p += 1;
				instance.turnPage(p);
			})
	})
</script>
</body>
</html>