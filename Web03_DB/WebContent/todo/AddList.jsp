<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 6
	<div class="container">
		<form action="/Web03_DB/todo/AddList2.jsp" method="post">
			
			<label for="num">번호  입력</label>
			<input type="text" name="num" id="num"/>
			<br>
			
			<label for="work">할 일  입력</label>
			<input type="text" name="work" id="work"/>
			<br>
			
			<button type="submit">전송하기</button>
		</form>
		<a href="/Web03_DB/index.jsp">돌아가기</a>
	</div>
</body>
</html>