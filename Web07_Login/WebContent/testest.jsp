<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String condition = request.getParameter("condition");
	String writer = request.getParameter("writer");
	String keyword = request.getParameter("keyword");
%>
<body>
	<form action="testest.jsp" method="post">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어..."/>
		<button type="submit">검색</button>
	</form>
	
	<%if(condition != null){ %>
		<p><%=condition %></p>
	<%} %>
	
	<%if(writer != null){ %>
		<p><%=writer %></p>
	<%} %>
	
	<%if(keyword != null){ %>
		<p><%=keyword %></p>
	<%} %>

</body>
</html>
<%
// public List<BoardDto> getListMainRc(){
// 	//필요한 객체의 참조값을 담을 지역변수 만들기 
// 	List<BoardDto> list = new ArrayList<>();	
// 	Connection conn = null;
// 	PreparedStatement pstmt = null;
// 	ResultSet rs = null;
// 	try {
// 		//Connection 객체의 참조값 얻어오기 
// 		conn = new DbcpBean().getConn();
// 		//실행할 sql 문 준비하기
// 		String sql = "SELECT sname, imageSrc"
// 				+ " FROM store"
// 				+ "	WHERE sname = ?";
// 		pstmt = conn.prepareStatement(sql);
// 		//sql 문에 ? 에 바인딩할 값이 있으면 바인딩하고 
// 		pstmt.setString(1,dto.getSname());
// 		//select 문 수행하고 결과 받아오기 
// 		rs = pstmt.executeQuery();
// 		//반복문 돌면서 결과 값 추출하기 
// 		while (rs.next()) {
// 			BoardDto tmp = new BoardDto();

// 			tmp.setWriter(rs.getString("sname"));
// 			tmp.setCaption(rs.getString("imageSrc"));
			
// 			list.add(tmp);
// 		}
// 	} catch (Exception e) {
// 		e.printStackTrace();
// 	} finally {
// 		try {
// 			if (rs != null)
// 				rs.close();
// 			if (pstmt != null)
// 				pstmt.close();
// 			if (conn != null)
// 				conn.close();
// 		} catch (Exception e) {
// 		}
// 	}
// 	return list;
// }
	

// 	List<BoardDto> list = BoardDao.getInstance().getListMainRc();
<%-- %> --%>

<!-- <div class="row"> -->
<%-- 	<%for(BoardDto tmp : list){ %> --%>
<!-- 		<div class="col-md-4"> -->
<!--        	 	<div class="card mb-4 shadow-sm"> -->
<%--        			<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="<%=imgSrc %>" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> --%>
<!--        			<div class="card-body"> -->
<%--          			<p class="card-text"><%=title %></p> --%>
<!--        			</div> -->
<!--      		</div> -->
<!--    		</div> -->
<%-- 	<%} %> --%>
<!-- </div> -->




