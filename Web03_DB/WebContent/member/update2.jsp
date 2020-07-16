<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<title>Insert title here</title>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	MemberDto dto = new MemberDto();
	dto.setNum(num);
	dto.setName(name);
	dto.setAddr(addr);
	
	MemberDao dao = MemberDao.getInstance();
	dao.update(dto);
%>
</head>
<body>
	<script>
		alert("정보가 수정되었습니다!");
		location.href="list.jsp";
	</script>
</body>
</html>