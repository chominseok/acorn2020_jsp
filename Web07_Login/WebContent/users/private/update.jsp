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
	String id = (String)session.getAttribute("id");
	String email = request.getParameter("email");
	//수정할 프로파일
	String profile = request.getParameter("profile");
	if(profile.equals("null")){ //프로필 이미지를 수정하지 않으면
		profile = null;
	}
	
	
	UsersDto dto = new UsersDto();
	dto.setId(id);
	dto.setEmail(email);
	dto.setProfile(profile);
	UsersDao dao = UsersDao.getInstance();
	boolean isValid = dao.updateEmail(dto);
%>
<body>
	<%if(isValid){ %>
		<p>이메일을 수정했습니다. <a href="${pageContext.request.contextPath }/users/private/info.jsp">확인</a></p>
	<%}else{ %>
		<p>
			이메일 수정에 실패하였습니다.
			<a href="${pageContext.request.contextPath }/users/private/updateform.jsp">다시 시도</a>
		</p>
	<%} %>
</body>
</html>