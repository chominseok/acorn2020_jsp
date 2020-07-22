<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<a href="../index.jsp">인덱스</a>
		<h1>파일 업로드하기</h1>
		<form action="uploadMinseok.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
			</div>
			<div class="form-group">
				<label for="myfile">파일</label>
				<input type="file" name="myfile" id="myfile"/>
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
</body>
</html>