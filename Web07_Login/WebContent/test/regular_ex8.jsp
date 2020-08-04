<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	//아래의 두 정규 표현식은 같다
	var reg1 = /[0-9]/;
	var reg1_1 = /[\d]/;  //d(십진법) == 0~9
	
	var reg2 = /[^0-9]/;
	var reg2_1 = /[\D]/;  //\d와 \D는 반대
	
	var reg3 = /[a-zA-Z0-9]/;
	var reg3_1 = /[\w]/;
	
	var reg4 = /[^a-zA-Z0-9]/;
	var reg4_1 = /[\W]/;
	
	//공백(띄어쓰기, tab, 개행기호)를 찾는 정규 표현식
	var reg5 = /[\s]/; 
	//공백(띄어쓰기, tab, 개행기호)가 아닌 문자를 찾는 정규 표현식
	var reg5_1 = /[\S]/;
	
	//new를 이용한 정규 표현식 객체 생성
	var reg6 = /^[a-z].{4,9}/;
	var reg6_1 = new RegExp("^[a-z].{4,9}$");  // 생성자 함수를 이용해서 string으로 만든다.
	
	//gura 문자를 global로 찾는 정규 표현식 객체
	var reg7 = /gura/g;
	var reg7_1 = new RegExp("gura","g");
	
	var reg8 = /^[\w]+$/;
	var reg8_1 = new RegExp("^[\\w]+$");  //생성자 함수 안에선 역슬래쉬를 두번 쓴다.
</script>
</body>
</html>