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
	String isSave = request.getParameter("isSave");
	
	if(isSave == null){
		Cookie idcook = new Cookie("id",id);
		idcook.setMaxAge(0);
		response.addCookie(idcook);
		
		Cookie pwdcook = new Cookie("pwd",pwd);	
		pwdcook.setMaxAge(0);
		response.addCookie(pwdcook);
	}else{
		Cookie idcook = new Cookie("id",id);
		idcook.setMaxAge(60);
		response.addCookie(idcook);
		
		Cookie pwdcook = new Cookie("pwd",pwd);	
		pwdcook.setMaxAge(60);
		response.addCookie(pwdcook);
	}
%>

<h1><%=id %>님이 로그인하셨습니다!</h1><a href="cookie.jsp">ㅇㅋ</a>
</body>
</html>