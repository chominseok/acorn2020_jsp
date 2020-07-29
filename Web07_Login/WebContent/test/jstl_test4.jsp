<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//test를 위해 
	request.setAttribute("jumsu", 77);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- test에 들어있는 조건이 true면 함수 실행 -->
	<c:if test="${10%2 eq 0 }">
		<p>10은 짝수입니다.</p>
	</c:if>
	
	<hr>
	
	<c:if test="${not empty sessionScope.id }">
		<p><strong>${id }</strong>님 로그인 중.....</p>
	</c:if>
	
	<hr>
	
	<p>획득한 점수는 <strong>${requestScope.jumsu }</strong>입니다.</p>
	<p>
		학점은
		<!--  if else문이 없는 jstl을 위해  사용    switch문과 비슷-->
		<c:choose>
			<c:when test="${jumsu ge 90 }">A</c:when>
			<c:when test="${jumsu ge 80 }">B</c:when>
			<c:when test="${jumsu ge 70 }">C</c:when>
			<c:when test="${jumsu ge 60 }">D</c:when>
			<c:otherwise>F</c:otherwise>
		</c:choose>
		입니다.
	</p>
	
	<hr>
	
	<p>
		<strong>${jumsu }</strong>(은)는
		<c:choose>
			<c:when test="${jumsu % 2 eq 0 }">
				<strong>짝수</strong>
			</c:when>
			<c:otherwise>
				<strong>홀수</strong>
			</c:otherwise>
		</c:choose>
		입니다.
	</p>
	
	<a href="jstl_test5.jsp">다음 예제</a>
</body>
</html>