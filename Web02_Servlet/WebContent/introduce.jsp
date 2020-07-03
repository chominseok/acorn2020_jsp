<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ItPage.jsp" method="post">
		<label for="name">이름</label>
		<input type="text" name="name" id="name"/>
		<br>
		<label for="age">나이</label>
		<input type="text" name="age" id="age"/>
		<br>
		<label for="area">사는곳</label>
		<input type="text"  name="area" id="area"/>
		<br>
		<fieldset>
			<legend>취미</legend>
			<label for="football">축구</label>
			<input type="checkbox" name="hobby" value="football" id="football"/>
			
			<label for="game">게임</label>
			<input type="checkbox" name="hobby" value="game" id="game"/>
			
			<label for="study">공부</label>
			<input type="checkbox" name="hobby" value="study" id="study"/>
		</fieldset>
		<br>
		<label for="num">좋아하는 숫자</label>
		<select name="num" id="num">
			<option value="">선택</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>
		<br>
		<br>
		<label for="comment">하고싶은 말
		<br>
		<textarea name="comment" id="comment" cols="20" rows="10"></textarea>
		</label>
		<br>
		<button type="submit">전송</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>