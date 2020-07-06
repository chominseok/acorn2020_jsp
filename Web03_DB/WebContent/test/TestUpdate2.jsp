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
	TestDto dto = new TestDto();
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	dto.setNum(num);
	dto.setContent(content);
	dto.setRegdate(regdate);
	dao.updateDao(dto);
%>

<p><%=dto.getNum() %> : <%=dto.getContent() %> : <%=dto.getRegdate() %> </p>
<a href="test1.jsp">돌아가기</a>
</body>
</html>