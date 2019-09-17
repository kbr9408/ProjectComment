<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="comment.vo.CommentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<meta charset="UTF-8">
<link href="commentCSS/commentCSS.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>

</head>
<body>
	<div>
	<h2>댓글</h2>
	<form action="comment/create" method="post">
		<input type="hidden" name="boardId" id="${comment.boardId }"><br>
		<input type="text" name="commentText" placeholder="내용을 입력하세요."><br>
		<input type="text" name="commentWriter" placeholder="작성자"><br>
		<input type="submit" value="댓글 작성">
		<input type="reset" value="cancel">
	</form>
	</div>
	<form action="comment/list" method="post">
	<input type="submit" value="댓글 보기">
	
	</form> 
</body>
</html>