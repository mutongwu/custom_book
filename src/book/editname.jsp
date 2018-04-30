<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.html?__inline">

    <div class="container bookEditCnt">
        <h1 class="tc">编辑绘本</h1>
    	<div class="bookEdit">
            <div class="nameFormBox vertical-form" id="j_nameFormBox">
                <form class="nameForm tc">
                    <div>
                        <div class="fieldBox cf">
                           <input type="text" name="zh" placeholder="中文名字"  class="fl item tc ui-input j_zhInput" maxlength="16" required="required" label="中文名字"/>
                            <input type="text" name="py" placeholder="名字拼音"  class="fl item tc ui-input j_pyInput" maxlength="16" required="required" label="名字拼音"/>
                        </div>
                    </div>

                    <div class="fieldBox cf">
                        <link rel="import" href="/pub/partial_boyPop.html?__inline">
                        <link rel="import" href="/pub/partial_girlPop.html?__inline">
                    </div>
                </form>
                <div class="btnBox tc">
                    <a class="ui-button ui-button-yellow ui-button-XL" id="j_submitBtn">更新绘本</a>
                </div>
            </div>
        </div>
    </div><!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script src="../js/book/editname.js"></script>
</body>
</html>