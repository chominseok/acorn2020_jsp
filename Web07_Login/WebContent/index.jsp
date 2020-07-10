<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<%
	//id라는 키 값으로 세션에 저장된 문자열이 있는지 읽어와 본다.
	String id = (String)session.getAttribute("id");
%>
<body>
	<div class="container">
		<%if(id != null){ %>
			<p><a href="users/info.jsp"><strong><%=id %></a>님 안녕하세요.</strong></p>
			<a href="users/logout.jsp">로그아웃하기</a>
		<%}else{ %>
			<h1>인덱스 페이지입니다.</h1>
			<ul>
				<li><a href="users/signup_form.jsp">회원가입</a></li>
				<li><a href="users/loginform.jsp">로그인</a></li>
			</ul>
		<%} %>
	</div>
</body>
</html>