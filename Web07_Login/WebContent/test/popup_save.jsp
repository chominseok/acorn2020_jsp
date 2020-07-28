<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String canPopup = request.getParameter("canPopup");
	
	//만일 팝업을 띄우지 않겠다고 체크를 했다면
	if(canPopup != null){
		//canPopup 이라는 키 값으로 no라는 문자열을 담고 (no라는 문자열을 사용하지는 않음 >> 예시로 한거)
		Cookie cook = new Cookie("canPopup", canPopup);
		cook.setMaxAge(60);
		//쿠키가 응답될 수 있도록 HttpServletResponse 객체에 담는다.
		response.addCookie(cook);
	}
%>

<script>
	//창이 닫아지도록 한다.
	self.close();
</script>
</body>
</html>