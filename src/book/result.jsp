<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="../pub/res.jsp?__inline">
</head>
<body>
<div class="wrapper">
    <link rel="import" href="../pub/top.jsp?__inline">

    <div class="container bookResultCnt">
    	
    </div>
    <!-- END container-->

    <link rel="import" href="../pub/copyright.jsp?__inline">
</div>
<script type="text/html" id="bookTpl">
<div class="infoBox">
    <h1 class="tc">中文名：{{item.chineseName}}</h1>
    <h1 class="tc">拼音名：{{item.pinyinName}}</h1>
</div>
<div class="bookPreview">
    <div id="j_bookCnt"></div>
</div>

<div class="memoPicBox">
    <div class="bd">
        <ul class="pure-g">
            <li class="pure-u-14-24 item">
                <h3>我的寄语</h3>
                <p>我们将印刷在绘本的第2页上</p>
                <p class="message">{{item.message}}</p>
            </li>
            <li class="pure-u-10-24 item">
                <h3>礼品包装：
                    {{if item.isPacking}}
                    <span class="green">是</span>
                    {{else}}
                     <span class="red">否</span>   
                    {{/if}}
                </h3>
                
                <div class="photo">
                    <img src="@ROOT_PATH/u/s.do?attachmentId={{item.attachmentId}}" class="uploadPhoto">
                </div>
            </li>
        </ul>
    </div>
</div>
{{if _admin}}
<div class="jsonInfo">
    <h1 class="tc">图片详细信息：</h1>
    <table class="table table-border-vertical">
        <thead>
            <th>字母</th>
            <th>中文</th>
            <th>拼音</th>
            <th>小图</th>
            <th>故事图1</th>
            <th>故事图2</th>
        </thead>
        <tbody>
            {{each _jsonInfo}}
            <tr class="tl">
                <td>{{$value.ch}}</td>
                <td>{{$value.zh}}</td>
                <td>{{$value.py}}</td>
                <td>{{$value.thumb}}</td>
                <td>{{$value.first}}</td>
                <td>{{$value.second}}</td>
            </tr>
            {{/each}}
        </tbody>
    </table>
</div>
{{/if}}
</script>
 <script src="../js/book/result.js"></script> 
</body>
</html>