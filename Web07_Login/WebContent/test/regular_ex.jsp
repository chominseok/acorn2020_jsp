<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
	<h1>Regular Expression 테스트</h1>
	<input type="text" id="id" placeholder="아이디 입력..."/>
	<button id="checkBtn">가입</button>
	<p>영문자 소문자로 시작하고 5~10글자 이내, 특수문자를 하나이상 입력하세요.</p>
	<script>
		//영문자 소문자로 시작하는지 여부를 알아낼 수 있는 정규 표현식 객체
		var reg1 = /^[a-z]/;
		//최소 5글자~최대 10글자
		var reg2 = /^.{5,10}$/;
		//특수문자 포함 여부
		var reg3 = /[^a-zA-Z0-9]/;
		//1,2번 조건 합치기
		var reg4 = /^[a-z].{4,9}$/;
		
		$('#checkBtn').on('click',function(){
			console.log('hihi');
			//1.입력한 문자열을 읽어와서
				var str = $('#id').val();
			//2.검증한다.
			var result = reg1.test(str);
			
			if(result){
				alert("영문자 소문자로 시작했습니다.");
			}
			
			var result2 = reg2.test(str);
			
			if(result2){
				alert("최소 5글자~최대 10글자");
			}	
			
			var result3 = reg3.test(str);
			
			if(result3){
				alert("특수문자 ㅇㅇ");
			}
			
			if(reg4.test(str)){  //true
				alert("영문자 소문자로 시작하고 최소 5~ 최대10글자 입니다.");
			}
			
			if(!reg4.test(str)){ //false
				alert("영문자 소문자로 시작하고 최소 5~ 최대10글자 이내로 작성해주세요");
			}
		});
	</script>
	<a href="regular_ex2.jsp">다음예제</a>
</body>
</html>