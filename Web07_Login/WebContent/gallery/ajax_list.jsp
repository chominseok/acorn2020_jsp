<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 된 아이디 읽어오기 (로그인을 하지 않으면 null 이다)
	String id=(String)session.getAttribute("id");
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	
	//보여줄 페이지의 번호
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));

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
