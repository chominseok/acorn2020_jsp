<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>      <!--페이지 전환 없이 서버와 응답하는 거 > ajax  -->
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
</head>
<body>
	<button id="getBtn">요청하기</button>
	<button id="getBtn2">요청하기2</button> <!-- html로 받은 jason 형식을 JASON.parse로 직접 바꿔쭘 -->
	<button id="getBtn3">요청하기3</button>
	<!--  contentType="application/json; charset=UTF-8"로 변경 -->
	<script>
	$('#getBtn3').on('click',function(){
		$.ajax({
			method : "post",
			url : "getgreet.jsp",
			success : function(data){
				console.log(data.greet);
			}
		});
	});
	
	$('#getBtn2').on('click',function(){
		$.ajax({
			method : "post",
			url : "getmsg.jsp",
			data : {num : 1, name : "chominseok"},
			success : function(data){
				console.log(data);
				var obj = JSON.parse(data);
				console.log(obj.msg);
			}
		});
	});
	
	$('#getBtn').on('click',function(){
		$.ajax({
			method : "get",
			url : "getmsg.jsp",
			data : "num=1&name=chominseok",
			success : function(data){
				console.log(data);
				var obj = JSON.parse(data);
				console.log(obj);
				console.log(obj.msg);
			}
		});
	});
	
	
	// id 가 getBtn 인 곳에 "click" 이벤트가 일어났을때 호출되는 함수 등록
// 	$("#getBtn").on("click", function(){
// 		//jquery 의 기능을 이용해서 ajax  요청하기 
// 		$.ajax({
// 			method:"GET",
// 			url:"${pageContext.request.contextPath }/ajax/getmsg.jsp",
// 			data:"num=1&name=kimgura",
// 			success:function(responseData){
// 				console.log(responseData);
// 				console.log("성공했습니다!");
// 			}
// 		});
// 	});
	
// 	$('#getBtn2').on('click',function(){
// 		$.ajax({
// 			method : "get",
// 			url : "getmsg.jsp", //절대경로, 상대경로 가능
// 			data : {num : 2, name : "해골"}, 			//요청 파라미터를 object로 전달해도 된다.
// 			success : function(data){ //함수에 전달받는 변수명은 마음대로 작성가능
				
// 				console.log(data);    // >>>!! 위에 setContextType으로 text/html을 받아서 자동적으로
// 							// object를 사용할 수 없다. >> //data는 jason 형식을 가지고 있는 string type이다.
// 				//javascript에서 사용하려면 object로 바꿔서 사용해야된다.
// 				var obj = JSON.parse(data);
// 				console.log(obj);
// 				//obj로 바꿨기 때문에 쉽게 사용할 수 있다.
// 				alert(obj.msg);
// 			}
// 		});
// 	});
	
// 	$("#getBtn3").on('click',function(){
// 		$.ajax({
// 			method : "get",
// 			url : "getgreet.jsp", 
// 			//data : 요청 파라미터가 없으면 전달하지 않아도 된다.
// 			success : function(data){
// 				console.log(data);
// 				console.log(data.greet);
// 				alert(data.greet);
// 			}
// 		});
// 	});
</script>
</body>
</html>