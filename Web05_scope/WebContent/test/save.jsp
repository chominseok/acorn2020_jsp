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
	request.setCharacterEncoding("utf-8");
	String nick = request.getParameter("nick");
	
	//HttpSession 객체에 담는다. (session 영역에 담는다.)
	session.setAttribute("nick", nick);
	//새로운 요청을 받지 않았을 때 세션이 닫히는 시간을 설정한다.
	session.setMaxInactiveInterval(100);
	/*
	session 영역에 담은 데이터가 삭제되는 경우
	
	-새로운 요청을 하지않고 30분이 경과했을 때 (default 30분)
	-웹브라우저를 닫았을 때
	-HttpSession 객체의 메소드를 이용해서 제거했을 때
	*/
	
	
%>
	<p><%=nick %> 을(를) 저장했습니다.</p>
	<a href="../index.jsp">인덱스로 이동하기</a>
</body>
</html>