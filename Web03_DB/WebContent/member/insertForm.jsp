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
	<div class="navbar navbar-dark bg-primary navbar-expand-sm">
			<a href="${pageContext.request.contextPath }/" class="navbar-brand">Home</a>
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/AddList.jsp">Todo-my</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test/test1.jsp">연습장!!</a></li>
			</ul>
	</div>
	<div class="container">
		<h1>회원 정보 추가 폼 입니다.</h1>
		<form action="insert.jsp" method="post">
			<div class="form-group"></div>
				<label for="name">이름</label>
				<input type="text" name="name" id="name"/>
			</div>
			<div class="form-group">
				<label for="addr">주소</label>
				<input type="text" name="addr" id="addr"/>	
			</div>
			<button class="btn btn-outline=primary" type="submit">전송</button>
			<button class="btn btn-outline=primary" type="reset">취소</button>
		</form>
	</div>
</body>
</html>