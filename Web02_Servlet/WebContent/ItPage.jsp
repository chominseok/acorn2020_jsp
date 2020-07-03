<%@page import="cms.Insert"%>
<%@page import="test.Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String area = request.getParameter("area");
	String[] hobby = request.getParameterValues("hobby");
	String num = request.getParameter("num");
	String comment = request.getParameter("comment");
	
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setAddr(area);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Insert i = new Insert();
	i.add(dto);
	%>
	
	<p>Db에 저장 될 이름은 <strong><%=name %></strong> 주소는 <strong><%=area %></strong></p>
	<div>
		<h1>허접한 자기소개</h1>
		<p>안녕하세요 저의 이름은  <strong><%=name %></strong> 입니다.</p>
		<p>나이는<strong> <%=age %></strong>살 이고, 사는 곳은 <strong><%=area %></strong>입니다.</p>
		<p>취미는 
			<%for(String tmp : hobby){ %>
				<strong><%=tmp %></strong>
			<%} %>
		이며 좋아하는 숫자는 <strong><%=num %></strong>입니다.</p>
		<p>하고 싶은 말은 <strong><%=comment %></strong>입니다.</p>
	</div>
</body>
</html>