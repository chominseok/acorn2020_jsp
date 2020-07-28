<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String condition = request.getParameter("condition");
	String writer = request.getParameter("writer");
	String keyword = request.getParameter("keyword");
%>
<body>
	<form action="testest.jsp" method="post">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어..."/>
		<button type="submit">검색</button>
	</form>
	
	<%if(condition != null){ %>
		<p><%=condition %></p>
	<%} %>
	
	<%if(writer != null){ %>
		<p><%=writer %></p>
	<%} %>
	
	<%if(keyword != null){ %>
		<p><%=keyword %></p>
	<%} %>

</body>
</html>



