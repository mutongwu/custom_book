<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container applyCnt">
        <h1 class="tc">代理资料</h1>
    	<div class="tabBox">
            <link rel="import" href="../pub/partial_agency.jsp?__inline">
        </div>
        <div class="applyBox tc">
            <form class="ui-form applyForm tl">
                <div class="ui-form-item">
                    <label class="ui-form-label">代理类型：</label>
                    <div class="ui-form-group">
                        <strong class="red">个人代理</strong>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">状态：</label>
                    <div class="ui-form-group">
                        <strong  class="green">申请中</strong>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>代理人姓名：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="username" placeholder="代理人姓名"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>所在城市：</label>
                    <div class="ui-form-group">
                        <select class="ui-select" name="province">
                            <option>请选择省份</option>
                        </select>
                        <select class="ui-select" name="province">
                            <option>请选择城市</option>
                        </select>
                        <select class="ui-select" name="province">
                            <option>请选择区县</option>
                        </select>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>详细地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="address" placeholder="详细地址"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>联系手机：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="mobilePhone" placeholder="联系手机"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系电话：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="telphone" placeholder="联系电话"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系QQ：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="qq" placeholder="联系QQ："/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button-XL ui-button-yellow" value="提交申请"/>
                    </div>
                </div>
            </form>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="../js/agency/agency.js"></script>
</body>
</html>