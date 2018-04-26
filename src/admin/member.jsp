<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
    <link rel="stylesheet" type="text/css" href="/css/admin/member.scss" />
</head>
<body>
<div class="wrapper adminPage">
    <link rel="import" href="../pub/admin/top.jsp?__inline">

    <div class="container adminMemberCnt">
        <h1 class="tc">会员管理</h1>
    	<div class="queryBox">
            <form class="queryForm ui-form">
                <div class="pure-g">
                    <!--<div class="pure-u-3-24">
                    </div>-->
                    <div class="pure-u-8-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label">用户名：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="username" placeholder="用户名"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-8-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label">手机号：</label>
                            <div class="ui-form-group">
                                <input class="ui-input" name="mobile" placeholder="手机号"/>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-8-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label">状态：</label>
                            <div class="ui-form-group">
                                <select class="ui-select j_memberStatusSel" name="status">
                                    <option value="" selected>请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pure-g">
                    <!--<div class="pure-u-3-24">
                    </div>-->
                    <div class="pure-u-10-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label">所在地区：</label>
                            <div class="ui-form-group j_distinctSelect">
                                <select class="ui-select" name="province">
                                    <option>请选择省份</option>
                                </select>
                                &nbsp;&nbsp;
                                <select class="ui-select" name="city">
                                    <option>请选择城市</option>
                                </select>
                                &nbsp;&nbsp;
                                <select class="ui-select" name="county">
                                    <option>请选择区县</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="pure-u-10-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label">注册时间：</label>
                            <div class="ui-form-group">
                                <input class="ui-input timeInput j_beginTime" name="beginTime" placeholder="开始时间"/>
                                &nbsp;&nbsp;
                                <input class="ui-input timeInput ml10 j_endTime" name="endTime" placeholder="结束时间"/>
                            </div>
                        </div>
                    </div>
                     <div class="pure-u-2-24">
                        <div class="ui-form-item">
                            <label class="ui-form-label"></label>
                            <div class="ui-form-group">
                                <input type="button" class="ui-button j_queryBtn" value="搜索"/>
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
                    <th class="tc">用户ID</th>
                    <th class="tc">用户名</th>
                    <th class="tc">手机号</th>
                    <th class="tc">电子邮箱</th>
                    <th class="tc">注册来源</th>
                    <th class="tc">注册时间</th>
                    <th class="tc">角色</th>
                    <th class="tc">所在地区</th>
                    <th class="tc">状态</th>
                    <th class="tc">操作</th>
                </tr>
                </thead>
                <tbody class="j_tbdBox">
                
                </tbody>
            </table>
            <div class="pageBox" id="j_pageBox">

            </div>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="itemTpl">
{{each list as item}}
<tr>
    <td>
        <a>{{item.userId}}</a>
    </td>
    <td>
        {{item.userName}}
    </td>
    <td>
        {{item.mobile}}
    </td>
    <td class="tl">
        {{item.email}}
    </td>
    <td>
        {{item.source}}
    </td>
    <td>
        {{dateFormat(item.createTime)}}
    </td>
    <td>
       {{if item.role == 0}}
        <span class="green">普通会员</span>
        {{else}}
        <span class="red">管理员</span>
        {{/if}}
    </td>
    <td>
        {{item.province}}{{item.city}}{{item.county}}
    </td>
    <td>
        {{if item.status == 1}}
        <span class="green">有效</span>
        {{else}}
        <span class="red">无效</span>
        {{/if}}
    </td>
    <td>
        {{if item.status == 1}}
        <input type="button" class="ui-button ui-button-yellow" value="锁定" />
        {{else}}
        <input type="button" class="ui-button ui-button-yellow" value="解锁" />
        {{/if}}
    </td>
</tr>

{{/each}}
</script>
<script src="../js/admin/member.js"></script>
</body>
</html>