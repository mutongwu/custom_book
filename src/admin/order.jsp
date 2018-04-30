<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
    <link rel="stylesheet" type="text/css" href="/css/admin/order.scss" />
</head>
<body>
<div class="wrapper adminPage">
    <link rel="import" href="/pub/admin/top.jsp?__inline">

    <div class="container adminOrderCnt">
        <h1 class="tc">订单管理</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form pure-g">
                <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">订单号：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="orderNo" placeholder="订单号"/>
                        </div>
                    </div>
                </div>
                <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">商品名：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="summary" placeholder="商品名"/>
                        </div>
                    </div>
                </div>
                
                <div class="pure-u-2-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">下单时间：</label>
                        <div class="ui-form-group">
                            <input class="ui-input j_beginTime" name="beginTime" placeholder="开始时间"/>
                            &nbsp;&nbsp;
                            <input class="ui-input ml10 j_endTime" name="endTime" placeholder="结束时间"/>
                        </div>
                    </div>
                </div>
                
                <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">下单人：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="username" placeholder="下单人"/>
                        </div>
                    </div>
                </div>
                <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">收货人：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="name" placeholder="收货人"/>
                        </div>
                    </div>
                </div>
                <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">订单状态：</label>
                        <div class="ui-form-group">
                            <select class="ui-select j_orderStatusSel" name="status">
                                <option value="" selected>请选择</option>
                            </select>
                        </div>
                    </div>
                </div>
                 <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label"></label>
                        <div class="ui-form-group">
                            <input type="button" class="ui-button j_queryBtn" value="搜索"/>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="orderData fs16">
            <table class="table table-border-vertical">
                <thead>
                <tr>
                    <th class="tc">订单号</th>
                    <th class="tc">下单人</th>
                    <th class="tc">收货人</th>
                    <th class="tl">订购的产品</th>
                    <th class="tc">总金额</th>
                    <th class="tc">下单时间</th>
                    <th class="tc">订单状态</th>
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

    <link rel="import" href="/pub/copyright.jsp?__inline">
</div>

<script type="text/html" id="orderTpl">
{{each list as item}}
<tr data-orderid="{{item.orderId}}" data-orderno="{{item.orderNo}}">
    <td>
        <a href="./orderdetail.jsp?orderId={{item.orderId}}">{{item.orderNo}}</a>
    </td>
    <td>
        <p><a>{{item.userId}}</a></p>
    </td>
    <td>
        <p>{{item.name}}</p>
    </td>
    <!--<td>
        <p>{{item.province}}{{item.city}}{{item.county}}{{item.address}}</p>
    </td>-->
    <td class="tl">
        <p>{{item.summary}}</p>
    </td>
    <td>
        <strong class="price">{{priceFormat(item.statementPrice)}}元</strong>
    </td>
    <td>
        {{dateFormat(item.createTime)}}
    </td>
    <td>
        {{if item.status == 0}}
        <strong class="red">未支付</strong>
        {{else if item.status == 1}}
        <strong class="green">已支付</strong>
        {{else if item.status == 2}}
        <strong class="yellow">制作中</strong>
        {{else if item.status == 3}}
        <strong class="yellow">已发货</strong>
        {{else if item.status == 4}}
        <strong class="green">交易成功</strong>
        {{else if item.status == -3}}
        <strong class="red">订单取消</strong>
         {{else if item.status == -2}}
        <strong class="red">订单作废</strong>
        {{else if item.status == -1}}
        <strong class="red">退货退款</strong>
        {{/if}}
    </td>
    <td>
        {{if item.status == 0}}
            <input type="button" class="ui-button j_cancelOrder" value="取消" />
        {{else if ['1'].indexOf(item.status) !== -1}}
            <input type="button" class="ui-button j_acceptOrder" value="确认订单" />
            <input type="button" class="ui-button j_refundOrder" value="退货退款" />
        {{else if ['2'].indexOf(item.status) !== -1}}
            <input type="button" class="ui-button j_sendGoods" value="发货" />
        {{else if ['3'].indexOf(item.status) !== -1}}
            <input type="button" class="ui-button j_sendGoods" value="更改发货单" />
        {{/if}}
    </td>
</tr>
{{/each}}
</script>
<script type="text/html" id="logisticsTpl">
<form class="ui-form logisticsForm">
    <div class="ui-form-item">
        <label class="ui-form-label">物流公司：</label>
        <div class="ui-form-group">
            <input required="required" class="ui-input" name="logisticsCompany" placeholder="物流公司" maxlength="32"/>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">物流单号：</label>
        <div class="ui-form-group">
            <input type="text" required="required" class="ui-input" name="trackingNumber" placeholder="物流单号"  maxlength="32"/>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">备注：</label>
        <div class="ui-form-group">
            <input type="text" class="ui-input" name="note" placeholder="备注"/>
        </div>
    </div>
</form>    
</script>
<script src="/js/admin/order.js"></script>
</body>
</html>