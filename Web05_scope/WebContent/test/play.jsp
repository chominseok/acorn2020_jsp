<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	//session 영역에 nick 이라는 키값으로 저장된 String type 읽어오기
	String nick = (String)session.getAttribute("nick");
%>

	<p>세션 출력하기 : <%=nick %></p>	  	
	
</body>
</html>