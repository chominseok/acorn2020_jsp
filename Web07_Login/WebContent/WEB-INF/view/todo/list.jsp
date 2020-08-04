<%@page import="java.util.List"%>
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
<%
	List<String> list = (List<String>)request.getAttribute("todoList");
	String todo = null;
%>
	<h1>EL , JSTL을 이용해서 추출하기</h1>
	<ul>
		<c:forEach var="tmp" items="${todoList }">
			<li>${tmp }</li>
		</c:forEach>
	</ul>
	
	<hr/>
	
	<h1>for-each문을 이용해서 추출하기</h1>
	<ul>
		<%for(String tmp : list){ %>
			<li><%=tmp %></li>
		<%} %>
	</ul>
	
	<hr/>
	
	<h1>기본 for문을 이용해서 추출하기</h1>
	<ul>
		<%for(int i = 0; i < list.size(); i++){ %>
			<li><%=todo = list.get(i) %></li>
		<%} %>
	</ul>

</body>
</html>