<%@page import="test.users.dao.UsersDao"%>
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
	String id = (String)session.getAttribute("id");
	UsersDao dao = UsersDao.getInstance();
	dao.delete(id);
	session.invalidate();
%>

<script>
	alert("탈퇴 완료되었습니다!");
	location.href="../index.jsp"
</script>
</body>
</html>