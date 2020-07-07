<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--/include/navbar2.jsp--%>
<%
	String thisPage = request.getParameter("thisPage");
	
%>


<div class="navbar navbar-dark bg-primary navbar-expand-sm">
	<a href="${pageContext.request.contextPath }/" class="navbar-brand">Main</a>
	<ul class="navbar-nav">
		<%if(thisPage.equals("home")){ %>
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/test6/home.jsp">home</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">game</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">study</a></li>
		<%}else if(thisPage.equals("game")){ %>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">home</a></li>
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/test6/game.jsp">game</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/study.jsp">study</a></li>
		<%}else if(thisPage.equals("study")){ %>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/home.jsp">home</a></li>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/test6/game.jsp">game</a></li>
			<li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/test6/study.jsp">study</a></li>
		<%} %>
		
	</ul>
</div>


