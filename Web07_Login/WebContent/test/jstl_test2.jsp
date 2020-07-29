<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	//테스트용 sample, request. 영역에 담아놓는다.
	List<String> names = new ArrayList<>();
	names.add("김구라");
	names.add("해골");
	names.add("원숭이");
	names.add("주댕이");
	
	request.setAttribute("list", names);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h1>기본 jsp</h1> 
<%
	//list에 담긴 키 값 얻어오기
	List<String> list = (List<String>)request.getAttribute("list");
	for(String tmp : list){
%>
 		<p><%=tmp %></p> 
<%  } %>
	
	
	<h1>JSTL</h1>
	<p>${list }</p>
	<!-- items에 쓰려면 무슨 영역에서든 들어있어야 한다. > 꺼내쓰기 위해서 -->
	<c:forEach  var="i" items="${list }" >
		<p>${i }</p>
	</c:forEach>
	
	<h1>test</h1>
	<c:forEach  var="i" items="${list }" varStatus="status">
		<p>${i } : <strong>${status.first }</strong></p>
	</c:forEach>
	
	<ul>
	<c:forEach var="tmp" items="${list }" varStatus="status">
		<li data-index="${status.count }">${tmp } <strong>${status.count}</strong></li>
	</c:forEach>
	</ul>
	
	<a href="jstl_test3.jsp">다음 예제</a>
</body>
</html>