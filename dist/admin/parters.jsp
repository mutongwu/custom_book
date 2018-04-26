<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    
<meta charset="UTF-8">
<title>书友</title>

    <link type="text/css" rel="stylesheet" href="/book/static/pkg/aio.css" />
    <link rel="stylesheet" type="text/css" href="./css/admin.css" />
</head>
<body>
<div class="wrapper adminPage">
    <%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!-- 公共顶部 -->
<div class="topNav">
    <div class="userInfo ">
        <div class="bd cf">
            <h1 class="fl logo">书友</h1>
        </div>
    </div>
    <div class="navMenu">
        <div class="bd">
            <ul class="cf">
                <!-- <li class="fl active"><a href="./admin/order.html">首页</a></li> -->
                <li class="fl active"><a href="./admin/order.html">订单管理</a></li>
                <li class="fl"><a href="./admin/member.html">会员管理</a></li>
                <li class="fl"><a href="./admin/parters.html">合作伙伴管理</a></li>
                <li class="fl last"><a href="./admin/balance.html">结算列表</a></li>
                <!-- <li class="fr quickBtn">
                    <a href="./addBook.html">添加图书</a>
                    <a href="./pubBook.html">上架图书</a>
                </li> -->
            </ul>
        </div>
    </div>
</div>
<!-- END:公共顶部 -->

    <div class="container adminPartersCnt">
        <h1 class="tc">合作伙伴管理</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form">
                <div class="pure-g">
                    <div class="pure-u-3-24">
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">用户名：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="username" placeholder="订单号"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">店铺名：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="shopname" placeholder="店铺名"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">状态：</label>
                            <div class="ui-form-group">
                                <select class="ui-select" name="status">
                                    <option>请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pure-g">
                    <div class="pure-u-3-24">
                    </div>
                    <div class="pure-u-2-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">所在地区：</label>
                            <div class="ui-form-group">
                                <select class="ui-select" name="province">
                                    <option>请选择省份</option>
                                </select>
                                &nbsp;&nbsp;
                                <select class="ui-select" name="city">
                                    <option>请选择城市</option>
                                </select>
                                &nbsp;&nbsp;
                                <select class="ui-select" name="city">
                                    <option>请选择区县</option>
                                </select>
                            </div>
                        </div>
                    </div>
                     <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label"></label>
                            <div class="ui-form-group">
                                <input type="button" class="ui-button" value="搜索"/>
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
                    <th class="tc">提交人</th>
                    <th class="tc">类型</th>
                    <th class="tc">所在城市</th>
                    <th class="tc">申请时间</th>
                    <th class="tc">状态</th>
                    <th class="tc">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <a href="./admin/parterdetail.html">234567</a>
                    </td>
                    <td>
                        张三
                    </td>
                    <td>
                        个人
                    </td>
                    <td class="tl">
                        山东青岛
                    </td>
                    <td>
                        这是店铺名称
                    </td>
                    <td>
                        2016-12-21 11:22:10
                    </td>
                    <td>
                        未审核
                    </td>
                    <td>
                        <input type="button" class="ui-button" value="审核通过" />
                        <input type="button" class="ui-button ui-button-yellow" value="不通过" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="./admin/parterdetail.html">123</a>
                    </td>
                    <td>
                        张三
                    </td>
                    <td>
                        实体店
                    </td>
                    <td class="tl">
                        山东青岛
                    </td>
                    <td>
                        这是店铺名称2
                    </td>
                    <td>
                        2016-12-21 11:22:10
                    </td>
                    <td>
                        不通过
                    </td>
                    <td>
                        <input type="button" class="ui-button" value="审核通过" />
                    </td>
                </tr>
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

<script>
	var GlobalData = {
		"rootPath" :'/book/',
		"userId" : "${userId}"
	};
</script>
<script src="/book/static/pkg/aio.js"></script>
<script src="/book/static/js/admin/parters.js"></script>
</body>
</html>