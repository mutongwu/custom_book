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

    <div class="container adminBalanceCnt">
        <h1 class="tc">结算列表</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form">
                <div class="pure-g">
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">用户ID：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="userId" placeholder="用户ID"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">收款人：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="name" placeholder="收款人"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-3">
                        <div class="ui-form-item">
                            <label class="ui-form-label">汇入银行：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="source" placeholder="汇入银行"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pure-g">
                    <div class="pure-u-1-2">
                        <div class="ui-form-item">
                            <label class="ui-form-label">汇款日期：</label>
                            <div class="ui-form-group">
                                <input class="ui-input j_beginTime" name="beginTime" placeholder="开始时间"/>
                                &nbsp;&nbsp;
                                <input class="ui-input j_endTime" name="endTime" placeholder="结束时间"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">结算状态：</label>
                            <div class="ui-form-group">
                                <select class="ui-select j_balanceStatusSel" name="status">
                                    <option value="" selected>请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                     <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label"></label>
                            <div class="ui-form-group cf">
                                <!--<a href="./balancedetail.jsp" class="ui-button ui-button-yellow fr">+新增汇款记录</a>-->
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
                    <th class="tc">序号</th>
                    <th class="tc">用户ID</th>
                    <th class="tc">汇款日期</th>
                    <th class="tc">汇入银行</th>
                    <th class="tc">账户</th>
                    <th class="tc">收款人</th>
                    <th class="tc">结算金额</th>
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
<tr data-idx="{{$index}}">
    <td>{{item.statementId}}</td>
    <td><p><a href="./memberdetail.jsp?userId={{item.userId}}" target="_blank">{{item.userId}}</a></p></td>
    <td>{{dateFormat(item.statementTime)}}</td>
    <td>{{item.accountNumber}}</td>
    <td>{{item.source}}</td>
    <td>{{item.name}}</td>
    <td>
        <strong class="price">{{priceFormat(item.statementAmount)}}</strong> 元
    </td>
    <td>{{item._statusTxt}}</td>
    <td>
        {{if item.status == 0}}
            <input type="button" class="ui-button j_accept" value="确认" />
        {{else}}
            <input type="button" class="ui-button j_accept" value="更新" />
        {{/if}}
    </td>
</tr>
{{/each}}
</script>
<script src="/js/admin/balance.js"></script>
</body>
</html>