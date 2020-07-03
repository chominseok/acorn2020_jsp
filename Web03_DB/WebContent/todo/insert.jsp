<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String num2 = request.getParameter("num");
	int num = Integer.parseInt(num2);
	String work = request.getParameter("work");
	TodoDao dao = TodoDao.getInstance();
	TodoDto dto = new TodoDto();
	dto.setNum(num);
	dto.setWork(work);
	dao.InsertTodo(dto);
	
	%>
	<p>할 일을 추가 했습니다.  <a href="list.jsp">확인 ㄱ</a></p>
</body>
</html>