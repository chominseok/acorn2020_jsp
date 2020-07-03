<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	TodoDao dao = TodoDao.getInstance();
	List<TodoDto> list = dao.todoList();
	
%>
	<div class="container"> 
		<div class="navbar navbar-dark bg-primary navbar-expand-sm">
			<a href="${pageContext.request.contextPath }/" class="navbar-brand">Home</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/AddList.jsp">Todo-my</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test/test1.jsp">연습장!!</a></li>
			</ul>
		</div>
		<h1>할 일 목록 입니다.</h1>
		<form action="/Web03_DB/todo/insert.jsp" method="post">
			<div class="form-group">
				<input class="form-control" type="text" name="num"/>
				<small class="form-text text-muted">순위를 입력하세요.</small>
			</div>
			
			<div class="form-group">
				<input class="form-control" type="text" name="work"/>
				<small class="form-text text-muted">할 일을 입력하세요.</small>
			</div>
			<button class="btn btn-primary" type="submit">추가</button>
		</form>
		<br>
		<table class="table table-primary table-sm" border="1" cellspacing="0">
			<thead>
				<tr>
					<th>순위</th>
					<th>할 일</th>
					<th>메모한 시간</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(TodoDto tmp : list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWork() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td class="table-danger"><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<a href="/Web03_DB/index.jsp">돌아가기</a>
	</div>
	
</body>
</html>