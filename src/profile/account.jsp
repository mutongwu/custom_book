<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container accountCnt" >
        <h1 class="title tc green">基本资料</h1>
        <div class="ui-tab">
            <ul class="cf">
                <li class="tabItem active"><a href="./account.jsp">基本资料</a></li>
                <li class="tabItem "><a href="./address.jsp">收货地址</a></li>
                <li class="tabItem "><a href="./pwd.jsp">修改密码</a></li>
            </ul>
        </div>
        <div class="contentBox ">
            <div class="bd">
                <div class="ui-form accountForm">
                    <div class="ui-form-item">
                        <label class="ui-form-label">头像：</label>
                        <div class="ui-form-group">
                            <img src="/images/user-L.jpg" class="headPic j_headPic" />
                            <a class="ui-button uploadCnt" href="javascript:;">修改头像
                                <input type="file" id="j_fileupload" class="uploadFile " name="bytes"/>
                            </a>
                            <input type="hidden" name="attachmentId" />
                        </div>
                    </div>

                    <div class="ui-form-item">
                        <label class="ui-form-label">用户名：</label>
                        <div class="ui-form-group">
                            <p class="ui-form-text j_uname"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">昵称：</label>
                        <div class="ui-form-group">
                            <input maxlength="16" class="ui-input" name="nickname" placeholder="昵称"/>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">手机号码：</label>
                        <div class="ui-form-group">
                            <input required="required" vtype="phone" class="ui-input" name="mobilePhone" placeholder="手机号码"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">电子邮箱：</label>
                        <div class="ui-form-group">
                            <input required="required" vtype="email" class="ui-input" name="email" placeholder="电子邮箱"/>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">性别：</label>
                        <div class="ui-form-group">
                            <label><input type="radio" value="1" class="ui-radio" name="sex" checked>男</label>
                            <label><input type="radio" value="0" class="ui-radio" name="sex">女</label>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">所在城市：</label>
                        <div class="ui-form-group" id="j_distpicker">
                            <select class="ui-select" name="province">
                                <option>请选择省份</option>
                            </select>
                            <select class="ui-select" name="city">
                                <option>请选择城市</option>
                            </select>
                            <select class="ui-select" name="county">
                                <option>请选择区县</option>
                            </select>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">个性签名：</label>
                        <div class="ui-form-group">
                            <textarea class="ui-textarea" name="signature" placeholder="20个字以内"></textarea>
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
<script type="text/javascript" src="/js/profile/account.js"></script>
</body>
</html>