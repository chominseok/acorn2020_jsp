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
// 		request.setCharacterEncoding("utf-8");

		String fortuneToday = (String)request.getAttribute("fortuneToday"); %>
	
	<h1>안녕!</h1>
	<p>오늘의~ 운세 : <%=fortuneToday%></p>
</body>
</html>