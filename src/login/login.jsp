<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top_unlogin.jsp?__inline">

    <div class="container loginCnt" >
        <h1 class="title tc green">登录</h1>
        <div class="contentBox ">
            <div class="thirdLoginBox">
                <p class="tc"><a href="https://api.weibo.com/oauth2/authorize?client_id=1260913599&response_type=code&with_offical_account=1&redirect_uri=http%3A%2F%2Fwww.sy111.com%2Fbook%2Flogin%2Fweibo.do" class="thirdLogin wb"></a></p>
                <p class="tc"><a href="https://graph.qq.com/oauth2.0/authorize?client_id=101473782&response_type=code&redirect_uri=http%3A%2F%2Fwww.sy111.com%2Fbook%2Flogin%2Fqq.do%3FfowardURL%3Dhttp%3A%2F%2Fwww.sy111.com%2Fbook" class="thirdLogin qq"></a></p>
				<p class="tc"><a href="https://open.weixin.qq.com/connect/qrconnect?appid=wxad7fc562739cab87&response_type=code&redirect_uri=http%3A%2F%2Fwww.sy111.com%2Fbook%2Flogin%2Fweixin.do%3Fclient%3Dpc%26fowardURL%3Dhttp%3A%2F%2Fwww.sy111.com%2Fbook&scope=snsapi_login" class="thirdLogin wx"></a></p>
                <p class="tip tc">或者用本站账号登录</p>
            </div>
            <div class="formBox tc">
                <form class="ui-form loginForm">
                    <div class="ui-form-item">
                        <label class="ui-form-label">账号：</label>
                        <div class="ui-form-group">
                            <input required="required" class="ui-input" name="login" placeholder="邮箱/手机号/用户名"/>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">密码：</label>
                        <div class="ui-form-group">
                            <input type="password" required="required" class="ui-input" name="userPwd" placeholder="密码"/>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <label><input type="checkbox" class="ui-checkbox" name="remember" />记住密码</label>
                            <a class="forget fs12" href="./findPwd.jsp">忘记密码？</a>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <input type="button" class="ui-button ui-button-yellow   ui-button-XL" value="登录" id="j_submit" />
                        </div>
                    </div>
                    <div class="ui-form-item registTip">
                        <label class="ui-form-label">&nbsp;</label>
                        <div class="ui-form-group">
                            <p class="">还没有账号？请<a href="./register.jsp">注册。</a></p>
                        </div>
                    </div>
                </form>
            </div>
            
        </div>
    </div>
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/javascript" src="/js/login/login.js"></script>
</body>
</html>