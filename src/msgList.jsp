<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="./pub/res.jsp?__inline">
    <link rel="import" href="./pub/require_login.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="./pub/top.jsp?__inline">

    <div class="container msgListCnt" >
        <div class="breadNav"><span>首页</span>&gt;<span>消息</span></div>
        <div class="hd tr">
            <a href="sendMsg.html" class="ui-button ui-button-L">发送消息</a>
        </div>
        <div class="contentBox ">
            <div class="msgList">
                <table class="table thBg">
                    <thead>
                    <tr>
                        <th>用户名</th>
                        <th>消息内容</th>
                        <th>发送时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="imgText cf">
                                <div class="imgBox fl">
                                    <a href="profile.html"><img src="images/user-1.jpg" /></a>
                                </div>
                                <div class="textBox">
                                    <h3><a href="profile.html">这是用户名</a></h3>
                                    <a href="msg.html"><i class="icon icon-reply"></i></a>
                                </div>
                            </div>
                        </td>
                        <td><a href="msg.html">个人很喜欢读书希望和大家一起交流读书笔
                            记，交换有有趣的书。</a></td>
                        <td>
                            2014-02-12 12:22
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="imgText cf">
                                <div class="imgBox fl">
                                    <a href="profile.html"><img src="images/user-1.jpg" /></a>
                                </div>
                                <div class="textBox">
                                    <h3><a href="profile.html">这是用户名</a><em class="num">1</em></h3>
                                    <a href="msg.html"><i class="icon icon-reply"></i></a>
                                </div>
                            </div>
                        </td>
                        <td><a href="msg.html">个人很喜欢读书希望和大家一起交流读书笔
                            记，交换有有趣的书。</a></td>
                        <td>
                            2014-02-12 12:22
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <link rel="import" href="./pub/pageBar.jsp?__inline">
        </div>
    </div>
    <link rel="import" href="./pub/copyright.jsp?__inline">
</div>
</body>
</html>