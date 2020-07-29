<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String myName = "김구라";
	//page Scope에 myName이라는 키값으로 담기
	//page Scope에 담은 값은 해당 페이지(jsp)내에서만 사용할 수 있다.
	pageContext.setAttribute("myName", myName); //page 영역에 담은 내용을 EL이 읽어낼 수 있다.
	
	String yourName = "해골";
	/*
		request scope에 yourName 이라는 키 값으로 담기
		request scope에 담은 값은 응답하기 전까지 사용할 수 있다.
		(다른 페이지로 forward 이동해도 사용할 수 있다.)
		(다른 페이지로 redirect 이동하면 사용할 수 없다.)
	*/
	request.setAttribute("yourName", yourName);
	
	
	String ourName = "원숭이";
	/*
		session scope에 ourName 이라는 키 값으로 담기
		session scope에 담은 값은 세션이 유지되는 동안 사용할 수 있다.
		(다른 페이지로 forwad, redirect 이동해도 사용할 수 있다.)
		(웹 브라우저를 닫거나 세션을 초기화 하기 전 까지 사용할 수 있다.)
	*/
	session.setAttribute("ourName", ourName);
	
	String companyName = "에이콘";
	/*
		application scope에 companyName 이라는 키 값으로 담기   
		application scope에 담은 내용은 서버를 끄기 전 까지 사용할 수 있다.
	*/
	application.setAttribute("companyName", companyName);
		
	CafeDto dto = new CafeDto();
	dto.setNum(1);
	dto.setTitle("원숭아!");
	dto.setContent("놀자~");
	/*
		request 영역에 dto라는 키 값으로 CafeDto type인 dto 담기
	*/
	request.setAttribute("dto", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL로 page scope에 저장된 값 추출</h1>
	<p>내 이름은 ${pageScope.myName }</p>
	<p>내 이름은 ${myName }</p>
	
	<h1>EL로 request scope에 저장된 값 추출</h1>
	<p>너의 이름은 ${requestScope.yourName }</p>
	<p>너의 이름은 ${yourName }</p>
	
	<h1>EL로 session scope에 저장된 값 추출</h1>
	<p>우리의 이름은 ${sessionScope.ourName }</p>
	<p>우리의 이름은 ${ourName }</p>
	
	<h1>EL로 application scope에 저장된 값 추출</h1>
	<p>회사 이름은 ${applicationScope.companyName }</p>
	<p>회사 이름은 ${companyName }</p>
	
	<h1>EL로 request scope에 담긴 dto의 정보 출력</h1>
	<p>번호 : ${requestScope.dto.getNum() }</p>   
	<p>번호 : ${dto.getNum() }</p>
	<p>번호 : ${dto.num }</p>
	<br>
	<p>제목 : ${requestScope.dto.getTitle() }</p>
	<p>제목 : ${dto.getTitle() }</p>
	<p>제목 : ${dto.title }</p>
	<br>
	<p>내용 : ${requestScope.dto.getContent() }</p>
	<p>내용 : ${dto.getContent() }</p>
	<p>내용 : ${dto.content }</p>
	
<!-- 	EL을 안쓰면 -->
	<%CafeDto dto2 = (CafeDto)request.getAttribute("dto"); %>
	<p><%=dto2.getContent()%></p>

	<a href="el_test3.jsp?num=1&name=kimgura">다음 예제</a>
</body>
</html>