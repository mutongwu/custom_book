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

    <div class="container  agencyCnt adminAgencyDetailCnt">
        <h1 class="tc">合作伙伴申请资料</h1>
        <div class="agencyBox tc">
            
            <form class="ui-form agencyInfoForm tl">
                <div class="j_agencySection"></div>
                <div class="j_agencyAccountSection"></div>
                
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
<script type="text/html" id="agencyTpl">
    <div class="ui-form-item">
        <label class="ui-form-label">代理类型：</label>
        <div class="ui-form-group">
            <strong class="red">
                {{if partnerInfoVo.level == 1}}
                    个人代理
                {{else if partnerInfoVo.level == 2}}
                    网店代理
                {{else if partnerInfoVo.level == 3}}
                    实体店代理
                {{/if}}
            </strong>
        </div>
    </div>
    <p class="sectionTitle">合作伙伴信息：</p>
    {{if partnerInfoVo.level == 1}}
    <div class="ui-form-item">
        <label class="ui-form-label">代理人姓名：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.name}}</p>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">代理人地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.province}}{{partnerInfoVo.city}}{{partnerInfoVo.county}}{{partnerInfoVo.address}}</p>
        </div>
    </div>
    {{else}}

    <div class="ui-form-item">
        <label class="ui-form-label">店铺名称：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.name}}</p>
        </div>
    </div>

    <div class="ui-form-item">
        <label class="ui-form-label">店铺地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.province}}{{partnerInfoVo.city}}{{partnerInfoVo.county}}{{partnerInfoVo.address}}</p>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">网店地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.shopURL}}</p>
        </div>
    </div>                
    <div class="ui-form-item">
        <label class="ui-form-label">官网地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.webSiteURL}}</p>
        </div>
    </div>
    
    <div class="ui-form-item">
        <label class="ui-form-label">店铺资料：</label>
        <div class="ui-form-group">
            <p class="ui-text">
                {{each picInfoVoList }}
                    <img src="/book/u/s.do?attachmentId={{$value.attachmentId}}" class="pic"/>
                {{/each}}
            </p>
        </div>
    </div>

    {{/if}}
    <p class="sectionTitle">联系人信息：</p>
    <div class="j_contactBox">
            
        <div class="ui-form-item">
            <label class="ui-form-label">联系人姓名：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contact}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系人地址：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactProvince}}{{partnerInfoVo.contactCity}}
                    {{partnerInfoVo.contactCounty}}{{partnerInfoVo.contactAddress}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系手机：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactMobile}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系电话：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactTelephone}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系QQ：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactQQ}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系电子邮箱：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactEMail}}</p>
            </div>
        </div>
    </div><!--contactBox -->
</script>
<script type="text/html" id="agencyAccountTpl">
<p class="sectionTitle">银行信息：</p>
<div>    
    <div class="ui-form-item">
        <label class="ui-form-label">开户行：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{source}}</p>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">账户：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{accountNumber}}</p>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">姓名：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{name}}</p>
        </div>
    </div>
<div>
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
<script src="//www.sy111.com/book/static/js/admin/agencydetail.js"></script>
</body>
</html>