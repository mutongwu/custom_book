<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
                        <select class="ui-select" name="bankName">
                                <option>工商银行</option>
                            </select>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"></label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="address" placeholder=""/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>银行账户名称：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="userName" placeholder="银行账户名称"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label"><em>*</em>银行账号：</label>
                    <div class="ui-form-group">
                        <input class="ui-input" name="bankNum" placeholder="银行账号"/>
                    </div>
                </div>
                <div class="ui-form-item">
                    <label class="ui-form-label">&nbsp;</label>
                    <div class="ui-form-group">
                        <input type="button" class="ui-button ui-button-XL ui-button-yellow" value="提交结算银行"/>
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