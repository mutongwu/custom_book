<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container myBankCnt">
        <h1 class="tc">结算银行</h1>
    	<div class="tabBox">
            <link rel="import" href="../pub/partial_agency.jsp?__inline">
        </div>
        <div class="bankInfoBox tc">
            <form class="ui-form bankForm tl">
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>开户行：</label>
                    <div class="ui-form-group">
                        <select class="ui-select j_bankSelect" name="source">
                            <option value="工商银行">工商银行</option>
                            <option value="农业银行">农业银行</option>
                            <option value="招商银行">招商银行</option>
                            <option value="建设银行">建设银行</option>
                            <option value="中国银行">中国银行</option>
                            <option value="交通银行">交通银行</option>
                            <option value="支付宝账号">支付宝账号</option>
                            <option value="微信账号">微信账号</option>
                            <option value="">其它</option>
                        </select>
                    </div>
                </div>
                <div class="ui-form-item j_otherBank none">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input required maxlength="32" class="ui-input disable" name="other" placeholder="开户行名称" label="开户行名称"/><p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>银行账户名称：</label>
                    <div class="ui-form-group">
                        <input required class="ui-input" name="name" placeholder="银行账户名称"/>
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>账号：</label>
                    <div class="ui-form-group">
                        <input required class="ui-input" name="accountNumber" placeholder="账号"/>
                        <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button-XL ui-button-yellow" value="提交结算银行" id="j_submit" />
                    </div>
                </div>
            </form>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="/js/agency/mybank.js"></script>
</body>
</html>