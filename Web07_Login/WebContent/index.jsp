<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<c:if test="${not empty sessionScope.id }">
			<p><a href="users/private/info.jsp"><strong>${id }</a>님 안녕하세요.</strong></p>
			<a href="users/logout.jsp">로그아웃하기</a>
		</c:if>
		<h1>인덱스 페이지입니다.</h1>
		<ul>
			<c:if test="${empty sessionScope.id }">
				<li><a href="users/signup_form.jsp">회원가입</a></li>
				<li><a href="users/loginform.jsp">로그인</a></li>
			</c:if>
			
			<li><a href="test/buy.jsp?code=111">111번 상품 구입 테스트</a></li>
			<li><a href="ajax/test01.jsp">ajax 테스트</a></li>
			<li><a href="ajax/test02.jsp">ajax 테스트2</a></li>
			<li><a href="ajax/test03.jsp">ajax 테스트3</a></li>
			<li><a href="file/list.jsp">자료실 목록 보기</a></li>
			<li><a href="gallery/test.jsp">이미지 업로드 테스트</a></li>
			<li><a href="gallery/test2.jsp">ajax 이미지 업로드 테스트</a></li>
			<li><a href="gallery/list.jsp">이미지 갤러리</a></li>
			<li><a href="test/editor.jsp">SmartEditor</a></li>
			<li><a href="cafe/list.jsp">카페 글 목록 보기</a></li>
			<li><a href="test/scroll.jsp">scroll 테스트</a></li>
			<li><a href="test/cookie_form.jsp">cookie test1</a></li>
			<li><a href="test/cookie_form2.jsp">cookie test2</a></li>
			<li><a href="test/cookie_form3.jsp">cookie test3</a></li>
			<li><a href="test/popup.jsp">팝업 test1</a></li>
			<li><a href="test/popup2.jsp">팝업 test2</a></li>
			<li><a href="chominseok/list.jsp">조민석 테스트</a></li>
			<li><a href="chominseok/cookie.jsp">조민석 쿠키 테스트</a></li>
			<li><a href="test/el_test.jsp">EL test</a></li>
			<li><a href="test/jstl_test.jsp">jstl test</a></li>
		</ul>
	</div>
</body>
</html>
