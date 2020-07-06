<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDto dto = new BoardDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = BoardDao.getInstance().insert(dto);
%>
	
<body>
	<h1>알림</h1>
	<%if(isSuccess){ %>
		<p><strong><%=writer %></strong>님이 작성한 글이 저장되었습니다.</p>
		<a href="list.jsp">확인</a>
	<%}else{ %>
		<p>글 저장에 실패했습니다.</p>
		<a href="insertform.jsp">다시 작성하기</a>
	<%} %>
</body>
</html>