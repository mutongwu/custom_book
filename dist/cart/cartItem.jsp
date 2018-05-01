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

    <div class="container cartItemCnt">
    	<h1 class="tc">购物车</h1>
    	<div class="innerBox">
	    	<div class="bookPreview">
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
		                    <a class="delBox"></a>
		                </li>
	                </ul>
	            </div>
<div id="j_bookCnt"></div>
	        </div>
	        <div class="bookEdit">
	            
<div class="nameFormBox vertical-form" id="j_nameFormBox">
    
    <form class="nameForm tc">
        <div>
            <div class="fieldBox cf">
                <input type="text" name="cn_name" placeholder="中文名字"  class="fl item tc ui-input" maxlength="16" />
                <input type="text" name="py_name" placeholder="名字拼音"  class="fl item tc ui-input" maxlength="16" />
            </div>
        </div>

        <div class="fieldBox cf">
            <div class="fl item charatorBox">
    <div class="sex ui-button ui-button-XL" sex="boy">男孩</div>
    <div class="charatorPopBox ui-arrow-box ui-arrow-box-gray border-radius size-xl">
        <div class="contentBox cf">
            <div class="picBox fl active" key="v1">
                <img class="charator" src="//www.sy111.com/book/static/images/core/boy1.jpg"/>
            </div>
            <div class="picBox fl " key="v2">
                <img class="charator" src="//www.sy111.com/book/static/images/core/boy2.jpg"/>
            </div>
            <div class="picBox fl " key="v3">
                <img class="charator" src="//www.sy111.com/book/static/images/core/boy3.jpg"/>
            </div>
        </div>
        <div class="ui-arrow ui-arrow-up">
           <em>◆</em><i>◆</i>
        </div>
    </div>
</div>
            <div class="fl item charatorBox">
    <div class="sex ui-button ui-button-gray ui-button-XL" sex="girl">女孩</div>
    <div class="charatorPopBox ui-arrow-box ui-arrow-box-gray border-radius size-xl">
        <div class="contentBox cf">
            <div class="picBox fl active" key="v1">
                <img class="charator" src="//www.sy111.com/book/static/images/core/girl1.jpg"/>
            </div>
            <div class="picBox fl "  key="v2">
                <img class="charator" src="//www.sy111.com/book/static/images/core/girl2.jpg"/>
            </div>
            <div class="picBox fl "  key="v3">
                <img class="charator" src="//www.sy111.com/book/static/images/core/girl3.jpg"/>
            </div>
        </div>
        <div class="ui-arrow ui-arrow-up">
           <em>◆</em><i>◆</i>
        </div>
    </div>    
</div>
        </div>
    </form>
</div>
	        </div>
	        <div class="bookMemo">
	            
<div class="memoPicBox">
	<div class="bd">
		<ul class="pure-g">
		    <li class="pure-u-14-24 item">
		    	<h3>写下你的独特寄语吧</h3>
		    	<p>我们将印刷在绘本的第2页上</p>
		    	<textarea class="ui-textarea memo" name="message" maxlength="300" label="寄语"></textarea>
		    	<p>只能写300字以内</p>
		    </li>
		    <li class="pure-u-10-24 item">
		    	<!--<link rel="import" href="/pub/partial_photoUpload.jsp?__inline">-->
				<div class="j_photoUploadDiv"></div>
		    	<h3>需要包装成礼品吗？</h3>
		    	<p>我们为您提供精致的礼品包装</p>
		    	<div class="giftBox">
		    		<div class="fieldItem">
		    			<label><input type="radio" name="gift" value="1" checked />需要加礼品包装:5元</label>
		    		</div>
		    		<div class="fieldItem">
		    			<label><input type="radio" name="gift" value="0"/>不需要礼品包装</label>
		    		</div>
		    	</div>
		    </li>
		</ul>
	</div>
</div>
	        </div>
	        <div class="btnBox tc">
	            <a class="ui-button ui-button-green ui-button-XL" href="./cart/cart.html">取消修改</a>
	            <a class="ui-button ui-button-yellow ui-button-XL" href="./cart/cart.html">确认修改</a>
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
<!-- <script src="../js/cart/cart.js"></script> -->

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
        }else if(GlobalData.userId){
            handleRes(GlobalData);
        }
        $('.j_logout').on('click',function(){
            Cookies.remove('onlineId',{path:'/',domain:'.sy111.com'});
            Cookies.remove('user',{path:'/',domain:'.sy111.com'});
            App.linkTo('/index.jsp');
        })
    });


	
	var bookData = {
		nameStr: 'xiaonanhai',
		sex: 1// 男孩
	};
		


$(function function_name(argument) {
	new App.BookFx({
		$cnt: $('#j_bookCnt'),
		data: bookData
	})
})
</script>
</body>
</html>