<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 body{
	 	background-color : yellow;
	 }
</style>
</head>
<body>
	<h3>팝업된 페이지 입니다.</h3>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis illo debitis quidem minus quasi dolorem doloremque ea iusto vero facilis iure vel totam. Delectus incidunt repudiandae laboriosam dolorum maiores harum.</p>
<!-- 	javascript:self.close()이 호출이 되면 창이 닫힘 -->
<!-- 	<a href="javascript:self.close();">닫기</a> -->
	<form action="popup_save.jsp" method="post">
		<label>
			<input type="checkbox" name="canPopup" value="no"/>
			1분 동안 팝업 띄우지 않기
		</label>
		<button type="submit">닫기</button>
	</form>
</body>
</html>