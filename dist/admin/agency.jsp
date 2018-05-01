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

    <div class="container adminAgencyCnt">
        <h1 class="tc">合作伙伴管理</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form">
                <div class="pure-g">
                    
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">代理名称：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="name" placeholder="代理名称/店铺名"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">联系人：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="contact" placeholder="联系人"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">状态：</label>
                            <div class="ui-form-group">
                                <select class="ui-select j_agencyStatus" name="status">
                                    <option value="" selected>请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pure-g">
                    <div class="pure-u-10-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label">所在地区：</label>
                            <div class="ui-form-group j_distinctSelect">
                                <select class="ui-select" name="province">
                                    <option>请选择省份</option>
                                </select>
                                &nbsp;&nbsp;
                                <select class="ui-select" name="city">
                                    <option>请选择城市</option>
                                </select>
                                &nbsp;&nbsp;
                                <select class="ui-select" name="county">
                                    <option>请选择区县</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-10-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label">申请时间：</label>
                            <div class="ui-form-group">
                                <input class="ui-input timeInput j_beginTime" name="beginTime" placeholder="开始时间"/>
                                &nbsp;&nbsp;
                                <input class="ui-input timeInput ml10 j_endTime" name="endTime" placeholder="结束时间"/>
                            </div>
                        </div>
                    </div>
                     <div class="pure-u-2-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label"></label>
                            <div class="ui-form-group">
                                <input type="button" class="ui-button j_queryBtn" value="搜索"/>
                            </div>
                        </div>
                    </div>
                </div>
                
            </form>
        </div>
        <div class="orderData ">
            <table class="table table-border-vertical">
                <thead>
                <tr>
                    <th class="tc">申请ID</th>
                    <th class="tc">用户ID</th>
                    <th class="tc">代理名称</th>
                    <th class="tc">类型</th>
                    <th class="tc">所在城市</th>
                    <th class="tc">申请时间</th>
                    <th class="tc">状态</th>
                    <th class="tc">操作</th>
                </tr>
                </thead>
                <tbody class="j_tbdBox">
                </tbody>
            </table>
            <div class="pageBox" id="j_pageBox">

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
<script type="text/html" id="itemTpl">
{{each list as item}}
<tr data-id="{{item.partnerInfoId}}" data-uid="{{item.userId}}">
    <td>
        <a href="./agencydetail.jsp?partnerInfoId={{item.partnerInfoId}}" target="_blank">{{item.partnerInfoId}}</a>
    </td>
    <td>
        <a>{{item.userId}}</a>
    </td>
    <td>
        {{item.name}}
    </td>
    <td>
        {{if item.level == 1}}
            <span>个人</span>
        {{else if item.level == 2}}
            <span>网店</span>
        {{else}}
            <span>实体店</span>
        {{/if}}
    </td>
    <td class="tl">
        {{item.province}}{{item.city}}{{item.county}}
    </td>
    <td>
        {{dateFormat(item.applyTime)}}
    </td>
    <td>
        {{if item.status == -2}}
        <span class="red">停止合作</span>
        {{else if item.status == -1}}
        <span class="red">不通过</span>
        {{else if item.status == 0}}
        <span class="yellow">待审核</span>
        {{else}}
        <span class="green">审核通过</span>
        {{/if}}
    </td>
    <td>
        {{if item.status == 0}}
            <input type="button" class="ui-button j_accept" value="审核通过" />
            <input type="button" class="ui-button ui-button-yellow j_deny" value="不通过" />
        {{else if item.status == 1}}
            <input type="button" class="ui-button ui-button-red j_lock" value="停止合作" />
        {{/if}}
    </td>
</tr>
{{/each}}
</script>
<script type="text/html" id="popFormTpl">
<form class="ui-form popForm">
    <div class="ui-form-item">
        <label class="ui-form-label">审核意见：</label>
        <div class="ui-form-group">
            <textarea class="ui-textarea" name="reviewInfo" id="" cols="30" rows="10"  placeholder="审核意见" maxlength="32"></textarea>
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
		"username":"${userMap.username}",
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
<script src="//www.sy111.com/book/static/js/admin/agency.js"></script>
</body>
</html>