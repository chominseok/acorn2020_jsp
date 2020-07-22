<%@page import="java.util.List"%>
<%@page import="test.minseok.dto.MinseokDto"%>
<%@page import="test.minseok.dao.MinseokDao"%>
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
<%
//로그인 된 아이디 읽어오기 (로그인을 하지 않으면 null 이다)
	String id=(String)session.getAttribute("id");
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT=5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호
	int pageNum=1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//전체 row 의 갯수를 읽어온다.
	int totalRow=MinseokDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=
			(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum=
		1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//끝 페이지 번호가 잘못된 값이라면 
	if(totalPageCount < endPageNum){
		endPageNum=totalPageCount; //보정해준다. 
	}
	
	//startRowNum 과 endRowNum을 FileDto 객체에 담고 
	MinseokDto dto=new MinseokDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//FileDto 객체를 인자로 전달해서 파일 목록을 얻어온다. 
	List<MinseokDto> list=MinseokDao.getInstance().getList(dto);
%>
	<a href="upload_form.jsp">업로드 하기</a>
	<a href="../index.jsp">인덱스로</a>
	<table class="table table-striped table-sm">
		<thead class="thead-dark">
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>파일명</th>
				<th>파일크기</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(MinseokDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><%=tmp.getTitle() %></td>
				<td><a href="download.jsp?num=<%=tmp.getNum()%>"><%=tmp.getOrgFileName() %></a></td>
				<td><%=tmp.getFileSize() %></td>
				<td><%=tmp.getRegdate() %></td>
<%-- 				<td><a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a></td> --%>
				<td><a href="javascript:deleteImg(<%=tmp.getNum()%>);">삭제!</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<div class="page-display">
		<ul class="pagination">		
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i==pageNum){ %>
					<li class="active page-item"><a class="page-link" href="imgGallery.jsp?pageNum=<%=i %>"><%=i %></a></li>
				<%}else{%>
					<li><a class="page-link" href="imgGallery.jsp?pageNum=<%=i %>"><%=i %></a></li>
				<%} %>
			<%} %>	
		</ul>
	</div>
	
	<script>
		function deleteImg(num){
			var isDelete = confirm(num+"번 글을 삭제하시겠습니까???");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}
		}
		
	</script>
</body>
</html>