<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	UsersDao dao = UsersDao.getInstance();
	boolean isSuccess = dao.insert(dto);
%>
	
	<%if(isSuccess){ %>
		<p><%=id %>님 가입되었습니다.</p>
		<p>아이디 : <%=id %></p>
		<p>비밀번호 : <%=pwd %></p>
		<p>이메일 : <%=email %></p>
		<a href="loginform.jsp">로그인하러 가기</a>
	<%}else{ %>
		<p>다시 입력해 주세요.</p>
		<a href="signup_form.jsp">다시 가입하기</a>
	<%} %>
</body>
</html>