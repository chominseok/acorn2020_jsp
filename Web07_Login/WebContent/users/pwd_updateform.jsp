<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
</head>
<%
	//세션영역에서 id를 받아온뒤 > dao에 비밀번호를 select하는 메소드를 만든 다음
	//비밀번호를 얻어오고 !!!! input hidden type 을 만들어 pwd와 비교를 한 뒤 
	//if 문 작성!
	String id = (String)session.getAttribute("id");
	UsersDao dao = UsersDao.getInstance();
	UsersDto dto = dao.getPwd(id);
%>
<body>
	<div class="container">
		<h1>비밀번호 수정하기</h1>
		<form action="pwd_update.jsp" mehotd="post" id="myForm">
			<div class="form-group">
				<input type="hidden" name = "pwd2" value="<%=dto.getPwd() %>" id="pwd2"/>
				<label for="pwd">기존 비밀번호</label>
				<input type="password" name="pwd" id="pwd"/>
			</div>
			<div class="form-group">
				<label for="newPwd">새 비밀번호</label>
				<input type="password" name="newPwd" id="newPwd"/>
			</div>
			<div class="form-group">
				<label for="newPwd2">새 비밀번호</label>
				<input type="password" name="newPwd2" id="newPwd2"/>
			</div>
			<button type="submit">수정하기</button>
		</form>
	</div>
	<script>
		$('#myForm').on("submit",function(){
			var pwd1 = $('#newPwd').val();
			var pwd2 = $('#newPwd2').val();
			
			var pwd3 = $('#pwd').val();
			var pwd4 = $('#pwd2').val();
			
 			if(pwd3 != pwd4){
 				alert("기존 비밀번호가 일치하지 않습니다.");
 				$('#pwd').val("").focus();
 				
 				if(pwd1 != pwd2){
 					alert("비밀번호가 일치하지 않습니다.");
 					$('#newPwd').val("").focus();
 					$('#newPwd2').val("");
 					return false;
 				}
 				return false;
 			} 
			
			
		});
	</script>
</body>
</html>