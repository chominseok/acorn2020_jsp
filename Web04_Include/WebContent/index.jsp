<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="container">
	<jsp:include page="include/navbar.jsp"></jsp:include>
	<h1>인덱스 페이지 입니다.</h1>
	<ul>   <%-- <@include file>로 만든 서블릿은 통합적이어서 하나의 서블릿에 변수를 선언하면 다른 서블릿에서도 쓸 수 있지만  <<<받아오는 기능만 존재, 전달 x
				jsp:include로 만든 서블릿은 개별적이어서 독립적으로 움직임. (하나의 서블릿에 영향을 받지 않음) --%>
		<li><a href="test1/main.jsp">include 디렉티브</a></li> <%--하나의 서블릿이 main으로 통합되어 응답 --%>
		<li><a href="test2/main.jsp">include 디렉티브2</a></li>
		<li><a href="test3/main.jsp">jsp include</a></li><%--세개의 서블릿이 차례대로 응답 --%>
		<li><a href="test4/main.jsp">jsp include2</a></li>
		<li><a href="test5/home.jsp">home</a></li>
		<li><a href="test5/game.jsp">game</a></li>
		<li><a href="test5/study.jsp">study</a></li>
		<li><a href="test6/home.jsp">navbar include example</a></li>
		<li><a href="test.jsp">test</a></li>
		<li><a href="test2.jsp">test2</a></li>
	</ul>
	</div>
</body>
</html>