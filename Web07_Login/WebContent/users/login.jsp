<%@page import="java.net.URLEncoder"%>
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
<%
	//로그인 후 가야하는 목적지 정보
	String url = request.getParameter("url");
	//목적지 정보도 미리 인코딩이 해 놓는다.
	String encodedUrl = URLEncoder.encode(url);
	

	//1.폼 전송되는 아이디와 비밀번호를 읽어온다.
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//2.db에 실제로 존재하는지 확인한다.
	UsersDto dto = new UsersDto();
	UsersDao dao = UsersDao.getInstance();
	dto.setId(id);
	dto.setPwd(pwd);
	//3.유효한 정보면 로그인 처리를 하고 응답
	boolean isVlid = dao.isValid(dto);
%>
<body>
	<%if(isVlid){
		session.setAttribute("id", id); 
	%>
		<p><%=id %>님 로그인 되었습니다.  <a href="<%=url%>"확인></a></p>
		 <a href="../index.jsp">확인</a>
	<%}else{ %>
		<p>로그인에 실패하였습니다.</p>
		<a href="loginform.jsp?url=<%=encodedUrl%>">다시 시도</a>
	<%} %>
</body>
</html>