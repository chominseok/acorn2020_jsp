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
<%
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto();
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String name2 = request.getParameter("name2");
	String addr2 = request.getParameter("addr2");
	dto.setNum(num2);
	dto.setName(name2);
	dto.setAddr(addr2);
	dao.update(dto);
	
	response.sendRedirect("list.jsp");
%>
</head>
<body>
	<script>
		//alert("정보가 수정되었습니다!");
		//location.href="list.jsp";
	</script>
</body>
</html>