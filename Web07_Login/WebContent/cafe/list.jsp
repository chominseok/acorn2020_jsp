<%@page import="java.net.URLEncoder"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<style>
	.page-display ul li{
		float: left;
		list-style-type: none;
		margin-right: 10px;
	}
	.page-display ul li a{
		text-decoration: none;
		color: #000;
	}
	.page-display ul li.active a{
		text-decoration: underline;
		color: #f00;
		font-weight: bold;
	}
	.page-display ul li.muted a{
		color: #cecece;
	}
</style>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
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
	
	CafeDto dto=new CafeDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<CafeDto> list=null;
	
	String condition = (String)request.getParameter("condition");
	String keyword = (String)request.getParameter("keyword");

	if(keyword==null){
		keyword = "";
		condition = "";
	}
	String encodedK=URLEncoder.encode(keyword);
	
	int totalRow = 0;
	if(!keyword.equals("")){
		if(condition.equals("title")){
			dto.setTitle(keyword);
			list = CafeDao.getInstance().getListT(dto);
			totalRow = CafeDao.getInstance().getCountT(dto);
		}else if(condition.equals("writer")){
			dto.setWriter(keyword);
			list = CafeDao.getInstance().getListW(dto);
			totalRow = CafeDao.getInstance().getCountW(dto);
		}
	}else{
		list=CafeDao.getInstance().getList(dto);
		totalRow=CafeDao.getInstance().getCount();
	}
	
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

%>
<div class="container">
	<a href="../index.jsp">인덱스</a>
	<a href="private/insertform.jsp">새글 작성</a>
	<h1>글 목록 입니다.</h1>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<%for(CafeDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td>
					<a href="detail.jsp?num=<%=tmp.getNum() %>">
						<%=tmp.getTitle() %>
					</a>
				</td>
				<td><%=tmp.getViewCount() %></td>
				<td><%=tmp.getRegdate() %></td>
				<%if(tmp.getWriter().equals(id)){ %>
					<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
				<%} %>
			</tr>
		<%} %>
		</tbody>
	</table>
	<div class="page-display">
		<ul>
			<%if(startPageNum != 1){ %>
				<li>
					<a href="list.jsp?pageNum=<%=startPageNum-1 %>">&laquo;</a>
				</li>
			<%}else{ %>
				<li class="muted">
					<a href="javascript:">&laquo;</a>
				</li>
			<%} %>
			<%for(int i=startPageNum; i<=endPageNum; i++){ %>
				<%if(i == pageNum){ %>
					<li class="active">
						<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%}else{ %>
					<li>
						<a href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>
				<%} %>
			<%} %>
			<%if(endPageNum < totalPageCount){ %>
				<li>
					<a href="list.jsp?pageNum=<%=endPageNum+1 %>">&raquo;</a>
				</li>
			<%}else{ %>
				<li class="muted">
					<a href="javascript:">&raquo;</a>
				</li>
			<%} %>
		</ul>
	</div>
	
	<hr style="clear : left;"/>
	
	<form action="list.jsp" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title" <%if(condition.equals("title")){ %>selected<%} %>>제목</option>
			<option value="writer" <%if(condition.equals("writer")){ %>selected<%} %>>작성자</option>
		</select>
		<input value="<%=keyword %>" type="text" name="keyword" placeholder="검색어..."/>
		<button type="submit">검색</button>
	</form>
</div>
</body>
</html>






