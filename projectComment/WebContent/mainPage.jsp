<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(function() {
	$(document).ready(function () {

        $('span').click(function() {
            $('.overlay').toggleClass('anim');
        });

        $('.animation').click(function(){
            $('.anim').toggleClass('reverse-animation');
        })
});
	
	
	
	
});


</script>
<meta charset="UTF-8">
<style type="text/css">
@font-face {
  font-family: 'Sucrose Bold Two';
  src: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/sucrose.woff2") format("woff2");
}
@font-face {
  font-family: 'IM Fell French Canon Pro';
  src: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/im-fell-french-canon-pro.woff2") format("woff2");
}
* {
  box-sizing: border-box;
}

body {
  margin: 0;
}



header {
  background: url("https://media2.giphy.com/media/ToMjGpxInCZSzD3V82s/giphy.gif?cid=790b7611417d579817d384d8a047a9cb2052edca21ef0e68&rid=giphy.gif");
  padding-top: 55%;
  background-size: cover;
  font-family: 'Sucrose Bold Two';
}

header img {
  position: absolute;
  background: blue;
  top: 0;
  right: 0;
  width: 45.8%;
}

header h1 {
  position: fixed;
  top: 2rem;
  right: 2rem;
  font-size: 12vw;
  line-height: .8;
  margin-top: 0;
  text-align: center;
}

header h1 span {
  display: block;
  font-size: 8.75vw;
}

main {
  background: #fff;
  position: relative;
  border: 1px solid #fff;
  font-family: 'IM Fell French Canon Pro';
  font-size: 1.4rem;
  padding: 5rem 100%;
  line-height: 1.6;
}

@media all and (max-width: 400px) {
  main {
    padding: 2rem;
  }
}


body .wrapper {
  width: 100%;
  height: 100vh;
/*   background: #1D1313;
 */  position: absolute;
  overflow: hidden;
}
body .wrapper span {
  z-index: 9999;
  position: absolute;
  top: 20px;
  left: 10px;
  width: 35px;
  height: 4px;
  background: #ffffff;
  cursor: pointer;
}
body .wrapper span:before, body .wrapper span:after {
  display: block;
  position: absolute;
  content: '';
  left: 0;
  height: 4px;
  width: 35px;
  background: #ffffff;
}
body .wrapper span:before {
  top: -8px;
}
body .wrapper span:after {
  bottom: -8px;
}
body .wrapper .title {
  position: absolute;
  top: 50%;
  left: 50%;
  height: 100px;
  margin-top: -50px;
  width: 50%;
  margin-left: -25%;
  text-align: center;
}
body .wrapper .title h1 {
  color: #30C4C9;
}
body .wrapper .overlay {
  position: absolute;
  bottom: -99%;
  height: 100%;


  background: rgba(255,255,255,0.5);
  
  left: 0;
  width: 100%;
  transition: all 0.5s ease;
}
body .wrapper .overlay.anim {
  left: 0;
  bottom: 0;
 
  animation: menu-anim 1.5s 1 ease-out normal;
  width: 20%;
  transition: all 0.5s ease;
}
body .wrapper .overlay.anim.reverse-anim {
  left: 0;
  bottom: 0;
  animation: menu-anim 1.5s 1 ease-out reverse;
  width: 20%;
  transition: all 0.5s ease;
}
body .wrapper .overlay ul {
  width: 100%;
  text-align: center;
  margin-top: 100px;
  padding-left: 0;
  margin-left: -10px;
  font-size: 2em;
  font-weight: 800;
}
body .wrapper .overlay ul li {
  margin: 10px 0;
}
body .wrapper .overlay ul li a {
  text-decoration: none;
 color: rgba(255,255,255,1);

  position: relative;
  display: inline-block;
  padding: 10px 0;
  overflow: hidden;
}
body .wrapper .overlay ul li a:after {
  display: block;
  border-radius: 2px;
  content: '';
  left: 0;
  bottom: -10px;
  height: 5px;
  background: white;
  transform: translateX(-101%);
}
body .wrapper .overlay ul li a:hover {
  text-decoration: none;
}
body .wrapper .overlay ul li a:hover:after {
  animation: border-anim 0.5s 1 ease normal;
  transform: translateX(0);
}
@-webkit-keyframes border-anim {
  0% {
    transform: translateX(-100%);
  }
  100% {
    transform: translateX(0);
  }
}
@-webkit-keyframes menu-anim {
  0% {
    left: 0;
    bottom: -99%;
    width: 100%;
  }
  33% {
    left: -99.5%;
    bottom: -99%;
    width: 100%;
  }
  66% {
    left: -99.5%;
    bottom: 0;
    width: 100%;
  }
  100% {
    bottom: 0;
    left: 0;
    width: 25%;
  }
}



</style>
<title>Insert title here</title>
</head>
<body>
<!-- <base href="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/"> -->
<div class="wrapper">
    <span class="menu"></span>

    
    <div class="overlay">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Story</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>

</div>
<header>


	<h1>comma <span>of the</span> Lost</h1>
	<!-- <img src="mountain-range-front.png"> -->
	
</header>
<main>
  <div id="googleMap" style="width:800px;height:450px;"></div>
</main>

<h2>${sessionScope.loginInfo.memberId }님 <small>반갑습니다.</small></h1></h2>
</body>
</html>