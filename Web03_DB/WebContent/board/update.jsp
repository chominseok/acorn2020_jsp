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
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	
	BoardDto dto = new BoardDto();
	BoardDao dao = BoardDao.getInstance();
	
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setRegdate(regdate);
	dao.update(dto);
%>

<body>

	<p>정보가 수정되었습니다.!</p>
	
	<table>
		<tr>
			<th>글 번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea cols="30" rows="10"><%=dto.getContent() %></textarea></td>
		</tr>
		
		<tr>
			<th>날짜</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	
	<a href="list.jsp">돌아가기</a>
</body>
</html>