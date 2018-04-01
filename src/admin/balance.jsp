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

    <div class="container adminBalanceCnt">
        <h1 class="tc">结算列表</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form">
                <div class="pure-g">
                    <div class="pure-u-3-24">
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">合作伙伴：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="username" placeholder="合作伙伴"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">收款人：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="mobile" placeholder="收款人"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">汇入银行：</label>
                            <div class="ui-form-group">
                                <select class="ui-select" name="bank">
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
                            <label class="ui-form-label">汇款日期：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="start" placeholder="开始时间"/>
                                &nbsp;&nbsp;
                                <input class="ui-input" name="end" placeholder="结束时间"/>
                            </div>
                        </div>
                    </div>
                     <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label"></label>
                            <div class="ui-form-group cf">
                                <a href="./admin/balancedetail.html" class="ui-button ui-button-yellow fr">+新增汇款记录</a>
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
                    <th class="tc">合作伙伴</th>
                    <th class="tc">收款人</th>
                    <th class="tc">汇款日期</th>
                    <th class="tc">汇入银行</th>
                    <th class="tc">结算金额</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        12345
                    </td>
                    <td>
                        张三
                    </td>
                    <td>
                        张三2
                    </td>
                    <td >
                        2017-01-02
                    </td>
                    <td>
                        中国银行
                    </td>
                    <td>
                        <strong class="price">123</strong> 元
                    </td>
                </tr>
                <tr>
                   <td>
                        12345
                    </td>
                    <td>
                        张三
                    </td>
                    <td>
                        张三2
                    </td>
                    <td >
                        2017-01-02
                    </td>
                    <td>
                        中国银行
                    </td>
                    <td>
                        <strong class="price">123</strong> 元
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
<script src="../js/admin/balance.js"></script>
</body>
</html>