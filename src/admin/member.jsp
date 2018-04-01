<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
    <link rel="stylesheet" type="text/css" href="./css/admin.css" />
</head>
<body>
<div class="wrapper adminPage">
    <link rel="import" href="../pub/admin/top.jsp?__inline">

    <div class="container adminMemberCnt">
        <h1 class="tc">会员管理</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form">
                <div class="pure-g">
                    <div class="pure-u-3-24">
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">用户名：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="username" placeholder="用户名"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">手机号：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="mobile" placeholder="手机号"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">状态：</label>
                            <div class="ui-form-group">
                                <select class="ui-select" name="status">
                                    <option>请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pure-g">
                    <div class="pure-u-3-24">
                    </div>
                    <div class="pure-u-2-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label">所在地区：</label>
                            <div class="ui-form-group">
                                <select class="ui-select" name="province">
                                    <option>请选择省份</option>
                                </select>
                                &nbsp;&nbsp;
                                <select class="ui-select" name="city">
                                    <option>请选择城市</option>
                                </select>
                                &nbsp;&nbsp;
                                <select class="ui-select" name="city">
                                    <option>请选择区县</option>
                                </select>
                            </div>
                        </div>
                    </div>
                     <div class="pure-u-1-4">
                        <div class="ui-form-item">
                            <label class="ui-form-label"></label>
                            <div class="ui-form-group">
                                <input type="button" class="ui-button" value="搜索"/>
                            </div>
                        </div>
                    </div>
                </div>
                
            </form>
        </div>
        <div class="orderData ">
            <table class="table table-border-vertical">
                <thead>
                <tr>
                    <th class="tc">序号</th>
                    <th class="tc">用户名</th>
                    <th class="tc">手机号</th>
                    <th class="tc">电子邮箱</th>
                    <th class="tc">注册来源</th>
                    <th class="tc">所在地区</th>
                    <th class="tc">状态</th>
                    <th class="tc">操作</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <a href="./admin/memberdetail.html">234567</a>
                    </td>
                    <td>
                        张三
                    </td>
                    <td>
                        13800138000
                    </td>
                    <td class="tl">
                        abc@qq.com
                    </td>
                    <td>
                        手机注册
                    </td>
                    <td>
                        山东青岛日照
                    </td>
                    <td>
                        正常
                    </td>
                    <td>
                        <input type="button" class="ui-button ui-button-yellow" value="锁定" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="./admin/memberdetail.html">234567</a>
                    </td>
                    <td>
                        张三
                    </td>
                    <td>
                        13800138000
                    </td>
                    <td class="tl">
                        abc@qq.com
                    </td>
                    <td>
                        手机注册
                    </td>
                    <td>
                        山东青岛日照
                    </td>
                    <td>
                        正常
                    </td>
                    <td>
                        <input type="button" class="ui-button ui-button-yellow" value="锁定" />
                    </td>
                </tr>
                </tbody>
            </table>
            <div class="pageBox" id="j_pageBox">

            </div>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="../js/admin/member.js"></script>
</body>
</html>