<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto();
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	dto.setName(name);
	dto.setAddr(addr);
	dao.insert(dto);
%>
<body>
	<script>
		alert("추가되었습니다!");
		location.href="list.jsp";
	</script>
</body>
</html>