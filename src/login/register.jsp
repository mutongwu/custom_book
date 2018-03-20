<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container registerCnt" >
        <h1 class="title tc green">注册</h1>
        <div class="contentBox tc">

            <form class="ui-form registerForm tl">
                <div class="ui-tab">
                    <ul class="cf">
                        <li class="tabItem active" type="phone"><a href="javascript:;">手机注册</a></li>
                        <li class="tabItem"><a href="javascript:;">邮箱注册</a></li>
                    </ul>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">账号：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="username" placeholder="邮箱/手机号/用户名"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">密码：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="pwd" placeholder="密码"/>
                        <span class="tip">6位以上字符</span>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">确认密码：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="pwd" placeholder="密码"/>
                    </div>
                </div>

                <div class="phoneRegister">
                    <div class="ui-form-item">
                        <label class="ui-form-label">手机号码：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="pwd" placeholder="手机号码"/>
                            <span class="tip">仅用于密码找回，不对外公开</span>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">验证码：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="vcode" placeholder="验证码"/>
                            <a href="javascript:;" class="ui-button">获取</a>
                        </div>
                    </div>
                </div>
                <div class="emailRegister none">
                    <div class="ui-form-item">
                        <label class="ui-form-label">电子邮箱：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="email" placeholder="电子邮箱"/>
                        </div>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <label><input type="checkbox" class="ui-checkbox" name="agree" />我已阅读并同意<a href="" target="_blank">《网站服务协议》</a></label>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input  type="button" class="ui-button ui-button-L" value="注册"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="js/login/register.js"></script>
</body>
</html>