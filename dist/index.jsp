
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
    <div class="container indexCnt">
        <div class="infoBox">
            <h1 class="tc">为孩子定制独一无二、珍藏一生的礼物</h1>
            <h2 class="tc">激发儿童阅读兴趣、培养情商的启蒙绘本</h2>
        </div>
        <div class="bookSample">
<div id="j_bookCnt"></div>
        </div>
        <div class="nameFormBox" id="j_nameFormBox">
            <h3>输入小朋友的名字，开启神奇之旅</h3>
            <form class="nameForm tc"  target="_self">
                <div class="fieldBox cf">
                    <input type="text" name="zh" placeholder="中文名字"  class="fl item tc ui-input j_zhInput" maxlength="16" required="required" label="中文名字"/>
                    <input type="text" name="py" placeholder="名字拼音"  class="fl item tc ui-input j_pyInput" maxlength="16" required="required" label="名字拼音"/>
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
                    <a  class="fl ui-button ui-button-yellow ui-button-XL submit_btn" id="j_submitBtn">马上定制绘本</a>
                </div>
            </form>
        </div>
        <div class="featureBox">
            <ul class="pure-g">
                <li class="pure-u-1-3 item"><h3 class="tc">个性化定制</h3>
                    <p>输入孩子的名字拼音，我们即可为您的孩子制作一本个性化定制的故事书，有小朋友的名字，为小朋友定制的小故事，专为0-8岁的孩子定制。</p>
                </li>
                <li class="pure-u-1-3 item"><h3 class="tc">AR增强现实互动</h3>
                    <p>这本绘本特别采用了增强现实技术，用手机扫一扫绘本上的动物，即可看到3D的动物动画，有动物的真实音效果，还有丰富的解说。小朋友还可以与这些动物互动哦，很神奇吧。</p>
                </li>
                <li class="pure-u-1-3 item"><h3 class="tc">贴心服务</h3>
                    <p>全国范围内，我们都免费配送。输入优惠码，您可以获得特别的优惠。如果是当成礼物送人，我们还特别给您提供精美礼品包装服务。</p>
                </li>
            </ul>
        </div>
        <!-- 轮播图  -->
        <div class="sliderBox j_introSliderBox">
            <ul class="slider cf">
                <li class="sliderItem"><a href="#"><img  class="pic" src="//www.sy111.com/book/static/images/slider1.jpg"/>
                    <img class="s-text" src="//www.sy111.com/book/static/images/s1_text.png" />
                </a></li>
                <li class="sliderItem"><a href="#"><img  class="pic" src="//www.sy111.com/book/static/images/slider2.jpg"/>
                    <img class="s-text" src="//www.sy111.com/book/static/images/s2_text.png" />
                </a></li>
                <li class="sliderItem"><a href="#"><img  class="pic" src="//www.sy111.com/book/static/images/slider3.jpg"/>
                    <img class="s-text" src="//www.sy111.com/book/static/images/s3_text.png" />
                </a></li>
                <li class="sliderItem"><a href="#"><img  class="pic" src="//www.sy111.com/book/static/images/slider4.jpg"/>
                    <img class="s-text" src="//www.sy111.com/book/static/images/s4_text.png" />
                </a></li>
            </ul>
            <div class="sliderNav">
                <dl>
                <dd class="sliderNavItem active"></dd>
                <dd class="sliderNavItem"></dd>
                <dd class="sliderNavItem"></dd>
                <dd class="sliderNavItem"></dd>
                </dl>
                <div class="sliderNavLeft"></div>
                <div class="sliderNavRight"></div>
            </div>
        </div>
        <!-- END:轮播图 -->


        <div class="userCommentBox">
            <h3 class="title tc">顾客的评价</h3>
            <div class="sliderBox j_commentSliderBox">
                <ul class="slider cf">
                    <li class="sliderItem">
                        <div class="commentItem tc">
                            <img src="//www.sy111.com/book/static/images/core/girl1.jpg" class="uPic" />
                            <p class="name">Linda</p>
                            <p class="text">
                            1.儿子很喜欢这本书，天天看，还能看这书 上的图讲出故事 来。儿童阅读是一个积累和探究的过程，犹如成长一样。陪读和伴读，并不是要代替孩子阅读。选书方面也一样，帮孩子把关，而不是父母做主。
                            </p>
                        </div>
                        <div class="commentItem tc">
                            <img src="//www.sy111.com/book/static/images/core/girl1.jpg" class="uPic" />
                            <p class="name">Linda</p>
                            <p class="text">
                            2.儿子很喜欢这本书，天天看，还能看这书 上的图讲出故事 来。儿童阅读是一个积累和探究的过程，犹如成长一样。陪读和伴读，并不是要代替孩子阅读。选书方面也一样，帮孩子把关，而不是父母做主。
                            </p>
                        </div>
                    </li>
                    <li class="sliderItem">
                        <div class="commentItem tc">
                            <img src="//www.sy111.com/book/static/images/core/girl2.jpg" class="uPic" />
                            <p class="name">Linda</p>
                            <p class="text">
                            3.儿子很喜欢这本书，天天看，还能看这书 上的图讲出故事 来。儿童阅读是一个积累和探究的过程，犹如成长一样。陪读和伴读，并不是要代替孩子阅读。选书方面也一样，帮孩子把关，而不是父母做主。
                            </p>
                        </div>
                        <div class="commentItem tc">
                            <img src="//www.sy111.com/book/static/images/core/girl2.jpg" class="uPic" />
                            <p class="name">Linda</p>
                            <p class="text">
                            4.儿子很喜欢这本书，天天看，还能看这书 上的图讲出故事 来。儿童阅读是一个积累和探究的过程，犹如成长一样。陪读和伴读，并不是要代替孩子阅读。选书方面也一样，帮孩子把关，而不是父母做主。
                            </p>
                        </div>
                    </li>
                </ul>
                <div class="sliderNav">
                    <dl>
                    <dd class="sliderNavItem active"></dd>
                    <dd class="sliderNavItem"></dd>
                    </dl>
                </div>
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
<script src="//www.sy111.com/book/static/js/index.js"></script>
</body>
</html>