<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>게시글 목록</title>

</head>
<body>
<h2>게시글 목록</h2>
<form name="form1" method="post" action="search/list.do">
	<select name="searchOption">
		<!-- 검색조건을 검색처리후 결과화면에 보여주기 위해 -->
		<option value="all" <c:out value="${map.searchOption == 'all'?'selected':'' }"/>>제목+작성자+내용</option>
		<option value="writer" <c:out value="${map.searchOption == 'writer'?'selected':'' }"/>>이름</option>
		<option value="content" <c:out value="${map.searchOption == 'content'?'selected':''} "/>>내용</option>
		<option value="title" <c:out value="${map.searchOption == 'title'?'selected':'' }"/>>제목</option>
	</select>
	<input name="keyword" value="${map.keyword }">
	<input type="submit" value="조회">

	<div>            
		 <a href='#' onClick='fn_write()'>write</a>            
	</div>
	<!-- 레코드의 갯수를 출력 -->
	${map.count }개의 개시물이 있습니다.
<div>
        <table border="1" width="600px">
            <thead>
                <tr>
                    <th>no.</th>
                    <th>title</th>
                    <th>writer</th>
                    <th>travelDate</th>
                    <th>writeDate</th>
                    <th>updateDate</th>
                    <th>views</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="result" items="${list}">
                    <tr>
                        <td>${result.boardId }</td>
                        <td><a href='#' onClick='fn_view(${result.boardId})'>${result.title }</a></td>
                        <td>${result.writer }</td>
                        <td>${result.travelDate }</td>
                        <td>${result.wDate }</td>
                        <td>${result.uDate }</td>
                        <td>${result.replyCount}</td>
                        <td><a type="button" onclick="comment_create(${result.boardId})">코멘트쓰기</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        </form>
        <div>            
            <a href='#' onClick='fn_write()'>write</a>            
        </div>
<script>
function comment_create(boardId){
	var form = document.getElementById("boardForm");
	var url = "<c:url value='../commentList.jsp'/>";
	url = url + "?boardId=" + boardId;
	form.action = url;
	form.submit();
}

//글쓰기
function fn_write(){
    
    var form = document.getElementById("boardForm");
    
    form.action = "<c:url value='/boardWrite.jsp'/>";
    form.submit();
    
}
 
//글조회
function fn_view(boardId){
    
    var form = document.getElementById("boardForm");
    var url = "<c:url value='/board/viewOne'/>";
    url = url + "?boardId=" + boardId;
    
    form.action = url;    
    form.submit(); 
}
</script>
</div>
</body>
</html>