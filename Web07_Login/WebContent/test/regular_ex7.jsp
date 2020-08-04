<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>가입 폼 입니다.</h1>
		<form action="insert.jsp" method="post" id="myForm">
			<div class="form-group">
				<label for="id">아이디</label>
				<input class="form-control" type="text" id="id" name="id" placeholder="아이디 입력"/>
				<div class="invalid-feedback">
					영문자 소문자로 시작을 하고 5~10글자 이내로 작성해주세요.
				</div>
			</div>
			<div class="form-group">
				<label for="phone">휴대폰 번호</label>
				<input class="form-control" type="text" id="phone" name="phone" placeholder="핸드폰 번호입력"/>
				<div class="invalid-feedback">
					휴대폰 형식에 맞게 입력하세요.
				</div>
			</div>
			<button class=" btn btn-primary" type="submit">가입</button>
		</form>
			<a href="regular_ex8.jsp">다음예제</a>
	</div>
	
	<script>
		//아이디 를 검증할 수 있는 정규 표현식
		var reg_id = /^[a-z].{4,9}/;
		//휴대폰 번호를 검증할 수 있는 정규 표현식
		var reg_phone = /^010[0-9]{4}[0-9]{4}$/;
		//id 유효성
		var isIdValid = false;
		//phone 유효성
		var isPhoneValid = false;
		//form 유효성
		var isFormValid = false;
		
		$('#id').on('input',function(){
			var inputId = $('#id').val();
			isIdValid = reg_id.test(inputId);
			//is-valid, is-invalid 클래스를 일단 제거후
			$(this).removeClass('is-valid is-invalid');
			if(isIdValid){
				//is-invalid 클래스를 추가한다.
				$(this).addClass('is-valid');
			}else{
				$(this).addClass('is-invalid');
			}
		});
		
		$('#phone').on('input',function(){
			var inputPhone = $('#phone').val();
			isPhoneValid = reg_phone.test(inputPhone);
			$(this).removeClass('is-valid is-invalid');
			if(isPhoneValid){
				$(this).addClass('is-valid');
			}else{
				$(this).addClass('is-invalid');
			}
		});
		
		$('#myForm').on('submit',function(){
			isFormValid = isIdValid && isPhoneValid;
			if(!isFormValid){
				alert("아이디 혹은 핸드폰 번호를 확인해주세요");
				return false;   //jquery인 경우에만
			}
		});
		
		/*
		document.querySelector("#myForm").addEventListener("submit",function(){
			isFormValid = isIdValid && isPhoneValid;
			if(!isFormValid){
				alert("아이디 혹은 핸드폰 번호를 확인해주세요");
// 				return false;   
				//이벤트 객체의  preventDefault() 이용
				event.preventDefault();  //jquery를 사용하지 않았을 때
			}
		});
		*/
	</script>
	
</body>
</html>