<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container agencyCnt">
        <h1 class="tc">代理资料</h1>
    	<div class="tabBox">
            <link rel="import" href="../pub/partial_agency.jsp?__inline">
        </div>
        <div class="agencyBox tc">
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="agencyTpl">
<form class="ui-form applyForm tl">
    <div class="ui-form-item">
        <label class="ui-form-label">代理类型：</label>
        <div class="ui-form-group">
            <strong class="red">
                {{if level == 1}}
                    个人代理
                {{else if level == 2}}
                    网店代理
                {{else if level == 3}}
                    实体店代理
                {{/if}}
            </strong>
        </div>
    </div>
    <p class="sectionTitle">合作伙伴信息：</p>
    {{if level == 1}}
    <div class="ui-form-item">
        <label class="ui-form-label">代理人姓名：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{name}}</p>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">代理人地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{province}}{{city}}{{county}}{{address}}</p>
        </div>
    </div>
    {{else}}

    <div class="ui-form-item">
        <label class="ui-form-label">店铺名称：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{name}}</p>
        </div>
    </div>

    <div class="ui-form-item">
        <label class="ui-form-label">店铺地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{province}}{{city}}{{county}}{{address}}</p>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">网店地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{shopURL}}</p>
        </div>
    </div>                
    <div class="ui-form-item">
        <label class="ui-form-label">官网地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{webSiteURL}}</p>
        </div>
    </div>
    
    <div class="ui-form-item">
        <label class="ui-form-label">店铺资料：</label>
        <div class="ui-form-group">
            <p class="ui-text">
                {{each picInfoVoList }}
                    <img src="@ROOT_PATH/u/s.do?attachmentId={{$value}}" class="pic"/>
                {{/each}}
            </p>
        </div>
    </div>

    {{/if}}
    <p class="sectionTitle">联系人信息：</p>
    <div class="j_contactBox">
            
        <div class="ui-form-item">
            <label class="ui-form-label">联系人姓名：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{contact}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系人地址：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{contactProvince}}{{contactCity}}{{contactCounty}}{{contactAddress}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系手机：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{contactMobile}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系电话：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{contactTelephone}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系QQ：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{contactQQ}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系电子邮箱：</label>
            <div class="ui-form-group">
                <p class="ui-text">contactEmail</p>
            </div>
        </div>
    </div><!--contactBox -->
</form>
</script>
<script src="/js/agency/agency.js"></script>
</body>
</html>