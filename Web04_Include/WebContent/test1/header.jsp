<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String str = request.getParameter("num");
%>
<div style="height : 200px; background-color : yellow">
		header
		<%if(str != null){ %>
		<%=str %>
		<%} %>
</div>