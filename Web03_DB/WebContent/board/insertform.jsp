<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>새 글 작성 폼 입니다.</h1>
	<form action="insert.jsp" method="post">
		<label for="writer">작성자</label>
		<input type="text" name="writer" id="writer"/><br>
		
		<label for="title">제목</label>
		<input type="text" name="title" id="title"/><br>
		
		<label for="content">제목</label>
		<textarea name="content" id="content" cols="30" rows="10"></textarea><br>
		
		<input type="submit" value="등록"/>
		<input type="reset" values="취소"/>
	</form>
</body>
</html>