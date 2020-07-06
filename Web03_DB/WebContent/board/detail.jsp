<%@page import="test.board.dto.BoardDto"%>
<%@page import="test.board.dao.BoardDao"%>
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
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDto dto = new BoardDto();
	BoardDao dao = BoardDao.getInstance();
	dto = dao.getData(num);
%>
<body>
	<h1>글 정보</h1>

	<table>
		<tr>
			<th>글 번호</th>
			<td><%=dto.getNum()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
			<th>제목</th>
			<td><%=dto.getTitle()%></td>
		<tr>
			<th>내용</th>
			<td><textarea cols="30" rows="10"><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=dto.getRegdate()%></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<a href="updateform.jsp?num=<%=dto.getNum()%>">수정</a>
				<%-- <a href="delete.jsp?num=<%=dto.getNum()%>">삭제</a> --%>
				<a href="javascript:deleteConfirm(<%=dto.getNum()%>);">삭제</a>
			</td>
		</tr>
	</table>
	
	<script>
		function deleteConfirm(num){
			var isDelete = confirm(num+"번 글을 삭제하시겠습니까?")
			
			if(isDelete){
				location.href="delete.jsp?num="+num;
				alert(num+"번 삭제가 완료되었습니다.");
			}
		}
	</script>
</body>
</html>