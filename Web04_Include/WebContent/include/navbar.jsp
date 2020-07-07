<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /include/navbar.jsp--%>
<%
	//요청 파라미터 읽어내기
	String thisPage = request.getParameter("thisPage");
%>
<div class="container">
<div class="navbar navbar-dark bg-primary navbar-expand-sm">
	<a href="${pageContext.request.contextPath }/" class="navbar-brand">Main</a>
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test1/main.jsp" active>test1.main</a></li>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test2/main.jsp">test2.main</a></li>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test3/main.jsp">test3.main</a></li>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test4/main.jsp">test4.main</a></li>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test5/home.jsp">home</a></li>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test5/game.jsp">game</a></li>
		<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test5/study.jsp">study</a></li>
	</ul>
</div>
</div>
<div>
	
</div>