<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>잡동사니 실험하기</h1>
	<h2>1~10까지 반복문 돌면서 출력</h2>
	<%for(int i = 0; i < 9; i++){ %>
		<p><%= i%></p>
	<%}%>
	
	
</body>
</html>