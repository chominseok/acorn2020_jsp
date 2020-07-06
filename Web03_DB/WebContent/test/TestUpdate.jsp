<%@page import="test.test.dto.TestDto"%>
<%@page import="test.test.dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	TestDao dao = TestDao.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	
	TestDto dto = dao.selectEachDao(num);
%>

	
	<form action="TestUpdate2.jsp" method="post">
		<input type="hidden" name = "num" id="num" value="<%=dto.getNum() %>"/>
		<label for="num">번호</label>
		<input type="text" id="num" value="<%=dto.getNum() %>" disabled/><br>
		
		<label for="content">내용</label>
		<input type="text" name="content" id="content" value="<%=dto.getContent() %>"/><br>
		
		<label for="regdate">날짜</label>
		<input type="text" id="regdate" name="regdate" value="<%=dto.getRegdate() %>"/>
		<button type="submit">전송</button>
	</form>
</body>
</html>
