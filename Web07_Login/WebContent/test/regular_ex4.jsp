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
		<label for="id">아이디</label>
		<input type="text" id="id" name="id" placeholder="아이디 입력"/>
		<div id="idFeedback" class="error-feedback">
			영문자 소문자로 시작을 하고 5~10글자 이내로 작성해주세요.
		</div>
		<br>
		<label for="phone">휴대폰 번호</label>
		<input type="text" id="phone" name="phone" placeholder="핸드폰 번호입력"/>
		<div id="phoneFeedback" class="error-feedback">
			휴대폰 형식에 맞게 입력하세요.
		</div>
		<br>
		<button type="submit">가입</button>
	</form>
	
	<script>
		//아이디 를 검증할 수 있는 정규 표현식
		var reg_id = /^[a-z].{4,9}/;
		//휴대폰 번호를 검증할 수 있는 정규 표현식
		var reg_phone = /^010[0-9]{4}[0-9]{4}/;
		//id 유효성
		var isIdValid = false;
		//phone 유효성
		var isPhoneValid = false;
		//form 유효성
		var isFormValid = false;
		
		//form에 submit 이벤트가 일어났을 때
		$('#myForm').on('submit',function(){
			//입력한 아이디를 읽어와서 검증한다.
			var inputId = $('#id').val();
			 isIdValid = reg_id.test(inputId);
			 
			var inputPhone = $('#phone').val();
			isPhoneValid = reg_phone.test(inputPhone);
			
			isFormValid = isIdValid && isPhoneValid;
			alert(isFormValid);
			if(!isIdValid){
				//1.에러 메세지를 띄우고
// 				alert('영문자 소문자로 시작을 하고 5~10글자 이내로 작성하세요.');
// 				$('.error-feedback').css('display','block');
				$('#idFeedback').fadeIn(1000);
				//2.잘못 입력한 곳으로 focus를 주고
				$('#id').focus();
				//3.폼이 전송되지 않도록 막아준다.
				return false;
			}
			
			if(!isPhoneValid){
				$('#phoneFeedback').fadeIn(1000);
				
				$('#phone').focus();
				
				return false;
			}
		});
	</script>
	<a href="regular_ex5.jsp">다음예제</a>
</body>
</html>