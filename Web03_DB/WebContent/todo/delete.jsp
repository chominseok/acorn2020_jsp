<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	TodoDao dao = TodoDao.getInstance();
	String num2 = request.getParameter("num");
	int num = Integer.parseInt(num2);
	dao.deleteTodo(num);
%>
<body>
	<p><%=num %>번이 삭제되었습니다.</p>
	<a href="list.jsp">돌아가기</a>
	
	<script>
		alert("삭제되었습니다.");
		location.href="list.jsp";
	</script>
</body>
</html>