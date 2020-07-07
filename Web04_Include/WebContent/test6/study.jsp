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
	<jsp:include page="../include/navbar3.jsp">
		<jsp:param value="study" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<h1>study.jsp 입니다.</h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione et nihil explicabo quis voluptas provident temporibus aperiam quam labore aliquid dolore beatae exercitationem praesentium. Esse sunt repudiandae corporis natus fugit!</p>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>