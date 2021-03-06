<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
$(function() {
document.querySelector('.img__btn').addEventListener('click', function() {
	  document.querySelector('.cont').classList.toggle('s--signup');
	});
$(document).ready(function () {
	  
	  'use strict';
	  
	   var c, currentScrollTop = 0,
	       navbar = $('nav');

	   $(window).scroll(function () {
	      var a = $(window).scrollTop();
	      var b = navbar.height();
	     
	      currentScrollTop = a;
	     
	      if (c < currentScrollTop && a > b + b) {
	        navbar.addClass("scrollUp");
	      } else if (c > currentScrollTop && !(a <= b)) {
	        navbar.removeClass("scrollUp");
	      }
	      c = currentScrollTop;
	  });
	  
	});
	

$("#LoginCheck").click(function(){
	
	var memberId = $("#ID").val();
	var memberPassword = $("#password").val();
	var re = false;
	var num = 1;
	var formObj = $("form[role='form']"); 
	
	
	if (valdate() == false){
		
		return re;
	}
	
	
	$.ajax({
		 async: true,
            type : 'POST',
            data : memberId,
            url : "member/loginIdCheck.do",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
            	console.log(data);
                if (data.cnt == 0) {
					alert("아이디가 존재하지 않습니다.");
                    
                    $("#ID").focus();
                    num = 0;
                    return false;
                
                } else{
                	$.ajax({
       				 async: true,
       		            type : 'POST',
       		            data : memberPassword,
       		            url : "member/loginPwdCheck.do",
       		            dataType : "json",
       		            contentType: "application/json; charset=UTF-8",
       		            success : function(data) {
       		            	console.log(data);
       		                if (data.cnt == 0) {
       		                    
       		                    alert("비밀번호가 틀렸습니다.");
       		                    $("#password").focus();
       		                    return false;
       		                   
       		                
       		                } else{
       		                 formObj.attr("action", "member/LoginWithSession");    ///board/delete/로
       		                 formObj.submit(); 
       					     


       		                }
       		            }
       		           
       		            
       			});
                }
            }
	});
/* 			if(num == 0){
		return re;
	} */
	
/* 			return re;
*/	
	
});

	
	

$(function() {
    //idck 버튼을 클릭했을 때 
    var idck = 0;
    $("#idck").click(function() {
       
        //userid 를 param.
        var memberId =  $("#memberId").val(); 
        
        $.ajax({
            async: true,
            type : 'POST',
            data : memberId,
            url : "member/idcheck.do",
            dataType : "json",
            contentType: "application/json; charset=UTF-8",
            success : function(data) {
                if (data.cnt > 0) {
                    
                    alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    
                    $("#memberId").focus();
                    
                
                } else {
                    alert("사용가능한 아이디입니다.");
                    //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                    
                    $("#memberPassword").focus();
                    //아이디가 중복하지 않으면  idck = 1 
                    idck = 1;
                    
                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
    
    $('#DosignUp').click(function(){
    	
    	 var userid = $("#memberId").val();
    	    var userpwd = $("#memberPassword").val();
    	    var inputPwdCfm = $("#re_pwd").val();
    	    var username = $("#memberName").val();
    	    var email = $("#memberEmail").val();
    	    var phone = $("#memberPhone").val();
    	 
    	    
    	    if(userid.length == 0){
    	        alert("아이디를 입력해 주세요"); 
    	        $("#memberId").focus();
    	        return false;
    	    }
    	    
    	    if(userpwd.length == 0){
    	        alert("비밀번호를 입력해 주세요"); 
    	        $("#memberPassword").focus();
    	        return false;
    	    }
    	 
    	    if(userpwd != inputPwdCfm){
    	        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
    	        $("#re_pwd").focus();
    	        return false; 
    	    }
    	 
    	    if(username.length == 0){
    	        alert("이름을 입력해주세요");
    	        $("#memberName").focus();
    	        return false;
    	    }
    	    
    	    if(email.length == 0){
    	        alert("이메일을 입력해주세요");
    	        $("#memberEmail").focus();
    	        return false;
    	    }
    	    
    	    if(phone.length == 0){
    	        alert("전화번호를 입력해주세요.");
    	        $("#memberPhone").focus();
    	        return false;
    	    }
    	    
    	    if(confirm("회원가입을 하시겠습니까?")){
    	        alert("회원가입을 축하합니다");
    	        return true;
    	    }
    	    
    	    if(confirm("회원가입을 하시겠습니까?")){
    	        if(idck==0){
    	            alert('아이디 중복체크를 해주세요');
    	            return false;
    	        }else{
    	        alert("회원가입을 축하합니다");
    	        $("#frm").submit();
    	        }
    	    }
    	

    	
    	
    });
    
    
    
});
 
	
	
	
});


function valdate(){
	var re = /^[a-zA-Z0-9]{4,12}$/;
	var id = document.getElementById("memberId");
	var pwd = document.getElementById("password");
	if(!check(re,id,"아이디는 4~12자의 영문 대, 소문자 및 숫자로 입력해주세요")){
		return false;
	}
	if(!check(re,pwd,"비밀번호는 4~12자의 영문 대,소문자 및 숫자로 입력해주세요")){
		return false;
	}
	function check(re,what,msg){
		if(re.test(what.value)){
			return true;
		}
		alert(msg);
		what.value="";
		what.focus();
		location.reload();
	}
	
	function onSignIn(googleUser) {
		 var id_token = googleUser.getAuthResponse().id_token;
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		}
	 function signOut() {
		    var auth2 = gapi.auth2.getAuthInstance();
		    auth2.signOut().then(function () {
		      console.log('User signed out.');
		    });
		  }
}


</script>
<style>
body {
  background: #eee;
  padding: 0;
  margin: 0;
  margin-top: 200px;
  font-family: "Open Sans", sans-serif;
}

.container {
  width: 80%;
  margin: 0 auto;
  clear: both;
}

a {
  display: inline-block;
  color: #333;
  text-decoration: none;
}

nav {
  background: #fff;
  height: 80px;
  line-height: 80px;
  box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 9998;
  transition: all 0.5s;
}
nav.scrollUp {
  transform: translateY(-80px);
}
nav ul.navbar-menu {
  margin: 0;
  padding: 0;
  display: inline-block;
  float: right;
}
nav ul.navbar-menu li {
  display: inline-block;
  margin: 0 10px;
}
nav ul.navbar-menu li a {
  color: #666;
  font-size: 14px;
}
nav a#brand {
  text-transform: uppercase;
  foat: left;
  font-weight: 800;
  font-size: 20px;
}
nav button {
  background: none;
  width: 30px;
  height: 40px;
  margin-top: 20px;
  border: none;
  float: right;
  display: inline-block;
  cursor: pointer;
  display: none;
}
nav button span {
  width: 30px;
  height: 40px;
  height: 2px;
  background: #333;
  display: block;
  margin: 5px 0;
}

@media (max-width: 768px) {
  nav ul.navbar-menu {
    display: none;
  }

  nav button {
    display: block;
  }
}

*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
  background: #ededed;
}

input, button {
  border: none;
  outline: none;
  background: none;
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
}

.tip {
  font-size: 20px;
  margin: 40px auto 50px;
  text-align: center;
}

.cont {
  overflow: hidden;
  position: relative;
  width: 900px;
  height: 700px;
  margin: 0 auto 100px;
  background: #fff;
 
}

.form {
  position: relative;
  width: 640px;
  height: 100%;
 
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
  padding: 50px 30px 0;
}

.sub-cont {
  overflow: hidden;
  position: absolute;
  left: 640px;
  top: 0;
  width: 900px;
  height: 100%;
  padding-left: 260px;
  background: #fff;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}
.cont.s--signup .sub-cont {
  -webkit-transform: translate3d(-640px, 0, 0);
          transform: translate3d(-640px, 0, 0);
}

button {
  display: block;
  margin: 0 auto;
  width: 260px;
  height: 36px;
  border-radius: 30px;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
}

.img {
  overflow: hidden;
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 260px;
  height: 100%;
  padding-top: 360px;
}
.img:before {
  content: '';
  position: absolute;
  right: 0;
  top: 0;
  width: 900px;
  height: 100%;
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/sections-3.jpg");
  background-size: cover;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}
.img:after {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.6);
}
.cont.s--signup .img:before {
  -webkit-transform: translate3d(640px, 0, 0);
          transform: translate3d(640px, 0, 0);
}
.img__text {
  z-index: 2;
  position: absolute;
  left: 0;
  top: 50px;
  width: 100%;
  padding: 0 20px;
  text-align: center;
  color: #fff;
  transition: -webkit-transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out;
  transition: transform 1.2s ease-in-out, -webkit-transform 1.2s ease-in-out;
}
.img__text h2 {
  margin-bottom: 10px;
  font-weight: normal;
}
.img__text p {
  font-size: 14px;
  line-height: 1.5;
}
.cont.s--signup .img__text.m--up {
  -webkit-transform: translateX(520px);
          transform: translateX(520px);
}
.img__text.m--in {
  -webkit-transform: translateX(-520px);
          transform: translateX(-520px);
}
.cont.s--signup .img__text.m--in {
  -webkit-transform: translateX(0);
          transform: translateX(0);
}
.img__btn {
  overflow: hidden;
  z-index: 2;
  position: relative;
  width: 100px;
  height: 36px;
  margin: 0 auto;
  background: transparent;
  color: #fff;
  text-transform: uppercase;
  font-size: 15px;
  cursor: pointer;
}
.img__btn:after {
  content: '';
  z-index: 2;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: 2px solid #fff;
  border-radius: 30px;
}
.img__btn span {
  position: absolute;
  left: 0;
  top: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  transition: -webkit-transform 1.2s;
  transition: transform 1.2s;
  transition: transform 1.2s, -webkit-transform 1.2s;
}
.img__btn span.m--in {
  -webkit-transform: translateY(-72px);
          transform: translateY(-72px);
}
.cont.s--signup .img__btn span.m--in {
  -webkit-transform: translateY(0);
          transform: translateY(0);
}
.cont.s--signup .img__btn span.m--up {
  -webkit-transform: translateY(72px);
          transform: translateY(72px);
}

h2 {
  width: 100%;
  font-size: 26px;
  text-align: center;
}

label {
  display: block;
  width: 260px;
  margin: 25px auto 0;
  text-align: center;
}
label span {
  font-size: 12px;
  color: #cfcfcf;
  text-transform: uppercase;
}

input {
  display: block;
  width: 100%;
  margin-top: 5px;
  padding-bottom: 5px;
  font-size: 16px;
  border-bottom: 1px solid rgba(0, 0, 0, 0.4);
  text-align: center;
}

.forgot-pass {
  margin-top: 15px;
  text-align: center;
  font-size: 12px;
  color: #cfcfcf;
}

.submit {
  margin-top: 40px;
  margin-bottom: 20px;
  background: #d4af7a;
  text-transform: uppercase;
}

.fb-btn {
  border: 2px solid #d3dae9;
  color: #8fa1c7;
}
.fb-btn span {
  font-weight: bold;
  color: #455a81;
}

.sign-in {
  transition-timing-function: ease-out;
}
.cont.s--signup .sign-in {
  transition-timing-function: ease-in-out;
  transition-duration: 1.2s;
  -webkit-transform: translate3d(640px, 0, 0);
          transform: translate3d(640px, 0, 0);
}

.sign-up {
  -webkit-transform: translate3d(-900px, 0, 0);
          transform: translate3d(-900px, 0, 0);
}
.cont.s--signup .sign-up {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}

.icon-link {
  position: absolute;
  left: 5px;
  bottom: 5px;
  width: 32px;
}
.icon-link img {
  width: 100%;
  vertical-align: top;
}
.icon-link--twitter {
  left: auto;
  right: 5px;
}

.myButton {
	-moz-box-shadow:inset 0px 21px 2px -1px #ffffff;
	-webkit-box-shadow:inset 0px 21px 2px -1px #ffffff;
	box-shadow:inset 0px 21px 2px -1px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
	background-color:#ffffff;
	-moz-border-radius:30px;
	-webkit-border-radius:30px;
	border-radius:30px;
	border:1px solid #dcdcdc;
	position : relative;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:10px;
	font-weight:bold;
	padding:4px 8px;
	text-decoration:none;
	text-shadow:-2px 1px 0px #ffffff;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
.myButton:active {
	position:relative;
	top:1px;
}

        

</style>
</head>
<body>
<nav>
  <div class="container">
    
    <a href="/CommaProjectTest/index.jsp" id="brand" ><img height = "22px;" src="${pageContext.request.contextPath}/resources/img/blackLogo.png"/></a>
    <button>
      <span></span>
      <span></span>
      <span></span>
    </button>
    
    <ul class="navbar-menu">
      <li><a href="#">Home</a></li>
      <li><a href="#">page a</a></li>
      <li><a href="#">page b</a></li>
      <li><a href="#">page c</a></li>
      <li><a href="#">page d</a></li>
    </ul>
    
  </div>
</nav>
<% System.out.println("TTTTESTESTEST : "+session.getAttribute("loginInfo")); %>
<c:choose>
	
    <c:when test="${not empty loginInfo}">
   		  <h2>로그인 성공 </h2>
        이름 : ${sessionScope.loginInfo.memberName}
        
        이메일 : <c:out value="${sessionScope.loginInfo.memberEmail}"/> 
        <a href="member/logout.do">로그아웃</a>
        <a href="boardWrite.jsp">글쓰러가기</a>  <a href="page2">페이지2</a>
    
    
    
    
    
    
        </c:when>
    
        <c:otherwise>
    
<p class="tip">Click on button in image container</p>
<div class="cont">
  <div class="form sign-in">
  <br><br><br><br><br>
    <h2>Welcome back,</h2>
     <form role = "form" id = "frm1" name="form1" method="post">
    <label>
      <span>User ID</span>
      <input type="text" id = "ID" name = "memberId2"/>
    </label>
    <label>
      <span>Password</span>
      <input type="password" name="password" id ="password" />
    </label>
    <p class="forgot-pass">Forgot password?</p>
    <button type="button" class="submit" id="LoginCheck">Sign In</button>
    <button type="button" class="fb-btn">Connect with <span>facebook</span></button>
    </form>
  </div>
  <div class="sub-cont">
    <div class="img">
      <div class="img__text m--up">
        <h2>New here?</h2>
        <p>Sign up and discover great amount of new opportunities!</p>
      </div>
      <div class="img__text m--in">
        <h2>One of us?</h2>
        <p>If you already has an account, just sign in. We've missed you!</p>
      </div>
      <div class="img__btn">
        <span class="m--up">Sign Up</span>
        <span class="m--in">Sign In</span>
      </div>
    </div>
    
    
    
    <div class="form sign-up">
          	<div method="post">
      <h2>Time to feel like home,</h2>
      <form action = "member/insertMember" method = "post">
      <label>
        <span>Name</span>
        <input type="text"  name = "memberName" id = "memberName"/>
      </label>
      <label>
      
        <span>User ID </span><a class="myButton" id ="idck">중복체크</a>
        <input type="text" name="memberId" id="memberId"/>
      </label>
      
      <label>
        <span>Password</span>
        <input type = "password" name = "memberPassword" id = "memberPassword"/>
      </label>
      <label>
        <span>Confirm Password</span>
        <input type = "password" name = "re_pwd" id = "re_pwd" />
      </label>
      <label>
        <span>Email</span>
        <input type = "email" name = "memberEmail" id = "memberEmail" />
      </label>
      <label>
        <span>Phone</span>
        <input type = "tel" name = "memberPhone" id = "memberPhone" />
      </label>
      <button type="submit" name = "frm" class = "submit" id="DosignUp">Sign Up</button>
      <button type="button" class="fb-btn">Join with <span>facebook</span></button>
      	</form>
      
    </div>
  </div>
</div>

    </c:otherwise>
</c:choose>
	
	
</body>
</html>