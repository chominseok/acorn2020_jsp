<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//request.setCharacterEncoding("utf-8");  >>이제 필터에서 처리하기 때문에 필요없음
	String msg = request.getParameter("msg");
%>
	<h1>요청을 처리했습니다.</h1>
	<p>msg : <%=msg %></p>
</body>
</html>