<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	include 디렉티브를 이용해서 jsp 페이지를 include 하면
	해당 페이지에 include 된 jsp 페이지가 통합되어서 jsp 페이지가 만들어진다.
	
	!! 위에서 쓴 변수를 쓸 수 있을까?
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<h1>main.jsp 페이지 입니다.<%=name %></h1>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quisquam necessitatibus repellendus harum itaque cupiditate architecto provident delectus nihil qui commodi officiis culpa quaerat dicta velit porro sit veniam inventore consequuntur!</p>
	<a href="other.jsp">다른 페이지</a>
	<%@include file="footer.jsp" %>
</body>
</html>