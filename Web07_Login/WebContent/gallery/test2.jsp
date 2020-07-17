<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--jQuery Form Plugin > download >  git > download > 압출풀고  > form.min.js js 폴더에 추가-->
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
</head>
<body>
	<h1>ajax이미지 파일 업로드 테스트</h1>
	<form id="myForm" action="test_upload2.jsp" method="post" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="설명 입력..."/>
		<input type="file" name="image" accept=".jpg,.jpeg,.png,.JPG, .JPEG"/>
		<button type="submit">업로드</button>
	</form>
	<div id="wrapper">
		
	</div>
	
	<script>   
		//jquery form plugin을 로딩함으로서 .ajaxForm이라는 동작이 생성됨
		$('#myForm').ajaxForm(function(data){
			//data는 {imageSrc : "xxx.jpg"} 형식의 object 이다.
			console.log(data);
			$("<img/>").attr("src","${pageContext.request.contextPath}"+data.imageSrc)
			.appendTo("#wrapper");
		});
	</script>
</body>
</html>