<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	FileDto dto = (FileDto)request.getAttribute("dto");
%>
	<h1>EL로 추출하기</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>orgFileName</th>
			<th>saveFileName</th>
			<th>파일 사이즈</th>
			<th>날짜</th>
		</tr>
		<tr>
			<td>${dto.num }</td>
			<td>${dto.writer}</td>
			<td>${dto.title}</td>
			<td>${dto.orgFileName}</td>
			<td>${dto.saveFileName}</td>
			<td>${dto.fileSize}</td>
			<td>${dto.regdate}</td>
		</tr>
	</table>
	<hr>
	<h1>기본 문법으로 추출하기</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>orgFileName</th>
			<th>saveFileName</th>
			<th>파일 사이즈</th>
			<th>날짜</th>
		</tr>
		<tr>
			<td><%=dto.getNum() %></td>
			<td><%=dto.getWriter() %></td>
			<td><%=dto.getTitle() %></td>
			<td><%=dto.getOrgFileName() %></td>
			<td><%=dto.getSaveFileName() %></td>
			<td><%=dto.getFileSize() %></td>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
</body>
</html>