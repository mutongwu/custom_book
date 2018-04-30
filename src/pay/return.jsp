<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline" />
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container payCnt">
        <div class="success none">
            <h1 class="tc">恭喜！订单已支付成功</h1>
            <div class="orderInfo tc">
                <a class="ui-button ui-button-yellow ui-button-XL"  href="@ROOT_PATH/order/orderdetail.jsp?orderId=${orderId}">查看订单</a>
                <a class="ui-button ui-button-green ui-button-XL"  href="@ROOT_PATH/index.jsp">返回首页</a>
            </div>
        </div>
        <div class="fail  none">
            <h1 class="tc">订单支付失败！</h1>
        </div>
    </div><!-- END container-->
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script>
    $(function(){
        //验证支付结果,true/false
        var signVerified=${signVerified};

        //商户订单号
        var out_trade_no="${out_trade_no}";

        //支付宝交易号
        var trade_no="${trade_no}";

        //付款金额
        var total_amount="${total_amount}";
        if(signVerified){
            $('.success').removeClass('none');
        }else{
            $('.fail').removeClass('none');
        }
    })
</script>
</body>
</html>