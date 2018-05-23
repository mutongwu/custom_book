<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container contactFormCnt" >
        <h1 class="title tc green">联系方式</h1>
        <div class="ui-tab">
            <ul class="cf">
                <li class="tabItem"><a href="./account.jsp">基本资料</a></li>
                <li class="tabItem active"><a href="./contact.jsp">联系方式</a></li>
                <li class="tabItem "><a href="./address.jsp">收货地址</a></li>
                <li class="tabItem "><a href="./pwd.jsp">修改密码</a></li>
            </ul>
        </div>
        <div class="contentBox ">
            <div class="bd">
                <div id="j_concactFormBox"></div>
            </div>
        </div>
    </div>
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/javascript" src="/js/profile/contact.js"></script>
</body>
</html>