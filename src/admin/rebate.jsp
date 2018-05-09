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

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="itemTpl">
{{each list as item}}
<tr data-id="{{item.rebateDetailId}}">
    <td>{{item.rebateDetailId}}</td>
    <td>{{item.orderNo}}</td>
    <td>
        <p><a href="./memberdetail.jsp?userId={{item.userId}}" target="_blank">{{item.userId}}</a></p>
    </td>
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
<script src="/js/admin/rebate.js"></script>
</body>
</html>