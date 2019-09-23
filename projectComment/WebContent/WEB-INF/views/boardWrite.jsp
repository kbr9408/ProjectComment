<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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
<script src="/resources/js/summernote-ko-KR.js"></script>

<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',  
	  });
});

//목록으로
function list_bt(){
	 var form = document.getElementById("boardForm");
	 var url = "<c:url value='/board/list'/>";

	    form.action = url

	    form.submit();
}
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
<h2>Write your story</h2><br>
	<form name="form" id="form" role="form" method="post" action="board/write">
		<div class="mb-3">
			<label for="writer">Writer</label>
			<input type="text" id="writer" name="writer" class="form-control" placeholder="작성자를 입력해 주세요."/><br>
		</div>
		<div class="mb-3">
			<label for="title">Title</label>
			<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해 주세요."/><br>
		</div>
		<div class="mb-3">
			<label for="travelDate">Travel Date</label>
			<input type="date" id="travelDate" class="form-control" name="travelDate"><br>
		</div>
		<div class="mb-3">
			<label for="content">Content</label>
			<textarea class="summernote" id="summernote" name="content" placeholder="내용을 입력해 주세요."></textarea><br>
		</div>
		<div>
			<input class="btn btn-sm btn-primary" id="subBtn" type="button" value="submit" onclick="goWrite(this.form)"/>
			
			<a class="btn btn-sm btn-primary" type="button" id="list" href="<c:url value='/board/list'/>">list</a>
		</div>
		</form>
		
</div>
</article>


</body>

<script>
function goWrite(frm) {
	var title = frm.title.value;
	var writer = frm.writer.value;
	var content = frm.content.value;
	var travelDate = frm.travelDate.value;
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
	
	
	frm.submit();
}
</script>

</html>