<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송되는 문자열에 한글이 있다면 깨지지 않도록 인코딩 설정
	request.setCharacterEncoding("utf-8");
	
	//input의 text type의 id,pwd value 값 받아오기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//input의 radio type value 값 받아오기
	String gender = request.getParameter("gender");
	
	//select-option의 value 값 받아오기   !!multiple="multiple" 일때???? ㅇㅇ []
	String[] job = request.getParameterValues("job");
	
	//input type checkbox의 value 여러개 값 받아오기
	String[] like = request.getParameterValues("like");
	
	//textarea의 value 값 받아오기
	String comment = request.getParameter("comment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup.jsp</title>
</head>
<body>
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pwd %></p>
	<p>성별 : <%=gender %></p>
	<p>직업 :</p>
	<ul>
		<%for(String tmp : job){ %>
			<li><%=tmp %></li>
		<%}%>
	</ul>
	<p>관심사 : </p>
	<ul>
		<%for(String tmp : like) {%>
			<li><%=tmp %></li>
		<%} %>
	</ul>
	<p>하고싶은 말 : <%=comment %></p>
</body>
</html>