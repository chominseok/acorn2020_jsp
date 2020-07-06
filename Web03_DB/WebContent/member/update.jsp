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
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getEachList(num);
%>
</head>
<body>
	<%-- <h1>내가 한 수정 전 정보</h1>
	<table border = 1>
		<thead>
			<td>번호</td>
			<td>이름</td>
			<td>주소</td>
		</thead>
		<tr>
			<td><%=num %></td>
			<td><%=name %></td>
			<td><%=addr %></td>
		</tr>
	</table>
	
	
	<h2>내가 한 수정 할 정보 입력</h2>
	<form action="update2.jsp" method="post">
		<input type="hidden" name="num2" value="<%=num %>"/>
		<label for="num2">번호</label>
		<input type="text"  id="num2" value="<%=num %>" disabled/>
		
		<label for="name2">이름</label>
		<input type="text" name="name2" id="name2"/>
		
		<label for="addr2">주소</label>
		<input type="text" name="addr2" id="addr2"/>
		<button type="submit">전송</button>
	</form> --%>
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
	
	<h2>수정 할 정보 입력</h2>
	<form action="update2.jsp" method="post">
		<input type="hidden" name="num2" value="<%=dto.getNum() %>"/>
		<label for="num2">번호</label>
		<input type="text"  id="num2" value="<%=dto.getNum() %>" disabled/>
		
		<label for="name2">이름</label>
		<input type="text" name="name2" id="name2" value="<%=dto.getName() %>"/>
		
		<label for="addr2">주소</label>
		<input type="text" name="addr2" id="addr2" value="<%=dto.getAddr() %>"/>
		<button type="submit">전송</button>
	</form>
	<a href="list.jsp">돌아가기</a>
	</div>
</body>
</html>