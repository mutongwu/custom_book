<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
    <link rel="stylesheet" type="text/css" href="./css/admin.css" />
</head>
<body>
<div class="wrapper adminPage">
    <link rel="import" href="../pub/admin/top.jsp?__inline">

    <div class="container applyCnt adminParterCnt">
        <h1 class="tc">代理资料</h1>
        <div class="applyBox tc">
            <form class="ui-form applyForm tl">
                <div class="pure-g mb30">
                    <div class="pure-u-1-4">
                        <label>序号：</label><span>12345</span>
                    </div>    
                    <div class="pure-u-1-4">
                        <label>提交人：</label><span>张三</span>
                    </div>
                    <div class="pure-u-2-4">
                        <label>申请时间：</label><span>2016-09-08 12:12:11</span>
                    </div>
                </div>
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
                    <label class="ui-form-label"> 店铺名称：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="shopname" placeholder="店铺名称" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 网店地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="shopurl" placeholder="网店地址" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">官网地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="site" placeholder="官网地址" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 上传店铺资料：</label>
                    <div class="ui-form-group">
                        <div class="uploadBox cf">
                            <div class="uploadItem fl">
                                <img src="./images/core/boy1.jpg" class="pic" />
                            </div>
                            <div class="uploadItem fl">
                                <img src="./images/core/boy1.jpg" class="pic" />
                            </div>
                            <div class="uploadItem fl">
                                <img src="./images/core/boy1.jpg" class="pic" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 所在城市：</label>
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
                    <label class="ui-form-label"> 详细地址：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="address" placeholder="详细地址" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 联系人：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="contact" placeholder="联系人" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"> 联系手机：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="mobilePhone" placeholder="联系手机" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系电话：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="telphone" placeholder="联系电话" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系邮箱：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="email" placeholder="联系邮箱：" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">联系QQ：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="qq" placeholder="联系QQ：" readonly />
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button ui-button" value="审核通过" readonly />
                        <input type="button" class="ui-button ui-button ui-button-yellow" value="审核不通过" readonly />
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