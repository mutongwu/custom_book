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

    <div class="container applyCnt">
        <h1 class="tc">代理申请</h1>
    	<div class="tabBox">
            
<div class="ui-tab mb30">
    <ul class="cf j_agencyTab">
        <li class="tabItem"><a href="./coupon.jsp">优惠码</a></li>
        <li class="tabItem"><a href="./agency.jsp">代理资料</a></li>
        <li class="tabItem"><a href="./record.jsp">返利记录</a></li>
        <li class="tabItem"><a href="./statement.jsp">结算记录</a></li>
        <li class="tabItem"><a href="./mybank.jsp">结算银行</a></li>
    </ul>
</div>
        </div>
        <div class="applyBox tc">
            <form class="ui-form applyForm tl">
                <div class="ui-form-item">
                    <label class="ui-form-label">请选择代理类型：</label>
                    <div class="ui-form-group">
                        <p><label><input type="radio" name="level" class="ui-radio j_typeRadio" value="1" />个人合作伙伴(人人都可以申请)</label></p>
                        <p><label><input type="radio"  name="level" class="ui-radio j_typeRadio" value="2" />网店合作伙伴(要求必须有网店)</label></p>
                        <p><label><input type="radio" name="level"  class="ui-radio j_typeRadio" value="3" />实体店合作伙伴(要求必须有实体店铺)</label></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">代理类型：</label>
                    <div class="ui-form-group">
                        <strong class="red j_typeName">个人代理</strong>
                    </div>
                </div>
                <div class="ui-form-item none">
                    <label class="ui-form-label">状态：</label>
                    <div class="ui-form-group">
                        <strong  class="red j_status">申请中</strong>
                    </div>
                </div>
                <p class="sectionTitle">合作伙伴信息：</p>


                <div class="j_applyLevelBox none" level="1">
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>代理人姓名：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="name" placeholder="代理人姓名"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>代理人地区：</label>
                        <div class="ui-form-group j_distSelect">
                            <select class="ui-select" name="province">
                                <option>请选择省份</option>
                            </select>
                            <select class="ui-select" name="city">
                                <option>请选择城市</option>
                            </select>
                            <select class="ui-select" name="county">
                                <option>请选择区县</option>
                            </select>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                </div>
                <div class="j_applyLevelBox none" level="2">
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>店铺名称：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="name" placeholder="店铺名称" maxlength="32" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>网店地址：</label>
                        <div class="ui-form-group">
                            <input required vtype="url" class="ui-input" name="shopURL" placeholder="网店地址" maxlength="255"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">官网地址：</label>
                        <div class="ui-form-group">
                            <input vtype="url" class="ui-input" name="webSiteURL" placeholder="官网地址" maxlength="255"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>上传店铺资料：</label>
                        <div class="ui-form-group">
                            <div class="uploadBox cf">
                                <div class="uploadItem fl">
                                    <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic1" class="attachmentId" />
                                </div>
                                <div class="uploadItem fl">
                                    <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic2" class="attachmentId" />
                                </div>
                                <div class="uploadItem fl">
                                    <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic3" class="attachmentId" />
                                </div>
                            </div>
                            <p class="ui-field-error">请上传带网店名称的管理后台截图，需要3张图。</p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>店铺所在地区：</label>
                        <div class="ui-form-group j_distSelect">
                            <select required class="ui-select" name="province">
                                <option>请选择省份</option>
                            </select>
                            <select required class="ui-select" name="city">
                                <option>请选择城市</option>
                            </select>
                            <select required class="ui-select" name="county">
                                <option>请选择区县</option>
                            </select>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">店铺地址：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="address" placeholder="详细地址"/>
                        </div>
                    </div>
                </div>
                <div class="j_applyLevelBox none" level="3">
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>店铺名称：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="name" placeholder="店铺名称" maxlength="32" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">网店地址：</label>
                        <div class="ui-form-group">
                            <input required vtype="url"  class="ui-input" name="shopURL" placeholder="网店地址"  maxlength="255" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">官网地址：</label>
                        <div class="ui-form-group">
                            <input vtype="url" class="ui-input" name="webSiteURL" placeholder="官网地址" maxlength="255" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>上传店铺资料：</label>
                        <div class="ui-form-group">
                            <div class="uploadBox cf">
                                <div class="uploadItem fl">
                                    <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic1" class="attachmentId" />
                                    <span class="uploading"></span>
                                </div>
                                <div class="uploadItem fl">
                                    <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic2" class="attachmentId" />
                                    <span class="uploading"></span>
                                </div>
                                <div class="uploadItem fl">
                                    <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                                    <input type="file" name="bytes" class="uploadInput" />
                                    <input type="hidden" name="pic3" class="attachmentId" />
                                    <span class="uploading"></span>
                                </div>
                            </div>
                            <p class="ui-field-error">请上传带店铺名称的实体店照片，需要3张图。</p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label"><em>*</em>店铺所在地区：</label>
                        <div class="ui-form-group j_distSelect">
                            <select required class="ui-select" name="province">
                                <option>请选择省份</option>
                            </select>
                            <select required class="ui-select" name="city">
                                <option>请选择城市</option>
                            </select>
                            <select required class="ui-select" name="county">
                                <option>请选择区县</option>
                            </select>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">店铺地址：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="address" placeholder="详细地址" maxlength="100" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                </div>

                <p class="sectionTitle">联系人信息：</p>
                <div class="j_contactBox">
                    
                
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>联系人姓名：</label>
                    <div class="ui-form-group">
                        <input required class="ui-input" name="contact" placeholder="联系人姓名" maxlength="32" />
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>所在地区：</label>
                    <div class="ui-form-group j_distSelect">
                        <select required class="ui-select" name="contactProvince">
                            <option>请选择省份</option>
                        </select>
                        <select required class="ui-select" name="contactCity">
                            <option>请选择城市</option>
                        </select>
                        <select required class="ui-select" name="contactCounty">
                            <option>请选择区县</option>
                        </select>
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">详细地址：</label>
                    <div class="ui-form-group">
                        <input maxlength="100" class="ui-input" name="contactAddress" placeholder="详细地址"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>联系手机：</label>
                    <div class="ui-form-group">
                        <input required vtype="phone" class="ui-input" name="contactMobile" placeholder="联系手机"/>
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系电话：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="contactTelephone" placeholder="联系电话" maxlength="16" />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系QQ：</label>
                    <div class="ui-form-group">
                        <input vtype="num" class="ui-input" name="contactQQ" placeholder="联系QQ" maxlength="16" minlength="5" />
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系电子邮箱：</label>
                    <div class="ui-form-group">
                        <input vtype="email" class="ui-input" name="contactEMail" placeholder="联系电子邮箱" maxlength="50"/>
                        <p class="ui-field-error"></p>
                    </div>
                </div>
            </div><!--contactBox -->
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button-XL ui-button-yellow" value="提交申请" id="j_submit" />
                    </div>
                </div>
            </form>
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
		"userName":"${userMap.userName}",
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


	$(function(){
		if(/\/(\w+)\.jsp/.test(location.href)){
			var p = RegExp.$1;
			$('.j_agencyTab').find('a[href*="' + p + '"]').closest('.tabItem').addClass('active');
		}
	})
</script>
<script src="//www.sy111.com/book/static/js/agency/apply.js"></script>
</body>
</html>