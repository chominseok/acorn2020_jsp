<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	// 개행기호를 가지고 있는 content
	String content = request.getParameter("content");

	//test용 request 영역에 담아준다.
	request.setAttribute("content", content);
	//페이지 영역에 newLine 이라는 키값으로 개행기호 담기
	request.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jstl 함수 사용해 보기</h1>
<%-- 	<c:set var="newLine" value="\n"/> --%>
	<p>${fn: replace(content, newLine, '<br/>') }</p>
</body>
</html>