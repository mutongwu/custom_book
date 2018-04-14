<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top_unlogin.jsp?__inline">

    <div class="container findPwdCnt" >
        <h1 class="title tc green">找回密码</h1>

        <div class="contentBox tc">

            <form class="ui-form existForm tl">
                <div class="ui-form-item">
                    <h2 class="tc ">输入与您注册的电子邮件地址或者手机号码</h2>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">账号：</label>
                    <div class="ui-form-group">
                        <input required="required" class="ui-input" name="source" placeholder="邮箱/手机号" maxlength="18" />
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input  type="button" class="ui-button ui-button-L" value="下一步" id="j_checkExist" />
                    </div>
                </div>
            </form>
            <form class="ui-form findPwdForm tl">
               
                <div class="ui-form-item">
                    <label class="ui-form-label">验证码：</label>
                    <div class="ui-form-group">
                        <input required="required"  class="ui-input" name="code" placeholder="验证码"/>
                        <input type="hidden" name="verificationId" class="j_verificationId" />
                        <a href="javascript:;" class="ui-button  j_getCode">获取</a>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">新的密码：</label>
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
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input  type="button" class="ui-button ui-button-L" value="提交" id="j_submit" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="/js/login/findPwd.js"></script>
</body>
</html>