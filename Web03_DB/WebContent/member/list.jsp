<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<%
	//MemberDao의 객체의 참조값 얻어오기
	MemberDao dao = MemberDao.getInstance();
	//회원 목록 얻어오기
	List<MemberDto> list = dao.getList();
%>
	<div class="container">
		<div class="navbar navbar-dark bg-primary navbar-expand-sm">
			<a href="${pageContext.request.contextPath }/" class="navbar-brand">Home</a>
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/AddList.jsp">Todo-my</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test/test1.jsp">연습장!!</a></li>
			</ul>
		</div>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
			<li class="breadcrumb-item active"><a href="list.jsp">회원목록</a></li>
		</ol>
		<h1>회원 목록입니다.</h1>
		
		<table border = '1'>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<%for(MemberDto tmp : list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getName() %></td>
						<td><%=tmp.getAddr() %></td>
						<%-- <td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td> --%>
						<td><a href="javascript:deleteConfirm(<%=tmp.getNum() %>);">삭제</a></td>
						<td><a href="update.jsp?num=<%=tmp.getNum() %>">수정</a></td>
					</tr>
				<%} %>
			</tbody>
		</table>
		<a href="insertForm.jsp">회원 추가하러 가기</a>
	</div>
	
	<script>
		//삭제 링클를 눌렀을 때 호출되는 함수
		function deleteConfirm(num){
			var isDelete = confirm(num+"번 글을 삭제 하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
		}
	</script>
</body>
</html>