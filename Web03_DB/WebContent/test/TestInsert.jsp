<%@page import="test.test.dto.TestDto"%>
<%@page import="test.test.dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
%>
</head>
<%
	TestDao dao = TestDao.getInstance();
	TestDto dto = new TestDto();
	String content = request.getParameter("content");
	dto.setContent(content);
	dao.insertDao(dto);
%>
<body>
	<script>
		alert("추가되었습니다!");
		location.href="test1.jsp";
	</script>
</body>
</html>