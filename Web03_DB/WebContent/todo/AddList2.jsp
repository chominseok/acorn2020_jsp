<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String num2 = request.getParameter("num");
	String work = request.getParameter("work");
	
	int num = Integer.parseInt(num2);
	
	TodoDto dto = new TodoDto();
	dto.setNum(num);
	dto.setWork(work);
	
	if(num2 != null && work != null){	
%>
<%} %>
<body>
	<%
		TodoDao dao = TodoDao.getInstance();
		dao.InsertTodo(dto);
	%>
	<h1>할 일 목록에 추가합니다.</h1>
	<p>work = <%=work %></p>
	<a href="/Web03_DB/todo/AddList.jsp">돌아가기</a>
	<script>
		alert("안녕!");
	</script>
</body>
</html>