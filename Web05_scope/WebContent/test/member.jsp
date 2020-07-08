<%@page import="test.member.dto.MemberDto"%>
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
	request.setCharacterEncoding("utf-8");
	MemberDto dto = (MemberDto)request.getAttribute("dto");
	int num = dto.getNum();
	String name = dto.getName();
	String addr = dto.getAddr();
%>

	<p>회원 번호 : <%=num %></p>
	<p>회원 이름 : <%=name %></p>
	<p>주소 : <%=addr %></p>
</body>
</html>