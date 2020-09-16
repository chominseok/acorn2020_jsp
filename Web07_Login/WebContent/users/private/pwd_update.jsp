
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String pwd = request.getParameter("pwd");
	String newPwd = request.getParameter("newPwd");
	String id = (String)session.getAttribute("id");
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);

	UsersDao dao = UsersDao.getInstance();
// 	boolean isValid = dao.updatePwd2(dto);
%>
<body>

<%-- <%if(isValid){ %> --%>
	<p>비밀 번호를 수정했습니다. <a href="${pageContext.request.contextPath }/users/private/info.jsp">확인</a></p>
<%-- <%}else{ %> --%>
	<p>
		이번 비밀번호가 일치 하지 않습니다.
		<a href="${pageContext.request.contextPath }/users/private/pwd_updateform.jsp">다시 시도</a>
	</p>
<%-- <%} %> --%>
</body>
</html>