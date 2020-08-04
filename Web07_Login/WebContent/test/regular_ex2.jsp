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
	<input type="text" id="inputMsg" placeholder="하고싶은 말 입력" style="width : 500"/>
	<button id="sendBtn">전송</button>
	<ul id="wordList">
		
	</ul>
	<script>
		//공백이 아닌 한글자가 1번이상 반복되는 문자열을 모두 추출할 수 있는 정규표현식 객체
		var reg = /[^ ]+/g;   //모두 추출하려면 g (global) 쓰기 >> 안쓰면 첫번쨰만 추출
		
		$('#sendBtn').on('click',function(){
			var msg = $('#inputMsg').val();
			//반목문을 돌면서 정규표현식에 부합하는 문자열을 모두 추출한다.
			while(true){
				var result = reg.exec(msg);  // .exec는 배열을 반환하고 값이 없으면 NULL을 반환
				if(result == null){
					break;
				}
				alert(result);
				$('#wordList').append('<li>'+result+'</li>');
// 				$('<li/>').text(result).appendTo('#wordList');
			}
		});
	</script>
	<a href="regular_ex3.jsp">다음예제</a>
</body>
</html>