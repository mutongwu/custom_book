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

    <div class="container  adminBalanceDetailCnt">
        <h1 class="tc">更新结算记录</h1>
        <div class="balanceBox tc">
            <form class="ui-form balanceForm tl">
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>汇款日期：</label>
                    <div class="ui-form-group">
                        <input required="required" class="ui-input j_date" name="statementTime" placeholder="汇款日期"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>合作伙伴用户ID：</label>
                    <div class="ui-form-group">
                        <input  required="required" vtype="num" class="ui-input j_userId" name="userId" placeholder="请输入用户ID"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
              
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>开户银行：</label>
                    <div class="ui-form-group">
                        <input  required="required" class="ui-input" name="source" placeholder="开户银行"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>账户：</label>
                    <div class="ui-form-group">
                        <input  required="required" class="ui-input" name="accountNumber" placeholder="账户"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>收款人：</label>
                    <div class="ui-form-group">
                        <input  required="required" class="ui-input" name="name" placeholder="收款人"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
                <!--<div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>汇款金额：</label>
                    <div class="ui-form-group">
                        <input  required="required" type="number" class="ui-input" name="amount" placeholder="汇款金额"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>-->
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button ui-button-XL" value="提交" id="j_submit"/>
                    </div>
                </div>
            </form>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="/js/admin/balancedetail.js"></script>
</body>
</html>