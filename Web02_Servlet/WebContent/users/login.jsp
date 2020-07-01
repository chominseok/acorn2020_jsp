<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Web02_Servlet/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<% 
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");	
			String pwd = request.getParameter("pwd");	
			if(id.equals("구라") && pwd.equals("1234")){
		%>
			<p class="alert alert-success"><%=id %>님이 로그인 되었습니다.</p>
		<%} else{%>
			<p class="alert alert-danger">로그인에 실패하였습니다.</p>
		<%} %>
	</div>
</body>
</html>