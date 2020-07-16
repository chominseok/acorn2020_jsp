<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));


	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getEachList(num);
%>
</head>
<body>
	<div class="navbar navbar-dark bg-primary navbar-expand-sm">
			<a href="${pageContext.request.contextPath }/" class="navbar-brand">Home</a>
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">Member</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">Todo</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/todo/AddList.jsp">Todo-my</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test/test1.jsp">연습장!!</a></li>
			</ul>
		</div>
	<p>-----------------------------------------------------------------------------</p>
	<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
		<li class="breadcrumb-item"><a href="list.jsp">회원목록</a></li>
		<li class="breadcrumb-item active">수정양식</li>
	</ol>
	<h1>수정 전 정보</h1>
	<p><%=dto.getNum() %> : <%=dto.getName() %> : <%=dto.getAddr() %></p>
	
	<form action="update2.jsp" method="post">
		<input type="hidden" name="num" id="num" value="<%=dto.getNum()%>"/>
		<label for="num">번호</label>
		<input type="text" id="num" value="<%=dto.getNum()%>" disabled/>
		<label for="name">이름</label>
		<input type="text" name="name" id="name" value="<%=dto.getName()%>"/>
		<label for="addr">주소</label>
		<input type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
		<button type="submit">전송</button>
	</form>
	<a href="list.jsp">돌아가기</a>
	</div>
</body>
</html>