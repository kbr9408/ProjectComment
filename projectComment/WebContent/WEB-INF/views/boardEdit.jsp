<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- include summernote-ko-KR -->

<script src="webapp/js/summernote-ko-KR.js"></script>

<title>수정하기</title>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({

 	    	placeholder: 'content',

	        minHeight: 370,

	        maxHeight: null,

	        focus: true, 

	        lang : 'ko-KR'

	  });

	});

</script>

<style>
	body {
		padding-top:30px;
		padding-bottom:30px;
	}
</style>
</head>
<body>
<article>
<div class="container" role="main">
<h2>Edit your story</h2>
	<form name="form" role="form" id="boardForm" method="post">
	<div class="mb-3">
		<label for="writer">Writer</label>
		<input type="text" name="writer" class="form-control" value="${board.writer}"/><br>
	</div>
	<div class="mb-3">
		<label for="title">Title</label>
		<input type="text" name="title" class="form-control" value="${board.title}"/><br>
	</div>
	<div class="mb-3">
		<label for="travelDate">Travel Date</label>
		<input type="date" name="travelDate" class="form-control" value="<fmt:formatDate value="${board.travelDate}" pattern="yyyy-MM-dd"/>" ><br>
	</div>
	<div class="mb-3">
		<label for="wDate">최초 작성일 : </label>
		<fmt:formatDate value="${board.wDate}" pattern="yyyy-MM-dd HH:mm:ss"/><br><br>
	</div>
	<div class="mb-3">
		<label for="content">Content</label>
		<textarea id="summernote" name="content"> ${board.content}</textarea><br>
	</div>
	<div>
		<input class="btn btn-sm btn-primary" id="subBtn" type="button" value="submit" onclick="goModify()"/>
		<a class="btn btn-sm btn-primary" type="button" id="list" href="<c:url value='/board/list'/>">list</a>
	</div>
	</form>
</div>
</article>
</body>

<script>
function goModify(){
    
    var form = document.getElementById("boardForm");
    var url = "<c:url value='/board/modifyUpload'/>";
    url = url + "?boardId=" + ${board.boardId};
    
    form.action = url;    
   
	var title = "${board.title}";
	var writer = "${board.writer}";
	var content = "${board.content}";
	var travelDate = "${board.travelDate}"
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}

	if (writer.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}

	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}

	if (travelDate.trim() == ''){
		alert("날짜 입력해주세요");
		return false;
	}

	form.submit();
}

</script>

</html>