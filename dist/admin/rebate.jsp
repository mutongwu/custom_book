<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    
<meta charset="UTF-8">
<title>书友</title>

    <link type="text/css" rel="stylesheet" href="//www.sy111.com/book/static/pkg/aio.css" />
    <link rel="stylesheet" type="text/css" href="//www.sy111.com/book/css/admin/admin.css" />
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

    <div class="container adminRebateCnt">
        <h1 class="tc">返利列表</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form">
                <div class="pure-g">
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">合作伙伴：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="username" placeholder="合作伙伴"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">订单号：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="orderNo" placeholder="订单号"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">返利状态：</label>
                            <div class="ui-form-group">
                                <select class="ui-select j_rebateStatusSel" name="status">
                                    <option value="" selected>请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pure-g">
                    <div class="pure-u-1-2">
                        <div class="ui-form-item">
                            <label class="ui-form-label">返利日期：</label>
                            <div class="ui-form-group">
                                <input class="ui-input j_beginTime" name="beginTime" placeholder="开始时间"/>
                                &nbsp;&nbsp;
                                <input class="ui-input j_endTime" name="endTime" placeholder="结束时间"/>
                            </div>
                        </div>
                    </div>
                     <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label"></label>
                            <div class="ui-form-group cf">
                                <input type="button" class="ui-button j_queryBtn" value="搜索"/>
                                <a class="ui-button ui-button-yellow fr j_doRebate">提现已勾选</a>
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
                    <th class="tc">序号</th>
                    <th class="tc">订单号</th>
                    <th class="tc">合作伙伴</th>
                    <th class="tc">返利日期</th>
                    <th class="tc">结算金额</th>
                    <th class="tc">状态</th>
                    <th class="tc">操作提现</th>
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
<tr data-id="{{item.rebateDetailId}}">
    <td>{{item.rebateDetailId}}</td>
    <td>{{item.orderNo}}</td>
    <td>{{item.userId}}</td>
    <td>{{dateFormat(item.statementTime)}}</td>
    <td>
        <strong class="price">{{priceFormat(item.rebateAmount)}}</strong> 元
    </td>
    <td>
        {{if item.status == 0}}
        <strong class="red">未提现</strong>
        {{else if item.status == 1}}
        <strong class="green">已提现</strong>
        {{else if item.status == 2}}
        <strong class="yellow">退货退款</strong>
        {{/if}}
    </td>
    <td>
         {{if item.status == 0}}
            <label><input type="checkbox" class="rebateIds" value="{{item.rebateDetailId}}"/>提现</label>
        {{/if}}
    </td>
</tr>
{{/each}}
</script>

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
<script src="//www.sy111.com/book/static/js/admin/rebate.js"></script>
</body>
</html>