<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="commentCSS/commentCSS.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<table>
	<thead>
	<h2>댓글</h2>
	<form action="comment/create" method="post">
		<input type="text" name="commentText" placeholder="내용을 입력하세요."><br>
		<input type="text" name="commentWriter" placeholder="작성자"><br>
		<input type="submit" value="댓글 작성">
		<input type="reset" value="cancel">
	</form>
	</thead>
		<tbody>
			<c:forEach var="comment" items="${clist }" varStatus="status">
			
			<tr>
				<td><c:out value="${comment.commentWriter }"/></td>
				<td><c:out value="${comment.commentText }"/></td>
				<td><c:out value="${comment.commentUdate }"/></td>
				<td>
					<form action="comment/selectOne" method="post">
						<input type="submit" value="댓글 수정">
					</form>
				</td>
				
			</tr>
			
			</c:forEach>
		</tbody>
</table>
</body>
</html>