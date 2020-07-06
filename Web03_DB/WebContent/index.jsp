<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />

</head>
<body>
	<!--get 방식에서는 주소 뒤에 ? 를 붙여서 파라미터를 가져올 수 있다. -->
	<div class="container">
		<div class="navbar navbar-dark bg-primary navbar-expand-sm">
			<a href="${pageContext.request.contextPath }/" class="navbar-brand">Home</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/AddList.jsp">Todo-my</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test/test1.jsp">연습장!!</a></li>
			</ul>
		</div>
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="member/list.jsp">회원 목록 보기</a></li>
			<li><a href="todo/list.jsp">할 일 목록 보기</a></li>
			<li><a href="board/list.jsp">방명록 보기</a></li>
		</ul>
	</div>
</body>
</html>
<!--  input 속성으로 disabled 를 추가하면 name 전송은 안되는 단순히 보기 기능만 되는 html이 작성된다 
	>>>>  input type="hidden"을 추가하여 화면상으로 보이지 않는 name을 전송할 수 있는 코드를 작성해준다.
-->

<!-- 이 주석은 jsp가 해석한다. 페이지 소스에 출력함 -->      <%-- 이 주석은 jsp가 해석하지 않는다. 페이지 소스에 출력 x--%>