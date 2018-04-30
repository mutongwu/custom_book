<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="./pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="./pub/top.jsp?__inline">

    <div class="container msgCnt" >
        <div class="breadNav"><span>首页</span>&gt;<span>消息</span></div>
        <div class="hd cf">
            <p class="tip"><i class="icon icon-msg"></i>发消息给：<a href="profile.html">啦啦啦</a></p>
            <textarea class="ui-textarea content"></textarea>
            <a href="javascript:;" class="ui-button ui-button-L fr" id="j_sendBtn">发送消息</a>
        </div>
        <div class="contentBox ">
            <ul class="msgList">
                <li class="cf">
                    <div class="userBox">
                        <div class="imgText cf">
                            <div class="imgBox fl">
                                <a href="profile.html"><img src="images/user-1.jpg" /></a>
                            </div>
                            <div class="textBox">
                                <h3><a href="profile.html">这是用户名</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="dateBox">
                        <span> 2014-09-08 12:22</span>
                    </div>
                    <div class="contentBox">
                        <div class="ui-arrow-box">
                            <ul class="ui-arrow-content">
                                这里是消息内容
                            </ul>
                            <div class="ui-arrow ui-arrow-left">
                                <em>◆</em><i>◆</i>
                            </div>
                        </div>
                    </div>

                </li>
                <li class="cf myMsg">
                    <div class="userBox">
                        <div class="imgText cf">
                            <div class="imgBox fl">
                                <a href="profile.html"><img src="images/user-1.jpg" /></a>
                            </div>
                            <div class="textBox">
                                <h3><a href="profile.html">这是用户名</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="dateBox">
                        <span> 2014-09-08 12:22</span>
                    </div>
                    <div class="contentBox">
                        <div class="ui-arrow-box">
                            <ul class="ui-arrow-content">
                                这里是消息内容
                            </ul>
                            <div class="ui-arrow ui-arrow-right">
                                <em>◆</em><i>◆</i>
                            </div>
                        </div>
                    </div>

                </li>
            </ul>

            <!--<link rel="import" href="./pub/pageBar.jsp?__inline">-->
        </div>
    </div>
    <link rel="import" href="./pub/copyright.jsp?__inline">
</div>
</body>
</html>