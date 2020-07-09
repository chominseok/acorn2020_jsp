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
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	boolean isValid = false;
	//db를 긁으면서 정보가 있는지 확인
	if(id.equals("구라") && pwd.equals("1234")){
		isValid = true;
		//세션 영역에 id라는 키값으로 아이디를 담는다.
		session.setAttribute("id", id);	
%>
	<%} %>

	<%if(isValid){ %>
		<p><%=id%> 님 로그인 되었습니다. <a href="../index.jsp">확인</a></p>
	<%}else{ %>
		<p>아이디 혹은 비밀번호가 틀렸습니다. <a href="../index.jsp">다시시도</a></p>
	<%} %>
</body>
</html>