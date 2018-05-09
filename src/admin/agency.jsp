<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
    <link rel="stylesheet" type="text/css" href="/css/admin/admin.scss" />
</head>
<body>
<div class="wrapper adminPage">
    <link rel="import" href="../pub/admin/top.jsp?__inline">

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

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="itemTpl">
{{each list as item}}
<tr data-id="{{item.partnerInfoId}}" data-uid="{{item.userId}}">
    <td>
        <a href="./agencydetail.jsp?partnerInfoId={{item.partnerInfoId}}" target="_blank">{{item.partnerInfoId}}</a>
    </td>
    <td>
        <p><a href="./memberdetail.jsp?userId={{item.userId}}" target="_blank">{{item.userId}}</a></p>
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
<script src="../js/admin/agency.js"></script>
</body>
</html>