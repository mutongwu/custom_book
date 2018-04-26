<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    
<meta charset="UTF-8">
<title>书友</title>

    <link type="text/css" rel="stylesheet" href="//www.sy111.com/book/static/pkg/aio.css" />
    <link rel="stylesheet" type="text/css" href="./css/admin.css" />
</head>
<body>
<div class="wrapper adminPage">
    
<!-- 公共顶部 -->
<div class="topNav" id="j_topNav">
    <div class="userInfo j_userInfo">
        <div class="bd cf">
            <h1 class="fl logo">书友</h1>
            <div class="fr userEntry">
                <div class="userBox fl">
                    <img src="//www.sy111.com/book/static/images/user.jpg" class="pic j_headPic" />
                    <span class="userName j_userName"></span>
                </div>
                <a  class="j_logout">退出</a>
            </div>
        </div>
    </div>
    <div class="navMenu">
        <div class="bd">
            <ul class="cf">
                <li class="fl active"><a href="./order.jsp" class="link">订单管理</a></li>
                <li class="fl"><a href="./member.jsp"  class="link">会员管理</a></li>
                <li class="fl"><a href="./agency.jsp"  class="link">合作伙伴管理</a></li>
                <li class="fl"><a href="./rebate.jsp" class="link">返利列表</a></li>
                <li class="fl"><a href="./balance.jsp" class="link">结算列表</a></li>
                 <li class="fr quickBtn">
                    <a href="/book/index.jsp">定制书首页</a>
                </li> 
            </ul>
        </div>
    </div>
</div>
<!-- END:公共顶部 -->

    <div class="container applyCnt adminParterCnt">
        <h1 class="tc">代理资料</h1>
        <div class="applyBox tc">
            <form class="ui-form applyForm tl">
                <div class="pure-g mb30">
                    <div class="pure-u-1-4">
                        <label>序号：</label><span>12345</span>
                    </div>    
                    <div class="pure-u-1-4">
                        <label>提交人：</label><span>张三</span>
                    </div>
                    <div class="pure-u-2-4">
                        <label>申请时间：</label><span>2016-09-08 12:12:11</span>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">代理类型：</label>
                    <div class="ui-form-group">
                        <strong class="red">网店代理</strong>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">状态：</label>
                    <div class="ui-form-group">
                        <strong  class="green">申请中</strong>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 店铺名称：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="shopname" placeholder="店铺名称" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 网店地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="shopurl" placeholder="网店地址" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">官网地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="site" placeholder="官网地址" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 上传店铺资料：</label>
                    <div class="ui-form-group">
                        <div class="uploadBox cf">
                            <div class="uploadItem fl">
                                <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                            </div>
                            <div class="uploadItem fl">
                                <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                            </div>
                            <div class="uploadItem fl">
                                <img src="//www.sy111.com/book/static/images/core/boy1.jpg" class="pic" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 所在城市：</label>
                    <div class="ui-form-group">
                        <select class="ui-select" name="province">
                            <option>请选择省份</option>
                        </select>
                        <select class="ui-select" name="province">
                            <option>请选择城市</option>
                        </select>
                        <select class="ui-select" name="province">
                            <option>请选择区县</option>
                        </select>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 详细地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="address" placeholder="详细地址" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 联系人：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="contact" placeholder="联系人" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 联系手机：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="mobilePhone" placeholder="联系手机" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系电话：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="telphone" placeholder="联系电话" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系邮箱：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="email" placeholder="联系邮箱：" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系QQ：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="qq" placeholder="联系QQ：" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button ui-button" value="审核通过" readonly />
                        <input type="button" class="ui-button ui-button ui-button-yellow" value="审核不通过" readonly />
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
		"type":"${userMap.role}"
	};
</script>
<script src="//www.sy111.com/book/static/pkg/aio.js"></script>
<script>
    $(function(){
        var url = document.location.href;
        var page = null;
        if(/\/(\w+)\.jsp/.test(url)){
            page = RegExp.$1;
        }
        $('.topNav .link').filter('[href*='+page+']').closest('li').addClass('active').siblings().removeClass('active');
    });


    $(function(){
        App.ajax({
            data: {
                'call': 'user.getUserInfo'
            }
        }).done(function(json){
            if(json && json.userId){
                App.User = json;
                var $box = $('#j_topNav .j_userInfo');
                $box.find('.j_userName').text(json.nickname || '书友管理员');
                json.attachmentId && $box.find('.j_headPic').attr('src', '/book/u/s.do?attachmentId=' + json.attachmentId);
            }
        });
        $('.j_logout').on('click',function(){
            Cookies.remove('onlineId',{path:'/',domain:'.sy111.com'});
            Cookies.remove('user',{path:'/',domain:'.sy111.com'});
            App.linkTo('/index.jsp');
        });
    });
</script>
<script src="//www.sy111.com/book/static/js/agency/agency.js"></script>
</body>
</html>