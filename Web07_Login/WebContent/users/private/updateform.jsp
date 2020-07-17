<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
<style>
	#profileImage{
		width : 200px;
		height : 200px;
		border : 1px solid black;
		border-radius : 50%;
		curser : pointer;
	}
</style>
</head>
<%
	String id = (String)session.getAttribute("id");
	UsersDto dto = new UsersDto();

	dto = UsersDao.getInstance().getDate(id);
%>
<body>
	<div class="container">
		<h1>회원정보 수정 폼 입니다.</h1>
		<%if(dto.getProfile() == null){ %>
			<img id="profileImage" src="${pageContext.request.contextPath }/images/kim1.png"/>
		<%}else{ %>
			<img id="profileImage" src="${pageContext.request.contextPath }<%=dto.getProfile()%>"/>
		<%} %>
		<form action="update.jsp" method="post">
			<input type="hidden" name="profile" id="profile" value="<%=dto.getProfile()%>"/>
			<div class="form-group">
				<label for="id">아이디</label>
				<input type="text" id="id" value="<%=id%>" disabled/>
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input type="text" id="email" name = "email" value="<%=dto.getEmail()%>"/>
			</div>
			<button type="submit">수정확인</button>
			<button type="reset">취소</button>
		</form>
		
		<form id="profileForm" action="profile_upload.jsp" method="post" enctyp="multipart/form-data">
			<input style="display : none;" id="image" type="file" name="image" accept=".jpg, .jpeg, .JPG, .JPEG"/>
		</form>
	</div>
	<script>
		$('#profileImage').on('click',function(){
			//input type="file" 을 클릭한다. >> img를 선택하면 change event 가 실행된다.
			$('#image').click();	
		});
		
		//이미지를 선택했을 때 실행할 함수 등록
		$('#image').on('change',function(){
			//폼을 강제 제출한다.
			$('#profileForm').submit();
		});
		
		//폼이 ajax로 제출될 수 있또록 플러그인을 동작 시킨다.
		$('#profileForm').ajaxForm(function(data){
			//프로필 이미지를 업데이트 한다.
			$('#profileImage').attr("src","${pageContext.request.contextPath }"+data.imageSrc);
			//회원정보 수정폼이 전송될 때 dto.getProfile()도 null을 방지하기 위해서 같이 전송 되도록 한다.
			$('#profile').val(data.imageSrc);  //input type="hidden"의 value 값
		});
	</script>
</body>
</html>