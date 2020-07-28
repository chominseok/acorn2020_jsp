<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = request.getParameter("msg");
	
	//1. 쿠키 객체 생성 new Cookie("key", value);
	Cookie cook = new Cookie("savedMsg", msg);
	
	//2. 쿠키 유지시간(초단위)
	cook.setMaxAge(60);
	
	//3. HttpServletResponse 객체에 담는다.
	response.addCookie(cook);	
	//4.응답할 때 쿠키가 자동으로 응답되고 클라이언트의 웹브라우저에 저장이 된다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>웹 브라우저에 savedMsg 라는 키값으로 <%=msg %> 를 저장했습니다.</p>
	<a href="cookie_read.jsp">저장된 문자열 확인해보기</a>
</body>
</html>