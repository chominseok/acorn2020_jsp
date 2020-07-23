<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
</head>
<body>
	<a href="../index.jsp">인덱스로</a>
	<a href="imgGallery.jsp">이미지 갤러리 </a>
	
	<h1>기본 form 전송으로 이미지 업로드 하기</h1>
	
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="그림 설명..."/>
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		<button type="submit">업로드</button>
	</form>
	
	<br>
	
	<h1>ajax form plugIn 사용해서 이미지 업로드 하기</h1>
	
	<form id="aForm" action="upload2.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="그림 설명..."/>
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		<button type="submit">업로드</button>
	</form>
	
	<div class="imgBoard"></div>
	
	<script>
		$('#aForm').ajaxForm(function(data){
			console.log(data.title);
			console.log(data.imageSrc);
			$("<p>").text(data.title).appendTo(".imgBoard");  
			$("<img/>").attr("src","${pageContext.request.contextPath}"+data.imageSrc)
			.appendTo(".imgBoard");  
		});
	</script>
	
	
</body>
</html>