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
		<li class="nav-item <%if(thisPage.equals("home")){%>active<%}%>"><a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">home</a></li>
		<li class="nav-item <%if(thisPage.equals("game")){%>active<%}%>"><a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">game</a></li>
		<li class="nav-item <%if(thisPage.equals("study")){%>active<%}%>"><a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">study</a></li>
	</ul>
</div>
</div>
<div>
	
</div>