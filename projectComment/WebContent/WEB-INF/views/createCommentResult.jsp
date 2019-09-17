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
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
<form role="form" method="post" autocomplete="off">
	boardId. <input type="text" id="boardId" name="boardId" value="${comment.boardId }" readonly="readonly"><br>
	commentText <input type="text" id="commentText" name="commentText" value="${comment.commentText }" readonly="readonly"><br>
	commentWriter <input type="text" id="commentWriter" name="commentWriter" value="${comment.commentWriter }" readonly="readonly"><br>
	commentRdate<input type="date" id="commentRdate" name="commentRdate" value="<fmt:formatDate value="${comment.commentRdate }" pattern="yyyy-MM-dd"/>" readonly="readonly"><br>
	commentUdate<input type="date" id="commentUdate" name="commentUdate" value="<fmt:formatDate value="${comment.commentUdate }" pattern="yyyy-MM-dd"/>" readonly="readonly"><br>
</form>
</body>
</html>