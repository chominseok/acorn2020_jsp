<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//세션 영역에 "nick" 이라는 키값으로 저장된 값 삭제하기
	session.removeAttribute("nick");
	//ssesion.invalidate(); 세션에 지정된 모든 값 삭제
%>

	<script>
		alert("세션이 삭제되었습니다!");
		location.href="../index.jsp";
	</script>
</body>
</html>