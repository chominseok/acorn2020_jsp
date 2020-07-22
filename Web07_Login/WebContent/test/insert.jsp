<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content{
		width : 768px;
		height : 300px;
		border : 1px dotted #cecee;
		box-shadow : 3px 3px 5px 6px #cccc;
	}
</style>
</head>
<body>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	System.out.println(content);
	System.out.println(title);
%>
	<p><%=title %></p>
	<div class="content">
		<%=content %>
	</div>
</body>
</html>