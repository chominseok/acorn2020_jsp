<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL을 이용해서 파라미터도 추출할 수 있다.</h1>
	<p>번호 : <strong>${param.num }</strong></p>
	<p>이름 : <strong>${param.name }</strong></p>
	
	<!-- EL을 사용하지 않는 다면 -->
	<h1>request.get으로 추출</h1>
<%
	String num = request.getParameter("num");
	String name = request.getParameter("name");
%>
	<p>번호 : <strong><%=num %></strong></p>
	<p>이름 : <strong><%=name %></strong></p>
	
	<h1>EL을 이용해서 쿠키 VALUE도 추출할 수 있다.</h1>
	<p>savedMsg라는 키 값으로 저장되어 있는지 여부 : ${not empty cookie.savedMsg }</p>
	<p>savedMsg라는 키 값으로 저장된 cookie : <strong>${cookie.savedMsg.value }</strong></p>
	
</body>
</html>