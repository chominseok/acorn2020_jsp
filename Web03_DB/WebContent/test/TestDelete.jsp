<%@page import="test.test.dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String num2 = request.getParameter("num");
	TestDao dao = TestDao.getInstance();
	int num = Integer.parseInt(num2);
	dao.deleteDao(num);
%>
<body>
 <p><%=num %></p>
	<script>
		alert("삭제가 완료되었습니다");
		location.href="test1.jsp";
	</script>
</body>
</html>