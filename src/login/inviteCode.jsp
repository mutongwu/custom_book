<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container inviteCnt" >
        <h1 class="title tc green">输入邀请码</h1>
        <div class="contentBox tc ">
            
            <form class="ui-form inviteForm tl">
                 <p class="tip">输入邀请码（<a>邀请码是什么？</a>），多的 <strong class="price">6</strong> 个书豆</p>
                <div class="ui-form-item">
                    <label class="ui-form-label">邀请码：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="username" placeholder="邀请码"/>
                    </div>
                </div>
                <div class="ui-form-item btnBox">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button-L ui-button-yellow" value="提交"/>
                        <a href="">跳过此步</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
</body>
</html>