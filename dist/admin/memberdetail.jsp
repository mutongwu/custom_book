<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    
<meta charset="UTF-8">
<title>书友</title>

    <link type="text/css" rel="stylesheet" href="//www.sy111.com/book/static/pkg/aio.css" />
    <link rel="stylesheet" type="text/css" href="//www.sy111.com/book/static/css/admin/admin.css" />
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
                <li class="fl"><a href="./order.jsp" class="link">订单管理</a></li>
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

    <div class="container  adminUserDetailCnt">
        <h1 class="tc">用户信息详情</h1>
        <div class="userDetailBox tc">
            
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
<script type="text/html" id="userTpl">

<form class="ui-form userDetailForm  pure-g tl">
<div class="pure-u-1-3">
    <div class="ui-form-item">
        <label class="ui-form-label">用户ID：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.userId}}</p>
        </div>
    </div>
</div>
<div class="pure-u-1-3">    
    <div class="ui-form-item">
        <label class="ui-form-label">用户名：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.userName}}</p>
        </div>
    </div>
</div>    

<div class="pure-u-1-3">    
    <div class="ui-form-item">
        <label class="ui-form-label">角色：</label>
        <div class="ui-form-group">
            {{if userVo.role == 0}}
            <p class="ui-text green">普通会员</p>
            {{else}}
            <p class="ui-text yellow">管理员</p>
            {{/if}}
        </div>
    </div>
</div>    

<div class="pure-u-1-3">    
    <div class="ui-form-item">
        <label class="ui-form-label">状态：</label>
        <div class="ui-form-group">
            {{if userVo.status == 0}}
            <p class="ui-text red">无效</p>
            {{else}}
            <p class="ui-text green">有效</p>
            {{/if}}
        </div>
    </div>
</div>     

<div class="pure-u-1-3">       
    <div class="ui-form-item">
        <label class="ui-form-label">邮箱：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.email}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">手机：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.mobile}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">性别：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.gender == '1'? '男':'女'}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">头像：</label>
        <div class="ui-form-group">
            <p class="ui-text"> <img src="/book/u/s.do?attachmentId={{userInfoVo.attachmentId}}" class="pic"/></p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userInfoVo.province}}{{userInfoVo.city}}{{userInfoVo.county}}{{userInfoVo.address}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">昵称：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userInfoVo.nickname}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">个性签名：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userInfoVo.signature}}</p>
        </div>
    </div>

</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">注册来源：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userInfoVo.source}}</p>
        </div>
    </div>    

    </div>        
</form>    
</script>

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
<script src="//www.sy111.com/book/static/js/admin/memberdetail.js"></script>
</body>
</html>