<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	System.out.println(email+" || "+phone);
	boolean result = true;
	String name = "김구라";
%>
{"isSuccess": <%=result %>,"name": "<%=name %>","email" : "<%=email%>"}