<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
</head>
<body>
	<input type="text" id="msg" placeholder="서버에 할 말 입력!"/>
	<button id="sendBtn">전송</button>
	<script>
		/*전송 버튼을 눌렀을 때 입력한 문자열을 읽어와서 /ajax.send.jsp 페이지에 post 방식으로 전송해보세요.
		    입력한 문자열은 msg라는 파라미터 명으로 전송하기. send.jsp 페이지에서는 전송된 내용을 서버측 콘솔에 출력
		  send.jsp 페이지에서 응답은 json 형식 {"isSuccess" : true}를 응답해 보세요.
		    클라이언트에서는 서버가 응답한 데이터를 클라이언트 측 콘솔에 출력해 보세요.*/
		    
		  $('#sendBtn').on('click',function(){
			  
			  $.ajax({
				  method : "get",
				  url : "send.jsp",
				  data : {msg : $('#msg').val()},
				  success : function(data){
					  console.log(data);
					  console.log(data.isSuccess);
					  console.log($('#msg').val());
				  }
			  });
		  });  
	</script>
</body>
</html>