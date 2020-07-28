<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//HttpServletRequest 객체를 이용해서 요청과 함께 전달된 쿠키 읽어내기
	Cookie[] cooks = request.getCookies();
	
	//"savedMsg"라는 키값으로 저장된 문자열을 저장할 변수
	String savedMsg = null;
	
	if(cooks != null){
		//반복문을 돌면서 쿠키 객체를 하나씩 참조
		for(Cookie tmp : cooks){
			//쿠키의 키 값을 읽어오기.
			String key = tmp.getName();
			if(key.equals("savedMsg")){  //만일 우리가 찾는 키 값이라면
				//해당 키 값으로 저장된 value를 읽어낸다.
				savedMsg = tmp.getValue();
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>savedMsg라는 키 값으로 저장된 문자열 : <%=savedMsg %></p>
	<a href="cookie_form.jsp">다시 테스트</a>
</body>
</html>