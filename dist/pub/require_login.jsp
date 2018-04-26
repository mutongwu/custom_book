<%if (request.getAttribute("userId") == null){
	response.sendRedirect((String)request.getAttribute("basePath"));
	return;
}%>