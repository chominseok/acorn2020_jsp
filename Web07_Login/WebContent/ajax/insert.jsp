<%@ page language="java" contentType="application/jason; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	System.out.println(email+" || "+phone);
%>
{"isSuccess", true}