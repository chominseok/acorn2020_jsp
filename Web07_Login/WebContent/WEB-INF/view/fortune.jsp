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
	String str = (String)request.getAttribute("fortuneToday");
%>
	<h1>오늘의 운세</h1>
	<p>오늘의 운세는 <%=str %>입니다.ㅎㅎㅎㅎ</p>
	<p>오늘의 운세는 ${fortuneToday}</p>
</body>
</html>