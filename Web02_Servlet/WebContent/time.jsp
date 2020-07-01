<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>time.jsp</title>
</head>
<body>
	<%
		Date d = new Date();
		int num = 10;
		String name = "김구라";
		String date = d.toString();
	%>
	<p>현재시간 : <%out.println(date);%></p>
	<p>현재시간 : <%=date %></p>
	<p>num : <%=num %></p>
	<p>name : <%=name %></p>
	
</body>
</html>