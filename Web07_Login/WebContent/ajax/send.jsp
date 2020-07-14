<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg");
	System.out.println(msg);
//  key type으로는 [], {}, String, number, boolean  나머지는 오류
%>

{"isSuccess" : true}