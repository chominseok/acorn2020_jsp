<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>	
	<h1>form에 입력한 내용을 ajax 요청으로 전송하는 예제</h1>
	<form action="insert.jsp" method="post">
		<input type="text" name="email" placeholder="이메일 입력...."/>
		<input type="password" name="phone" placeholder="핸드폰 번호 입력...."/>
		<button type="submit">전송</button>
	</form>
	<script>
		$('form').ajaxForm(function(data){
			console.log(data.isSuccess);
			console.log(data.name);
			console.log(data.email);
		});
	
		//ajax로 보낼거기 때문에 form에서 넘어가는 action을 잡는다.
		$('form').on('submit',function(){
			var action = $(this).attr("action"); //action 속성의 value 값
			var method = $(this).attr("method"); //method 속성의 value 값
			var query = $(this).serialize(); // 폼에 입력한 값을 query string으로  읽어오기
			// query string은 get 방식 전달방법 ex) email=xxx&phone=xxx 형식의 문자열이 읽어와진다.
			$.ajax({
				method : method,  //post
				url : action,     //insert.jsp
				data : query,     //email=xx&phone=xx
				success : function(data){
					console.log(data);
				}
			});
			return false;  //폼 전송을 강제로 막아 버리기
		});
	</script>
</body>
</html>