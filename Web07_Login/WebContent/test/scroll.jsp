<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
<style>
	.spacer{
		height : 500px;
		background-color : #999;
		border : 1px solid green;
	}
	.container{
		width : 768px;
		margin : 0 auto;
	}
	
	.loader{
		position : fixed;
		width : 100%;
		left : 0;
		bottom : 0;
		text-align : center;
		z-index : 1000;
		display : none;
	}
</style>
</head>
<body>
	<div class="container">
	<div class="loader"><img src="${pageContext.request.contextPath }/images/ajax-loader.gif"/></div>
		<h1>스크롤 테스트</h1>
		<div class="spacer"></div>
		<div class="spacer"></div>
		<div class="spacer"></div>
	</div>
	
	<script>
		$(window).on('scroll',function(){
			console.log("Scroll!");
			//위쪽으로 스크롤 된 길이 구하기
			var scrollTop = $(window).scrollTop();
			//window의 높이
			var windowHeight = $(window).height();
			//document의 높이
			var documentHeight = $(document).height();
			//바닥까지 스크롤 되었는지 여부
			var isBottom = scrollTop+windowHeight + 10 >= documentHeight;
			
			if(isBottom){
				$(".loader").show();
				
				setTimeout(function(){
					$('<div>').addClass("spacer").appendTo(".container")
					.hide().fadeIn(1000);
					
					//로딩 이미지 숨기기
					$(".loader").hide();
				},3000);	
			}
		});
	</script>
</body>
</html>