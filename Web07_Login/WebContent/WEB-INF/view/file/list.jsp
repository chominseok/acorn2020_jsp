<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>파일 목록입니다.</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
		</tr>
		<c:forEach var="tmp" items="${list}">	
			<tr>
				<td>${tmp.num}</td>
				<td>${tmp.writer}</td>
				<td>${tmp.title}</td>
			</tr>
	</c:forEach>
	</table>
</body>
</html>