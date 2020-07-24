<%@page import="java.net.URLEncoder"%>
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
<link rel="stylesheet" href="../css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/js/jquery-3.5.1.js"></script>
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
<%
//로그인 된 아이디 읽어오기 (로그인을 하지 않으면 null 이다)
	String id=(String)session.getAttribute("id");
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	
	//보여줄 페이지의 번호
	int pageNum=1;

	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=GalleryDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
	//startRowNum 과 endRowNum을 FileDto 객체에 담고 
	GalleryDto dto=new GalleryDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//FileDto 객체를 인자로 전달해서 파일 목록을 얻어온다. 
	List<GalleryDto> list=GalleryDao.getInstance().getList(dto);
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
	<div class="loader"><img src="${pageContext.request.contextPath }/images/ajax-loader.gif"/></div>
	<script>
	//페이지가 처음 로딩될 떄 1page를 보여준다
	var currentPage = 1;
	//전체 페이지의 수르 javscript 변수에 담아준다
	var totalPageCount = <%=totalPageCount%>;
	//ajax 요청이 응답 되었는지 여부
	
		$(window).on('scroll',function(){
			if(currentPage == totalPageCount){//만일 마지막 페이지 이면 
				return; //함수를 여기서 종료한다. 
			}
			//위쪽으로 스크롤 된 길이 구하기
			var scrollTop=$(window).scrollTop();
			//window 의 높이
			var windowHeight=$(window).height();
			//document(문서)의 높이
			var documentHeight=$(document).height();
			//바닥까지 스크롤 되었는지 여부
			var isBottom = scrollTop+windowHeight + 10 >= documentHeight;
			
			if(isBottom){
				$(".loader").show();
				currentPage++;
				//해당 페이지의 내용을ajx를 요청해서 받아온다.
				$.ajax({
					url : "ajax_list.jsp",
					method : "get",
					data : {pageNum : currentPage},
					success : function(data){
						$(".container").append(data);
						//로딩 이미지를 숨긴다. 
						$(".loader").hide();
					}
					
				});
			}
		});
	</script>
	<a href="../index.jsp">인덱스</a>
</body>
</html>