<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>댓글 수정</h2>
	<form action="comment/update" method="post">
		<input type="text" name="borderNo" placeholder="보더번호"><br>
		<input type="text" name="commentText" placeholder="내용을 입력하세요."><br>
		<input type="text" name="commentWriter" placeholder="작성자"><br>
		<input type="submit" value="댓글 수정">
		<input type="reset" value="cancel">
	</form>
</body>
</html>