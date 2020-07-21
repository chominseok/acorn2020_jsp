<%@page import="java.util.List"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<%
	GalleryDao dao = GalleryDao.getInstance();
	List<GalleryDto> list = dao.getList(); 
%>
<body>
	<div class="container">
	<a href="../index.jsp">인덱스</a>
		<a href="private/upload_form.jsp">업로드 하러 가기</a>
		<h1>갤러리 목록 입니다.</h1>
		<%for(GalleryDto tmp : list){ %>
			<div class="wrapper">
				<img src="${pageContext.request.contextPath}<%=tmp.getImagePath()%>"/>
				<p><%=tmp.getCaption() %></p>
				<p>
					<strong><%=tmp.getWriter() %></strong>
					<i><%=tmp.getRegdate() %></i>
				</p>
			</div>
		<%} %>
	</div>
	<a href="../index.jsp">인덱스</a>
</body>
</html>