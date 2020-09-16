<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#profileImage{
		width : 50px;
		heigth : 50px;
		border : 1px solid black;
		border-radius : 50%;  
	}
</style>
</head>
<%
	String id = (String)session.getAttribute("id");
	UsersDao dao = UsersDao.getInstance();
	UsersDto dto = dao.getData(id);
%>
<body>
	<div class="container">
		<h1><%=id %>님의 회원정보</h1>
		
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th><a href="pwd_updateform.jsp">비밀번호</a></th>
					<th>프로필 이미지</th>
					<th>이메일</th>
					<th>업로드 경로</th>
					<th>가입 날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=id %></td>
					<td><%=dto.getPwd() %></td>
					<td><img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getProfile()%>"></td>
					<td><%=dto.getEmail() %></td>
					<td><%=dto.getProfile() %></td>
					<td><%=dto.getRegdate() %></td>
				</tr>
			</tbody>
		</table>
		<a href="updateform.jsp">개인정보 수정</a>
		<a href="javascript:deleteConfirm()">탈퇴</a>
	</div>
	<a href="../../index.jsp">인덱스로 가기</a>
<script>
	function deleteConfirm(){
		var isDelete = confirm("<%=id%> 회원님 탈퇴하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>