<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
    <link rel="stylesheet" type="text/css" href="/css/admin/admin.scss" />
</head>
<body>
<div class="wrapper adminPage">
    <link rel="import" href="../pub/admin/top.jsp?__inline">

    <div class="container  adminUserDetailCnt">
        <h1 class="tc">用户信息详情</h1>
        <div class="userDetailBox tc">
            
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="userTpl">

<form class="ui-form userDetailForm  pure-g tl">
<div class="pure-u-1-3">
    <div class="ui-form-item">
        <label class="ui-form-label">用户ID：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.userId}}</p>
        </div>
    </div>
</div>
<div class="pure-u-1-3">    
    <div class="ui-form-item">
        <label class="ui-form-label">用户名：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.userName}}</p>
        </div>
    </div>
</div>    

<div class="pure-u-1-3">    
    <div class="ui-form-item">
        <label class="ui-form-label">角色：</label>
        <div class="ui-form-group">
            {{if userVo.role == 0}}
            <p class="ui-text green">普通会员</p>
            {{else}}
            <p class="ui-text yellow">管理员</p>
            {{/if}}
        </div>
    </div>
</div>    

<div class="pure-u-1-3">    
    <div class="ui-form-item">
        <label class="ui-form-label">状态：</label>
        <div class="ui-form-group">
            {{if userVo.status == 0}}
            <p class="ui-text red">无效</p>
            {{else}}
            <p class="ui-text green">有效</p>
            {{/if}}
        </div>
    </div>
</div>     

<div class="pure-u-1-3">       
    <div class="ui-form-item">
        <label class="ui-form-label">邮箱：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.email}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">手机：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.mobile}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">性别：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userVo.gender == '1'? '男':'女'}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">头像：</label>
        <div class="ui-form-group">
            <p class="ui-text"> <img src="@ROOT_PATH/u/s.do?attachmentId={{userInfoVo.attachmentId}}" class="pic"/></p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userInfoVo.province}}{{userInfoVo.city}}{{userInfoVo.county}}{{userInfoVo.address}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">昵称：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userInfoVo.nickname}}</p>
        </div>
    </div>
</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">个性签名：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userInfoVo.signature}}</p>
        </div>
    </div>

</div>    
<div class="pure-u-1-3">        
    <div class="ui-form-item">
        <label class="ui-form-label">注册来源：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{userInfoVo.source}}</p>
        </div>
    </div>    

    </div>        
</form>    
</script>
<script src="/js/admin/memberdetail.js"></script>
</body>
</html>