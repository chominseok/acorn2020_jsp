<%@page import="test.Dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Web02_Servlet/css/bootstrap.css" />
</head>
<body>
	<h1>회원목록</h1>
	<div class='container'>
	<table class="table table-danger">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
		<% 
			List<MemberDto> list = new ArrayList<>();
			list.add(new MemberDto(1, "김구라", "노량진"));
			list.add(new MemberDto(2, "해골", "행신동"));
			list.add(new MemberDto(3, "원숭이", "상도동"));
			
			for(MemberDto tmp : list){
		%>
			<tr>
				<td><%= tmp.getNum()%></td>
				<td><%= tmp.getName()%></td>
				<td><%= tmp.getAddr()%></td>
			</tr>
		<%}%>
	</table>
	</div>
</body>
</html>