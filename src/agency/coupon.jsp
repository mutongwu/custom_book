<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container couponCodeCnt">
        <h1 class="tc">优惠码</h1>
    	<div class="tabBox">
            <link rel="import" href="../pub/partial_agency.jsp?__inline">
        </div>
        <div class="j_couponInfoBox">

        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="couponInfoTpl">
{{if level}}
    <h1 class="green tc">您是<span class="type">
         {{if level == 1}}
            个人代理
        {{else if level == 2}}
            网店合作伙伴
        {{else}}
            实体店合作伙伴
        {{/if}}
    </span>，优惠码为：<span class="num red">{{couponNo}}</span></h1>
    <div class="agencyIntro">
        {{if level == 1}}
        <p>用户订购产品时，输入优惠码结算，结算价可优惠5%；赶紧告诉您的朋友吧。同时，您将获得5%的返利！长期可获得收益哦！</p>
        {{else if level == 2}}
        <p>用户订购产品时，输入优惠码结算，结算价可优惠5%；赶紧去推广吧。同时，您将获得10%的返利！长期可获得收益哦！</p>
        {{else}}
        <p>用户订购产品时，输入优惠码结算，结算价可优惠5%；赶紧去推广吧。同时，您将获得15%的返利！长期可获得收益哦！</p>
        {{/if}}
    </div>
{{else}}    
    <h1 class="red tc">赶快申请成为代理吧！</h1>
{{/if}}
<div class="btnBox fs18 tc">
    <div class="applyType">
        <a class="ui-button ui-button-L ui-button-yellow j_applyLink" href="./apply.jsp?level=1">个人代理</a>
        <p class="green">人人都可以申请</p>
    </div>
    <div class="applyType">
        <a class="ui-button ui-button-L ui-button-yellow j_applyLink" href="./apply.jsp?level=2">网店代理</a>
        <p class="green">要求有网络店铺</p>
    </div>
    <div class="applyType">
        <a class="ui-button ui-button-L ui-button-yellow j_applyLink" href="./apply.jsp?level=3">实体店代理</a>
        <p class="green">要求有实体店铺</p>
    </div>
</div>
</script>
<script src="/js/agency/coupon.js"></script>
</body>
</html>