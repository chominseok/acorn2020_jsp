<%@page import="test.board.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDao dao = BoardDao.getInstance();
	dao.delete(num);
	
	/*String cPath = request.getContextPath();  
	  response.sendRedirect(cpath+"/board/list.jsp");
	*/
	
%>
<body>
	<script>
		alert("삭제가 완료되었습니다.");
		location.href="list.jsp";
	</script>
</body>
</html>