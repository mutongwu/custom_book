<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
    <link rel="stylesheet" type="text/css" href="./css/admin.css" />
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
                        <strong class="red">网店代理</strong>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">状态：</label>
                    <div class="ui-form-group">
                        <strong  class="green">申请中</strong>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>店铺名称：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="shopname" placeholder="店铺名称"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>网店地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="shopurl" placeholder="网店地址"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">官网地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="site" placeholder="官网地址"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>上传店铺资料：</label>
                    <div class="ui-form-group">
                        <div class="uploadBox cf">
                            <div class="uploadItem fl">
                                <img src="./images/core/boy1.jpg" class="pic" />
                                <input type="file" name="pic1" class="uploadInput" />
                            </div>
                            <div class="uploadItem fl">
                                <img src="./images/core/boy1.jpg" class="pic" />
                                <input type="file" name="pic1" class="uploadInput" />
                            </div>
                            <div class="uploadItem fl">
                                <img src="./images/core/boy1.jpg" class="pic" />
                                <input type="file" name="pic1" class="uploadInput" />
                            </div>
                        </div>
                        <p>请上传带网店名称的管理后台截图，需要3张图。</p>
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
                    <label class="ui-form-label"><em>*</em>联系人：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="contact" placeholder="联系人"/>
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
                    <label class="ui-form-label">联系邮箱：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="email" placeholder="联系邮箱："/>
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