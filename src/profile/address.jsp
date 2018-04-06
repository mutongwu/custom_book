<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container addressCnt" >
        <h1 class="title tc green">收货地址</h1>
        <div class="ui-tab">
            <ul class="cf">
                <li class="tabItem"><a href="./account.jsp">基本资料</a></li>
                <li class="tabItem active"><a href="./address.jsp">收货地址</a></li>
                <li class="tabItem "><a href="./pwd.jsp">修改密码</a></li>
            </ul>
        </div>
        <div class="contentBox ">
            <div class="bd">
                <div class="ui-form addressForm">
                    <input type="hidden" name="addressId">
                    <div class="ui-form-item">
                        <label class="ui-form-label">姓名：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="name" placeholder="姓名" maxlength="16" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">所在城市：</label>
                        <div class="ui-form-group " id="j_distpicker">
                            <select class="ui-select" name="province" required label="省份">
                                <option>请选择省份</option>
                            </select>
                            <select class="ui-select" name="city" required label="城市">
                                <option>请选择城市</option>
                            </select>
                            <select class="ui-select" name="county" required label="区县">
                                <option>请选择区县</option>
                            </select>
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <div class="ui-form-item">
                        <label class="ui-form-label">详细地址：</label>
                        <div class="ui-form-group">
                            <input required class="ui-input" name="address" placeholder="详细地址" maxlength="30" />
                            <p class="ui-field-error"></p>
                        </div>
                    </div>
                    <!-- <div class="ui-form-item">
                        <label class="ui-form-label">联系电话：</label>
                        <div class="ui-form-group">
                            <input class="ui-input" name="telphone" placeholder="联系电话"/>
                        </div>
                    </div> -->
                    <div class="ui-form-item">
                        <label class="ui-form-label">联系手机：</label>
                        <div class="ui-form-group">
                            <input  required="required" vtype="phone" class="ui-input" name="mobile" placeholder="联系手机"/>
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
<script type="text/javascript" src="/js/profile/address.js"></script>
</body>
</html>