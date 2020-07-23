<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.minseok.dao.MinseokDao"%>
<%@page import="test.minseok.dto.MinseokDto"%>
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
	int num = Integer.parseInt(request.getParameter("num"));
	CafeDao.getInstance().delete(num);
%>

<script>
	alert("삭제가 완료되었습니다!");
	location.href="list.jsp";
</script>
</body>
</html>