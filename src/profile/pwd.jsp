<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container modifyPwdCnt" >
        <h1 class="title tc green">修改密码</h1>
        <div class="ui-tab">
            <ul class="cf">
                <li class="tabItem"><a href="./account.jsp">基本资料</a></li>
                <li class="tabItem "><a href="./address.jsp">收货地址</a></li>
                <li class="tabItem active"><a href="./pwd.jsp">修改密码</a></li>
            </ul>
        </div>
        <div class="contentBox ">
            <div class="bd">
                <div class="ui-form modifyPwdForm">
                    <div class="ui-form-item">
                        <label class="ui-form-label">旧密码：</label>
                        <div class="ui-form-group">
                            <input type="password" required maxlength="16" minlength="6" class="ui-input" name="oldUserPwd" placeholder="旧密码"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    
                    <div class="ui-form-item">
                        <label class="ui-form-label">新密码：</label>
                        <div class="ui-form-group">
                            <input type="password" required maxlength="16" minlength="6"  class="ui-input" name="userPwd" placeholder="新密码"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">确认密码：</label>
                        <div class="ui-form-group">
                            <input type="password" required maxlength="16" minlength="6" class="ui-input" name="userPwd2" placeholder="再输入新密码"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <input type="button" class="ui-button ui-button-L ui-button-yellow" value="提交" id="j_submit" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/javascript" src="/js/profile/modifypwd.js"></script>
</body>
</html>