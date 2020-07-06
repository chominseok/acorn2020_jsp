<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDao dao = BoardDao.getInstance();
	
	BoardDto dto = new BoardDto();
	
	dto = dao.getData(num);
%>
<body>
	<h1>수정 할 정보를 입력하세요.</h1>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum()%>"/>
		<label for="num">글번호</label>
		<input type="text" id="num" value="<%=dto.getNum()%>" disabled/><br>
		
		<label for="writer">작성자</label>
		<input type="text" name="writer" id="writer" value="<%=dto.getWriter()%>"/><br>
		
		<label for="title">제목</label>
		<input type="text" name="title" id="title" value="<%=dto.getTitle() %>" /><br>
		
		<label for="content">내용</label>
		<%-- <textarea id="content" cols="30" rows="10"><%=dto.getContent() %></textarea> --%>
		<input type="text" name="content" id="content" value="<%=dto.getContent() %>" /><br>
		
		<input type="hidden" name="regdate" id="regdate" value="<%=dto.getRegdate() %>"/>
		<label for="regdate">날짜</label>
		<input type="text" name="regdate" id="regdate" value="<%=dto.getRegdate() %>" disabled/><br>
		
		<button type="submit">전송</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>