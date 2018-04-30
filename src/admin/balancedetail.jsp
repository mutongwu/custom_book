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
        <h1 class="tc">新增汇款记录</h1>
        <div class="balanceBox tc">
            <form class="ui-form balanceForm tl">
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>汇款日期：</label>
                    <div class="ui-form-group">
                        <input required="required" class="ui-input j_date" name="date" placeholder="汇款日期"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>合作伙伴：</label>
                    <div class="ui-form-group">
                        <input  required="required" class="ui-input" name="shopurl" placeholder="合作伙伴"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>收款人：</label>
                    <div class="ui-form-group">
                        <input  required="required" class="ui-input" name="site" placeholder="收款人"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
               
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>汇入银行：</label>
                    <div class="ui-form-group">
                        <input  required="required" class="ui-input" name="bank" placeholder="收款人"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
                
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>汇款金额：</label>
                    <div class="ui-form-group">
                        <input  required="required" type="number" class="ui-input" name="account" placeholder="汇款金额"   />
                            <p class="ui-field-error"></p>
                    </div>
                </div>
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