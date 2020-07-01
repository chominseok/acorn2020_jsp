<%@page import="java.util.Random"%>
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
		String[] strNum = {"밤 길 조심하세요.", "차 조심하세요.", "계단 조심하세요.", "엘리베이터 조심하세요."};
		Random ran = new Random();
		int ranNum = ran.nextInt(4);
	%>
	<h1>오늘의 운세입니다.</h1>
	<p>오늘의 운세는 : <%= strNum[ranNum] %></p>
</body>
</html>