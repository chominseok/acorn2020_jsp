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
<!-- id 중복확인 
	1.btn과 경고문을 출력할 span 만들기
	2.btn click 이벤트 등록하고 ajax로 폼 제출 막기
	3.ajax로 이동하는 jsp 페이지에서 코드 작성
	4.dao에 isExist 코드 작성해서 중복여부 확인하기
-->
<body>
	<div class="container">
		<h1>회원 가입 폼 입니다.</h1>
		<form action="signup.jsp" method="post">
			<div class="form-group">
				<label for="id">아이디</label>
				<input class="form-control" type="text" name="id" id="id"/>
				<button class="btn btn-outline-info" id="checkBtn">중복확인</button>
				<span id="checkResult"></span>
				<div class="invalid-feedback">
					사용할 수 없는 아이디 입니다.
				</div>
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input class="form-control" type="password" name="pwd" id="pwd"/>
				<div class="invalid-feedback">
					비밀번호를 다시 입력해주세요.
				</div>
			</div>
			<div class="form-group">
				<label for="pwd2">비밀번호 확인</label>
				<input class="form-control" type="password" name="pwd2" id="pwd2"/>
			</div>
			<div class="form-group">
				<label for="email">이메일</label>
				<input class="form-control" type="text" name="email" id="email"/>
				<div class="invalid-feedback">
					이메일을 형식에 맞게 입력해주세요.
				</div>
			</div>
			<button class="btn btn-outline-primary" type="submit">전송</button>
			<button class="btn btn-outline-danger" type="reset">취소</button>
		</form>
		<a href="../index.jsp">인덱스로 돌아가기</a>
	</div>
	
	<script>
	//아이디 중복확인을 통과 했는지 여부
	var canUseId=false;
	//중복 확인 버튼을 눌렀을때 실행할 함수 등록
	$("#checkBtn").on("click", function(){
		//입력한 아이디를 읽어온다.
		var inputId=$("#id").val();
		//ajax 를 이용해서 서버에 보낸후 결과를 응답 받는다.
		$.ajax({
			method:"GET",
			url:"checkid.jsp",
			data:"inputId="+inputId,
			success:function(data){
				//data => {isExist:true} or {isExist:false} 인 object 이다.
				if(data.isExist){//이미 존재하는 아이디임으로 사용 불가
					$("#checkResult")
					.text("사용불가")
					.css("color","red");
					//아이디가 사용 불가 하다고 표시한다.
					canUseId=false;
				}else{//사용가능 
					$("#checkResult")
					.text("사용가능")
					.css("color","green");
					//아이디가 사용 가능 하다고 표시한다.
					canUseId=true;
				}
 			}
		});
		//form 안에 있는 일반 버튼을 눌러도 폼이 전송 되기 때문에 폼 전송을 막아준다.
		return false;
	});
	//폼에 submit 이벤트가 일어났을때 호출될 함수 등록 
	$("#myForm").on("submit", function(){
		
		if(!canUseId){//사용 불가한 아이디 이면 
			alert("아이디 중복을 확인 하세요");
			return false; //폼 제출 막기 
		}
	});
	</script>
</body>
</html>