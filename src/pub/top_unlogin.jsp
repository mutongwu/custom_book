<%
String DEBUG = "@DEBUG";
if (DEBUG.equals("") && request.getAttribute("userId") != null){
    response.sendRedirect((String)request.getAttribute("basePath"));
    return;
}
%>
<link rel="import" href="./top.html?__inline">