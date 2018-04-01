<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
    <link rel="stylesheet" type="text/css" href="./css/admin.css" />
</head>
<body>
<div class="wrapper adminPage">
    <link rel="import" href="../pub/admin/top.jsp?__inline">

    <div class="container adminOrderCnt">
        <h1 class="tc">订单管理</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form pure-g">
                <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">订单号：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="ordersn" placeholder="订单号"/>
                        </div>
                    </div>
                </div>
                <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">商品名：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="product" placeholder="商品名"/>
                        </div>
                    </div>
                </div>
                
                <div class="pure-u-2-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">下单时间：</label>
                        <div class="ui-form-group">
                            <input class="ui-input " name="start" placeholder="开始时间"/>
                            &nbsp;&nbsp;
                            <input class="ui-input ml10" name="end" placeholder="结束时间"/>
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
                            <input class="ui-input" name="receiver" placeholder="收货人"/>
                        </div>
                    </div>
                </div>
                <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label">订单状态：</label>
                        <div class="ui-form-group">
                            <select class="ui-select" name="status">
                                <option>请选择</option>
                            </select>
                        </div>
                    </div>
                </div>
                 <div class="pure-u-1-4">
                    <div class="ui-form-item">
                        <label class="ui-form-label"></label>
                        <div class="ui-form-group">
                            <input type="button" class="ui-button" name="ordersn" value="搜索"/>
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
                <tbody>
                <tr>
                    <td>
                        <a href="./admin/orderdetail.html">234567</a>
                    </td>
                    <td>
                        张三
                    </td>
                    <td>
                        李四
                    </td>
                    <td class="tl">
                        <p><a href="./book/preview.html">zhangsan 《找朋友-张三的神奇之旅》</a></p>
                        <p><a href="./book/preview.html">lisi 《找朋友-李四的神奇之旅》</a></p>
                    </td>
                    <td>
                        <strong class="price">345元</strong>
                    </td>
                    <td>
                        2016-12-21 11:22
                    </td>
                    <td>
                        <strong class="red">未支付</strong>
                    </td>
                    <td>
                        <input type="button" class="ui-button" value="取消" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="./admin/orderdetail.html">234567</a>
                    </td>
                    <td>
                        张三
                    </td>
                    <td>
                        李四
                    </td>
                    <td class="tl">
                        <p><a href="./book/preview.html">zhangsan 《找朋友-张三的神奇之旅》</a></p>
                        <p><a href="./book/preview.html">lisi 《找朋友-李四的神奇之旅》</a></p>
                    </td>
                    <td>
                        <strong class="price">345元</strong>
                    </td>
                    <td>
                        2016-12-21 11:22
                    </td>
                    <td>
                        <strong class="red">未支付</strong>
                    </td>
                    <td>
                        <input type="button" class="ui-button" value="发货" />
                        <input type="button" class="ui-button ui-button-yellow" value="删除" />
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="pageBox" id="j_pageBox">

            </div>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="../js/admin/order.js"></script>
</body>
</html>