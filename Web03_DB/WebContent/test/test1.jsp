<%@page import="java.util.List"%>
<%@page import="test.test.dto.TestDto"%>
<%@page import="test.test.dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	TestDao dao = TestDao.getInstance();
	List<TestDto> list = dao.selectDao();
%>
<body>
	<div>
		<form action="TestInsert.jsp" method="post">
			<label for="content">내용 적기</label>
			<input type="text" name="content" id="content"/>
			<button type="submit">전송</button>
		</form>
		<br>
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>날짜</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(TestDto tmp : list) {%>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td><a href="TestUpdate.jsp?num=<%=tmp.getNum() %>">수정</a></td>
						<td><a href="TestDelete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<br>
	<a href="/Web03_DB/index.jsp">메인으로 돌아가기</a>
</body>
</html>