<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container recordCnt">
        <h1 class="tc">返利记录</h1>
    	<div class="tabBox">
            <link rel="import" href="../pub/partial_agency.jsp?__inline">
        </div>
        <div class="recordBox">
            <table class="table table-border-vertical">
                <thead>
                <tr>
                    <th class="tc">日期</th>
                    <th class="tc">订单号</th>
                    <th class="tc">返利金额</th>
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
        {{$value._dateStr}}
    </td>
    <td>
        {{$value.orderNo}}
    </td>
    <td>
        <strong class="price">{{$value.rebateAmount}}</strong> 元
    </td>
    <td>
        {{$value._statusTxt}}
    </td>
</tr>
{{/each}}
</script>
<script src="../js/agency/record.js"></script>
</body>
</html>