<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container accountCnt addressCnt" >
        <h1 class="title tc green">修改密码</h1>
        <div class="ui-tab">
            <ul class="cf">
                <li class="tabItem"><a href="./account.jsp">基本资料</a></li>
                <li class="tabItem active"><a href="./address.jsp">收货地址</a></li>
                <li class="tabItem "><a href="./pwd.jsp">修改密码</a></li>
            </ul>
        </div>
        <div class="contentBox ">
            <div class="bd">
                <div class="ui-form accountForm">
                    <div class="ui-form-item">
                        <label class="ui-form-label">旧密码：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="oldpwd" placeholder="旧密码"/>
                        </div>
                    </div>
                    
                    <div class="ui-form-item">
                        <label class="ui-form-label">新密码：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="newpwd" placeholder="新密码"/>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">确认密码：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="newpwd2" placeholder="再输入新密码"/>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <input type="button" class="ui-button ui-button-L ui-button-yellow" value="提交"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
</body>
</html>