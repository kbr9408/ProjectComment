<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html {
  font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
}
body {
  max-width: 480px;
  width: 100%;
  margin: 30px auto 0 auto;
}
a { cursor: pointer; }

/**
 * Customs
 */
.comments:after { border-color: #fff; }
.comments:before { background-color: #fff; }
.comments .comment {
  background: #fff;
  border-radius: 10px;
  font-size: 11px;
  padding: 10px 15px;
}
.comments [class*="level-"] .photo:before { background-color: #fff; }
.comments .meta { color: #ccc; }
.comments .meta a { color: inherit; }
.comments .meta a:hover { color: #34b5d0; }
.comments .body { color: #888; }

/**
 * Comments Thread
 */
.comments {
  list-style-type: none;
  padding: 5px 0 0 46px;
  position: relative;
  margin: 0 0 0 12px;
}
.comments:before,
.comments .comment,
.comments .comment:after,
.comments .comment:before,
.comments .photo img,
.comments [class*="level-"] .photo:before {
  box-shadow: 0 1px 3px rgba(0,0,0,.4);
}
.comments:after,
.comments:before {
  display: block;
  content: '';
  position: absolute;
}
.comments:before {
  border-radius: 0 0 5px 5px;
  height: 100%;
  width: 8px;
  left: 0;
  top: 0;
}
.comments:after {
  box-shadow: 0 1px 3px rgba(0,0,0,.4), 0 1px 3px rgba(0,0,0,.4) inset;
  border-width: 4px;
  border-style: solid;
  border-radius: 18px;
  height: 10px;
  width: 10px;
  left: -5px;
  top: -16px;
  z-index: -1;
}
.comments .comment {
  margin-bottom: 10px;
  position: relative;
}
.comments .comment:after,
.comments .comment:before {
  border-radius: 10px;
  background-color: #fff;
  position: absolute;
  display: block;
  content: '';
}
.comments .comment:after {
  width: 12px;
  height: 12px;
  left: -14px;
  top: 7px;
}
.comments .comment:before {
  width: 5px;
  height: 5px;
  left: -22px;
  top: 16px;
}
.comments .photo {
  position: absolute;
  left: -60px;
  top: 2px;
}
.comments .photo img {
  border: 1px solid #fff;
  border-radius: 32px;
  overflow: hidden;
}
.comments .meta { margin-bottom: 5px; }
.comments .meta .reply { display: none; float: right; }
.comments .comment:hover .reply { display: block; }
.comments [class*="level-"] .photo:before {
  display: block;
  content: '';
  position: absolute;
  margin-top: -2px;
  height: 4px;
  width: 20px;
  left: -10px;
  top: 50%;
  z-index: -1;
}
.comments .level-2 { margin-left: 30px; }
.comments .level-3 { margin-left: 50px; }
.comments .level-4 { margin-left: 70px; }
.comments .level-5 { margin-left: 90px; }
.comments .level-6 { margin-left: 110px; }
.comments .level-3 .photo:before { width: 40px; left: -30px;}
.comments .level-4 .photo:before { width: 60px; left: -50px;}
.comments .level-5 .photo:before { width: 80px; left: -70px;}
.comments .level-6 .photo:before { width: 100px; left: -90px;}
</style>
</head>
<body>
<ul class="comments">
  <li class="comment">
    <a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Kasper"></a>
    <div class="meta">Kasper | 2012.07.24 14:58 <a class="reply">Reply</a></div>
    <div class="body">Cupcake ipsum dolor sit amet. Icing donut cheesecake muffin marzipan chocolate biscuit. Sweet roll chocolate marzipan.</div>
  </li>
  <li class="comment level-2">
    <a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Photo"></a>
    <div class="meta">John | 2012.07.24 15:21 <a class="reply">Reply</a></div>
    <div class="body">Candy soufflé bear claw apple pie bear claw marshmallow. Jelly brownie wafer chocolate jelly.marzipan pastry sesame snaps apple pie.</div>
  </li>
  <li class="comment level-3">
    <a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Photo"></a>
    <div class="meta">Jane | 2012.07.24 15:32 <a class="reply">Reply</a></div>
    <div class="body">Tart apple pie bonbon applicake sesame snaps sugar plum.</div>
  </li>
  <li class="comment level-4">
    <a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Photo"></a>
    <div class="meta">Jane | 2012.07.24 15:32 <a class="reply">Reply</a></div>
    <div class="body">Tart apple pie bonbon applicake sesame snaps sugar plum.</div>
  </li>
  <li class="comment">
    <a href="#" title="View this user profile" class="photo"><img src="https://placehold.it/32x32" alt="Kasper"></a>
    <div class="meta">Kasper | 2012.07.24 14:58 <a class="reply">Reply</a></div>
    <div class="body">Cupcake ipsum dolor sit amet. Icing donut cheesecake muffin marzipan chocolate biscuit.</div>
  </li>
</ul>
</body>
</html>