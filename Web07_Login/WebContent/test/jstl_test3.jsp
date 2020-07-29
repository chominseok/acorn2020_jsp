<%@page import="java.util.ArrayList"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	//Servlet 단에서 담은 sample 데이터라고 가정하자
	List<FileDto> list = new ArrayList<>();
	FileDto dto1 = new FileDto();
	dto1.setNum(1);
	dto1.setWriter("김구라");
	dto1.setTitle("제목1");
	
	FileDto dto2 = new FileDto();
	dto2.setNum(2);
	dto2.setWriter("해골");
	dto2.setTitle("제목2");
	
	FileDto dto3 = new FileDto();
	dto3.setNum(3);
	dto3.setWriter("원숭이");
	dto3.setTitle("제목3");
	
	list.add(dto1);
	list.add(dto2);
	list.add(dto3);
	//EL로 추출할 수 있도록 request 영역에 담는다.
	request.setAttribute("list", list);
	
	//DB 칼럼에 저장된 문자열이라고 가정
	String hobby = "piano/game/reading";
	request.setAttribute("hobby", hobby);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>List에 들어 있는 dto 활용</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>		
				<c:forEach var="i" items="${list}">
					<tr>
						<td>${i.num}</td>
				        <td>${i.getWriter()}</td>
						<td>${i.getTitle()}</td>
					</tr>
				</c:forEach>
		</tbody>
	</table>	
	
	<h1>취미입니다.</h1>           <!-- forEach와 같은 반복문	delims >> 구분자 -->
	<c:forTokens var="i" items="${hobby }" delims="/">
		<p>${i }</p>
	</c:forTokens>
	
	 <a href="jstl_test4.jsp">다음 예제</a>
</body>
</html>