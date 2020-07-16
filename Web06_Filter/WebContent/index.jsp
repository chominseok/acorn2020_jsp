<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>인덱스 페이지입니다.</h1>
	<form action="test/insert.jsp" method="post">
		<input type="text" name="msg" placeholder="서버에 할 말 입력..."/>
		<button type="submit">전송</button>
	</form>

	<br>
	
	<%
		//로그인 된 아이디 읽어오기
		String id = (String)session.getAttribute("id");
	
		if(id == null){
	%>
		<h1>가상의 로그인 폼</h1>
		<form action="test/login.jsp" method="post">
			<input type="text" name="id" placholder="아이디 입력..."/>
			<input type="password" name="pwd" placholder="비밀번호 입력..."/>
			<button type="submit">로그인</button>
		</form>
	<%  }else if(id.equals("구라")){ %>
		<p><strong><%=id %></strong>님 안녕!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
		<a href="test/logout.jsp">로그아웃</a>
	<%} %>
	<ul>
		<li><a href="member/play.jsp">회원 전용 공간으로 가기</a></li>	
		<li><a href="member/study.jsp">회원 전용 공간으로 가기2</a></li>	
		<li><a href="member/buy.jsp?num=1&amount=10">구입하기</a></li>	
	</ul>

</body>
</html>