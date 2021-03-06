<%@page import="test.board.dao.BoardDao"%>
<%@page import="java.util.List"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<%
	List<BoardDto> list = BoardDao.getInstance().getList();
%>
<body>
	<div class="container">
	<h1>글 목록 입니다.</h1>
	<table border='1' class="table table-primary table-sm" >
		<thead>
			<tr>
				<th>글 번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%for(BoardDto tmp : list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a></td>
					<td><%=tmp.getRegdate() %></td>
				</tr>
			<%} %>
		</tbody>
	</table>
	<a href="insertform.jsp">글 추가하기</a>
	<a href="/Web03_DB/index.jsp">메인으로 돌아가기</a>
	</div>
</body>
</html>