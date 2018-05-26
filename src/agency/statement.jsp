<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container statementCnt">
        <h1 class="tc">结算记录</h1>
    	<div class="tabBox">
            <link rel="import" href="../pub/partial_agency.jsp?__inline">
        </div>
        <div class="statementBox">
            <table class="table table-border-vertical">
                <thead>
                <tr>
                    <th class="tc">记录ID</th>
                    <th class="tc">日期</th>
                    <th class="tc">开户行</th>
                    <th class="tc">姓名</th>
                    <th class="tc">提现金额</th>
                    <th class="tc">备注</th>
                    <th class="tc">状态</th>
                </tr>
                </thead>
                <tbody class="j_dataTBody">
                </tbody>
            </table>
            <div class="pageBox" id="j_pageBox">

            </div>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="recordTpl">
{{each data}}
<tr>
    <td>
        {{$value.statementId}}
    </td>
    <td>
        {{dateFormat($value.statementTime)}}
    </td>
    <td>{{$value.source}}</td>
    <td>{{$value.name}}</td>
    <td>
        <strong class="price">{{$value.statementAmount}}</strong> 元
    </td>
    <td>{{$value.comment}}</td>
    <td>
        {{$value._statusTxt}}
    </td>
</tr>
{{/each}}
</script>
<script src="../js/agency/statement.js"></script>
</body>
</html>