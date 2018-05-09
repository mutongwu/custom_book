<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top_unlogin.jsp?__inline">

    <div class="container registerCnt" >
        <h1 class="title tc green">注册</h1>
        <div class="contentBox tc">

            <form class="ui-form registerForm tl">
                <div class="ui-tab">
                    <ul class="cf">
                        <li class="tabItem active" type="mobile"><a href="javascript:;">手机注册</a></li>
                        <li class="tabItem" type="email"><a href="javascript:;">邮箱注册</a></li>
                    </ul>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">账号：</label>
                    <div class="ui-form-group">
                        <input required="required" class="ui-input" name="userName" placeholder="邮箱/手机号/用户名" maxlength="18" />
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">密码：</label>
                    <div class="ui-form-group">
                        <input type="password" required="required" class="ui-input" name="userPwd" placeholder="密码" minlength="6" maxlength="18" />
                        <span class="tip">6位以上字符</span>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">确认密码：</label>
                    <div class="ui-form-group">
                        <input type="password" required="required" class="ui-input" name="userPwd2" placeholder="密码"  minlength="6"  maxlength="18" />
                    </div>
                </div>

                <div class="phoneRegister">
                    <div class="ui-form-item">
                        <label class="ui-form-label">手机号码：</label>
                        <div class="ui-form-group">
                            <input vtype="phone" required="required" class="ui-input j_phone" name="mobile" placeholder="手机号码"/>
                            <span class="tip">仅用于密码找回，不对外公开</span>
                        </div>
                    </div>
                </div>
                <div class="emailRegister none">
                    <div class="ui-form-item">
                        <label class="ui-form-label">电子邮箱：</label>
                        <div class="ui-form-group">
                            <input required="required" vtype="email" class="ui-input j_email disable" name="email" placeholder="电子邮箱"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">验证码：</label>
                    <div class="ui-form-group">
                        <input required="required"  class="ui-input" name="code" placeholder="验证码"/>
                        <input type="hidden" name="verificationId" class="j_verificationId" />
                        
                        <a href="javascript:;" class="ui-button  j_getCode">获取</a>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <label><input type="checkbox" class="ui-checkbox" name="agree" checked />我已阅读并同意<a href="" target="_blank">《网站服务协议》</a></label>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input  type="button" class="ui-button ui-button-L" value="注册" id="j_submit" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="/js/login/register.js"></script>
</body>
</html>