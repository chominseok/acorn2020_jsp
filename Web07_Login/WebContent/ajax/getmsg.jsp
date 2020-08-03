<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	System.out.println(num+"|"+name+num+"|"+name);
	/*{"" : ""}  jason은 따옴표 형식을 지켜야한다.  */
	%>

{"msg" : "안녕 클라이언트야~", "num" : <%=num %>, "name" : "<%=name %>"}
	
