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

    <div class="container  agencyCnt adminAgencyDetailCnt">
        <h1 class="tc">合作伙伴申请资料</h1>
        <div class="agencyBox tc">
            
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="agencyTpl">
<form class="ui-form agencyInfoForm tl">
    <div class="ui-form-item">
        <label class="ui-form-label">代理类型：</label>
        <div class="ui-form-group">
            <strong class="red">
                {{if partnerInfoVo.level == 1}}
                    个人代理
                {{else if partnerInfoVo.level == 2}}
                    网店代理
                {{else if partnerInfoVo.level == 3}}
                    实体店代理
                {{/if}}
            </strong>
        </div>
    </div>
    <p class="sectionTitle">合作伙伴信息：</p>
    {{if partnerInfoVo.level == 1}}
    <div class="ui-form-item">
        <label class="ui-form-label">代理人姓名：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.name}}</p>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">代理人地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.province}}{{partnerInfoVo.city}}{{partnerInfoVo.county}}{{partnerInfoVo.address}}</p>
        </div>
    </div>
    {{else}}

    <div class="ui-form-item">
        <label class="ui-form-label">店铺名称：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.name}}</p>
        </div>
    </div>

    <div class="ui-form-item">
        <label class="ui-form-label">店铺地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.province}}{{partnerInfoVo.city}}{{partnerInfoVo.county}}{{partnerInfoVo.address}}</p>
        </div>
    </div>
    <div class="ui-form-item">
        <label class="ui-form-label">网店地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.shopURL}}</p>
        </div>
    </div>                
    <div class="ui-form-item">
        <label class="ui-form-label">官网地址：</label>
        <div class="ui-form-group">
            <p class="ui-text">{{partnerInfoVo.webSiteURL}}</p>
        </div>
    </div>
    
    <div class="ui-form-item">
        <label class="ui-form-label">店铺资料：</label>
        <div class="ui-form-group">
            <p class="ui-text">
                {{each picInfoVoList }}
                    <img src="@ROOT_PATH/u/s.do?attachmentId={{$value.attachmentId}}" class="pic"/>
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
                <p class="ui-text">{{partnerInfoVo.contact}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系人地址：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactProvince}}{{partnerInfoVo.contactCity}}
                    {{partnerInfoVo.contactCounty}}{{partnerInfoVo.contactAddress}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系手机：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactMobile}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系电话：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactTelephone}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系QQ：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactQQ}}</p>
            </div>
        </div>
        <div class="ui-form-item">
            <label class="ui-form-label">联系电子邮箱：</label>
            <div class="ui-form-group">
                <p class="ui-text">{{partnerInfoVo.contactEmail}}</p>
            </div>
        </div>
    </div><!--contactBox -->
</form>
</script>
<script src="../js/admin/agencydetail.js"></script>
</body>
</html>