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
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>ResultPage</title>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <style>
 	body {
  background: #eee;
  margin: 0;
  padding: 0;
  font-family: "Source Sans Pro", sans-serif;
  color: #333;
}

header {
  width: 100%;
  padding: 20px 0;
  background: #fff;
  border-bottom: 1px solid #e1e1e1;
  /* animation magic */
  transition: all 0.4s ease-in-out;
  -webkit-transition: all 0.4s ease-in-out;
  -moz-transition: all 0.4s ease-in-out;
  z-index: 9999;
  top: 0;
  position: fixed;
}

header h1 {
  font-size: 30px;
  text-indent: 40px;
  font-weight: bold;
}



.container {
  width: 60%;
  margin: 180px auto;
}

.shrink {
  padding: 20px 0;
}

p {
  margin: 0 0 40px 0;
  line-height: 24px;
}

strong {
  font-weight: bold;
}


 </style>
</head>
<body>
<head>
  <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro' rel='stylesheet' type='text/css'>

  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>
<form id="boardForm" role="form" method="post" autocomplete="off"> 
<header>
  <h1>${board.title}</h1><br>
  
</header>
<section class="container">
	<p><strong>${board.writer}&ensp;
	|&ensp;<fmt:formatDate value="${board.wDate}" pattern="yyyy. MM. dd. HH:mm"/>&ensp;
	|&ensp;Travel Date_ <fmt:formatDate value="${board.travelDate}" pattern="yyyy-MM-dd"/>&ensp;
	|&ensp;View_ ${board.viewCount }
	
	</strong></p>
	<hr>
  	
	${board.content} 
		<input type="hidden" name="boardId" value="${board.boardId}"/><br>
		<input type="hidden" name="writer" value="${board.writer}"/><br>
		<input type="hidden" name="title"  value="${board.title}"/>
		<input type="hidden" name="travelDate" value="<fmt:formatDate value="${board.travelDate}" pattern="yyyy-MM-dd"/>"/><br>
		<input type="hidden" name="content" value="${board.content}"/>
		<input type="hidden" name="viewCount" value="${board.viewCount}"/>
		<input type="hidden" name="wDate" value="<fmt:formatDate value="${board.wDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
		<input type="hidden" name="uDate" value="${board.uDate}"/>
		
			<button class= "btn btn-primary" id="modify_btn">modify</button>
			<button class="btn btn-primary" id="delete_btn">delete</button>
			<button class="btn btn-primary" id="list_btn">list</button>
		
		
</section>






</form> 



<script>

// 폼을 변수에 저장

var formObj = $("form[role='form']");

$("#modify_btn").click(function(){
	 var form = document.getElementById("boardForm");
	 var url = "<c:url value='/board/modify'/>";
	 url = url + "?boardId=" + ${board.boardId};    
	 form.action = url;    
	 form.submit();
	
});

$("#delete_btn").click(function(){
	if(confirm("are you sure?")==true){
			formObj.attr("action", "delete");
			formObj.attr("method", "post");
			formObj.submit();
	}else{
		return;
	}
}); 

$("#list_btn").click(function(){
	formObj.attr("action", "list");
	formObj.attr("method", "post");
	formObj.submit();
})

</script> 
</body>
</html>