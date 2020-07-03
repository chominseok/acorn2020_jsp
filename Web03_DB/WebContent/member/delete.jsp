<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	MemberDao dao = MemberDao.getInstance();
	String num2 = request.getParameter("num");
	int num = Integer.parseInt(num2);
	dao.delete(num);
	
	//회원 목록보기 요청을 하도록 강요한다. (redirect)
	String cPath = request.getContextPath();
	
	//response.sendRedirect(cPath+"/member/list.jsp");
	response.sendRedirect("list.jsp");
%>
</head>
<body>
	<script>
		//alert("삭제되었습니다!");
		//location.href="list.jsp";
	</script>
</body>
</html>