
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <link rel="import" href="./pub/res.jsp?__inline">
    <style>
        .log{
            color: #f00;
            width: 70%;
            margin: 20px auto;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <link rel="import" href="./pub/top.html?__inline">
    <div class="container">
        <p class="log" id="j_log"></p>
    </div><!-- END container-->

    <link rel="import" href="./pub/copyright.jsp?__inline">
    <script>
        $(function(){
            $('#j_log').text(JSON.stringify(App.params()), null, 2);
        });
    </script>
</div>
</body>
</html>