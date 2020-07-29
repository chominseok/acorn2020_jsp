<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	// uri를 core가 아닌 fmt을 선택하면 숫자의 형식을 선택할 수 있다.
	//ex int num = 12345678;   >>>>> string num = 12,345,678로 변경하려면 
	//  <fmt:formatNumber value="12345678" pattern="#,###"/>
	
	//test
	request.setAttribute("size", 1234456789);
	request.setAttribute("price", 2500000);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>숫자 포맷을 도와주는 fmt 사용하기</h1>
	<p>
		파일의 크기는 <fmt:formatNumber value="12345678" pattern="#,###"/>byte
	</p>
	<p>
		파일의 크기는 <fmt:formatNumber value="${requestScope.size }" pattern="#,###"/>byte
	</p>
	<p>
		가격은 <fmt:formatNumber value="${price }" type="currency" />
	</p>
	
	<form action="jstl_test6.jsp" method="post">
		<textarea name="content" cols="30" rows="5"></textarea>
		<button type="submit">전송 후 다음 예제로 이동</button>
	</form>
</body>
</html>