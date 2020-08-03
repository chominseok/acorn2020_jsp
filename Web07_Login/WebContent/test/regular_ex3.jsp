<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
	.error-feedback{
		display : none;
		color : red;
	}
</style>
</head>
<body>
	<form action="insert.jsp" method="post" id="myForm">
		<input type="text" id="id" name="id" placholder="아이디 입력"/>
		<div class="error-feedback">
			영문자 소문자로 시작을 하고 5~10글자 이내로 작성해주세요.
		</div>
		<button type="submit">가입</button>
	</form>
	
	<script>
		//아이디 를 검증할 수 있는 정규 표현식
		var reg_id = /^[a-z].{4,9}/;
		
		//form에 submit 이벤트가 일어났을 때
		$('#myForm').on('submit',function(){
			//입력한 아이디를 읽어와서 검증한다.
			var inputId = $('#id').val();
			
			if(!reg_id.test(inputId)){
				//1.에러 메세지를 띄우고
// 				alert('영문자 소문자로 시작을 하고 5~10글자 이내로 작성하세요.');
// 				$('.error-feedback').css('display','block');
				$('.error-feedback').fadeIn(1000);
				//2.잘못 입력한 곳으로 focus를 주고
				$('#id').focus();
				//3.폼이 전송되지 않도록 막아준다.
				return false;
			}
		});
	</script>
	<a href="regular_ex4.jsp">다음예제</a>
</body>
</html>