<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Maven Repository에서 jstl jar파일을 받은 뒤 lib에 넣고 태그넣기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL (jsp Standard Tag Library)</h1>
	<c:forEach var="i" begin="1" end="5">
		<p>안녕 ${i }</p>
	</c:forEach>
	
	<h1>기본 jsp</h1>
	<%for(int i = 1; i <= 5; i++){ %>
		<p>안녕 <%=i %></p>
	<%} %>
	
	<a href="jstl_test2.jsp">다음 예제</a>
</body>
</html>