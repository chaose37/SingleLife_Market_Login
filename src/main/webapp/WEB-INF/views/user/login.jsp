<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

html, body,p, input, button, h1, h2, h3, h4, h5 {
  font-family: "Open Sans";
}
body {
    margin: 0;
    width: auto;
    opacity: 1;
    font-size: 2em;
    padding: 0;
}
.background {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 100%;
  background: url('http://www.mrwallpaper.com/wallpapers/landscape-road.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center; 
  z-index: -10;
}
.wrapper {
  width: 100%
}
.auth {
  position: fixed;
  width: 375px;
  border-radius: 15px;
  height: 550px;
  left: 50%;
  top: 5%;
  bottom: 10%;
  right: 40%;
  margin-left: -195px;
  background: -moz-linear-gradient(-45deg, #0a1233 0%, #1d4499 26%, #5c7daa 72%, #146882 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,#0a1233), color-stop(26%,#1d4499), color-stop(72%,#5c7daa), color-stop(100%,#146882)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(-45deg, #0a1233 0%,#1d4499 26%,#5c7daa 72%,#146882 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(-45deg, #0a1233 0%,#1d4499 26%,#5c7daa 72%,#146882 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(-45deg, #0a1233 0%,#1d4499 26%,#5c7daa 72%,#146882 100%); /* IE10+ */
background: linear-gradient(135deg, #0a1233 0%,#1d4499 26%,#5c7daa 72%,#146882 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0a1233', endColorstr='#146882',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
  visibility: visible;
  transition: all 250ms ease-out;
  z-index: 100;
}
.auth.close {
  visibility: hidden;
  transition: all 250ms ease-out;
}
.auth.opa {
 opacity: 0.825;
}
.login-title {
  positon: fixed;
  width: 100%;
  color: #EBFAFC;
  margin-top: 220px;
  margin-left: .5px;
  opacity: 0.8;
  visibility: visible;
}
.login-title h3{
   font-weight: 200;
   font-size: 0.5em;
   text-align:center;
}

.auth.close .login-title {
  visibility: hidden !important;
  transition: all 250ms ease-in;
}
.image-size {
  position: fixed;
  width: 225px;
  height: 225px;
  margin-top: 20px;
  margin-left: 75px;
  opacity: 1;
  visibility: visible;
}
.auth.close .image-size {
  visibility: hidden;
  transition: all 250ms ease-in;
}

input {
  background-color: transparent;
  margin-top: 5%;
  border: none;
  border-bottom: 1px solid #ffffff; 
  opacity: 1;
}
.inputWrapper {
  position: relative;
  width: 100%;
  margin-top: 15px;
}
.user-icon {
  position: absolute;
  color: #ffffff;
  opacity: 0.7;
  margin-top: 20px;
  margin-left: 40.5px;
  font-size: 0.75em;
}
.username,
.password {
  width: 70%;
  height: 30px;
  padding: .25em 0 .25em .25em;
  margin-left: 40.5px;
}
.username:focus,
.password:focus {
 border: 1px solid #ff656c;
}

input[placeholder] {
  cursor: arrow;
  font-size: .5em;
  color: #ffffff;
  padding: 0.5em .25em .25em 2.2em;
}
input[placeholder]:focus
{
  border-color: #ff656c;
}
.fa:focus,
.fa:active,
.fa:checked{
  opacity: 1;
  color: #ff656c !important;
  background-color: #ff656c;
}

.username:focus,
.password:focus{
  border: 1px solid #ff656c;
}

.btn {
  cursor: pointer;
  font-size: 0.65em;
  line-height: 22px;
  font-weight: 300;
  font-family: "Helvetica";
  color: #efefef;
  background-color: #f43d6d;
  border: none;
  padding: .35em 2.35em .35em 2.35em;
  margin-top: 42.5px;
  border-radius: 20px;
  margin-left: 107.5px;
  opacity: 1;
  transition: opacity 250ms;
}
.btn.loading {
  width: 40px;
  height: 40px;
  font-size: 0;
  border-radius: 50px;
  margin-left: 167.5px;
  margin-top: 35px;
  padding: 1.5em;
  background-color: #e8a7bb;
  animation: spin 0.5s linear infinite;
  transition: opacity 550ms ease-out;
}

@keyframes spin{
  0%{ opacity: 1; transform: rotate(30deg);}
  50%{opacity: 0.8;}
  100%{opacity: 1; transform: rotate(360deg);}
}

.forget{
  font-size: 0.45em;
}
.forget p {
   color: #12123;
  margin-left: 85px;
}
.forget>p>span {
  display: inline;
  margin-left: 20px;
}
.forget>p>span>a {
   color: #efefef;
}

/*--- overlay ---*/
.overlay {
  position: absolute;
  background-color: #efefef;
  top: 0;
  right: 0;
  bottom: 0;
  width: 100%;
  height: 550px;
  overflow: hidden;
  visibility: hidden;
  transition: all 250ms ease-in;
}
.overlay.open {
  visibility: visible;
  transition: all 250ms ease-in;
  animation: flash .2s linear;
  overflow: hidden;
}
@keyframes flash {
  0% {opacity: 0;}
  80%{opacity: 0.8;}
  100%{opacity: 1;}
}

/*--- bottom-buttom---*/
.footer {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  width: 375px;
  height: 40px;
  background-color: #000;
  opacity: 1 !important;
  transition: opacity 200ms ease-in;
}
div.no h3 {
font-size: 0.5em; color: #efefef; margin-top: 10px;margin-left: 5px;}
.bottom-button {
  cursor: pointer;
  position: absolute;
  bottom: 5px;
  right: 18px;
  width: 20px;
  height: 20px;
  border-radius: 50px;
  border: 3px solid #fafafa;
  transition: 250ms opacity linear;
}
.bottom-button:hover{
  background-color: #efefef;
  border: none;
}
.bottom-button.back {
  z-index: 50;
  border: none;
  background-color:#f43d6d;
  transition: 250ms opacity ease-out;
  animation: spin2 .25s ease-out; 
}
@keyframes spin2{
  0%{ opacity: 1; transform:  rotate(30deg);}
  90%{opacity:1;}
  100%{ opacity: 1; transform: 
    scale(80);}
}
.view {
  position: absolute;
  font-size: 0.6em;
  top: 85%;
  left: 45%;
  margin-top: 50px;
}

.profile {
  z-index: 0.1;
  position: absolute;
  top: 0;
  width: 100%;
  height: 248px;
  background: url("http://cdn.images.express.co.uk/img/dynamic/1/590x/fog-448188.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: top;  
}
.overlay-color {
  position: absolute;
  top: 0;
  right: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background-color: #473F5B;
  opacity: 0.2;
}

.profile-pic{
  width: 60px;
  height: 60px;
  border: 2px solid #f9f9f9;
  border-radius: 50%;
  margin-top: 25px;
  margin-left: 25px;
}
.name {
  font-size: 0.75em;
  color: #ffffff;
  margin-top: -60px;
  margin-left: 120px;
}
.writing {
  position: absolute;
  color: #efefef;
  font-size: 0.35em;
  margin-top: -5px;
  margin-left: 100px;
}
.profile-left {
  position: absolute;
  top: 279px;
  left: 0;
  width: 187.5px;
  height: 80px;
  border-bottom: 1.25px solid #9aa6a9;
  border-right: 1px solid #697a87; 
}
li {
  list-style: none;
}
.calendar {
  position: absolute;
  width: 100%;
  height: 50px;
  top: 160px;
  z-index: 5;
}
.calendar-list{
  position: relative;
  width: 100%;
}
.calendar-list>li {
  display: inline;
  width: 15%;
  float: left;
  margin-left: 22.5px;
}
.line-ca,
.line-ca2{
  position: absolute;
  width: 20px;
  height: 2px;
  background-color: #fff;
  top: 45px;
}
.line-ca{
  left: 10px;
}
.line-ca2{
  right: 50px;
}
.line-ca:nth-child(1),
.line-ca2:nth-child(2){
  transform: rotate(-45deg);
}
.line-ca:nth-child(2),
.line-ca2:nth-child(1){
  transform: rotate(45deg);
}

.line-ca:nth-child(2){
  top: 58px;
}
.line-ca2:nth-child(2){
  top: 58px;
}
.calendar-list li>h4 {
  position: absolute;
  font-size: 0.5em;
  margin-top: 20px;
  color:#f9f9f9;
}
.calendar-list li>h5{
  font-size: 0.5em;
  margin-top: 50px;
  margin-left: 5px;
  color:#f9f9f9;
}
.profile-left h5
 {
  font-size: 0.5em;
  color: #516072;
  margin-left: 70px;
  margin-top: 5px;
  font-weight: 300;
  opacity: 0.75;
}
.profile-right h5{
  font-size: 0.5em;
  color: #516072;
  margin-left: 70px;
  margin-top: 5px;
  font-weight: 300;
  opacity: 0.75;
}
.profile-left span {
  position: absolute;
  font-size: 0.5em;
  color: #697a87;
  margin-left: 35px;
  margin-top: -15px;
  opacity: 1;
}
.profile-right span {
  position: absolute;
  font-size: 0.5em;
  color: #697a87;
  margin-left: 45px;
  margin-top: -15px;
  opacity: 1;
}
.profile-right{
  position: absolute;
  top: 279px;
  right: 0;
  width: 187.5px;
  height: 80px;
  border-bottom: 1.25px solid #9aa6a9;
}

.tasks {
  position: absolute;
  width: 100%;
  height: 150px;
  top: 360px;
  left: 0;
  right: 0;
  background-color: #efefef;
}
.task{
  cursor: pointer;
  position: relative;
  width: 100%;
  height: 40px;
  border-bottom: 1px solid #9aa6a9;
}
.task h3{
  font-size: 0.5em;
  color: #697a87;
  font-weight: 300;
  margin-left: 65px;
  margin-top: 20px;
}
.task span {
  float: right;
  font-size: 0.4em;
  color: #9aa6a9;
  margin-top: -35px;
  margin-right: 10px;
}
.task span>i {
  margin-right: 10px;
}

.task-pic {
  position: absolute;
  width: 30px;
  height: 30px;
  border: 1px solid #fff;
  margin-left: 15px;
  margin-top: -2px;
}
</style>

<!-- 로그인 실패시 오류메시지 띄우기 -->
<script>
	$(function(){
		if ("${msg}"){
			$("#result").html("${msg}");
		}
	})
	$(document).ready(function() {
    	
  	var $auth = $('.auth');
  	var $overlay = $('.overlay');
  	var $loginButton = $('.btn');
    var $backButton = $('.bottom-button');

  
 $loginButton.click(function(){      $(this).toggleClass('loading');       $auth.removeClass('opa');      
$backButton.removeClass('back');                         
  setTimeout(function() {
		$auth.toggleClass('close');
    $overlay.toggleClass('open');
    $menu.fadeIn(200);
    $('.diamond').fadeIn(200);
   },5000);                                
  });
  
  var $s = $('.s');
	var $line = $('.line');
  var $menu = $('.menu');


  $backButton.click(function() {
    $(this).addClass('back');
    $s.removeClass('spread');
    $line.removeClass('open');
    
    $overlay.removeClass('open');
    $auth.addClass('opa');   
    $auth.removeClass('close'); 
	$loginButton.removeClass('loading');
    $('.nav-menu').removeClass('open');
  });
  
  
  $menu.click(function() {
    $line.toggleClass('open');
    $s.toggleClass('spread');
    $('.nav-menu').toggleClass('open');
  });
});
</script>
<!-- 아이디 저장 체크시 쿠키저장 -->
<script>
$(function() {

	a();

	function a () {
		var pathSvg = $("#path").get(0),
			pathMain = pathSvg.getTotalLength();

		var confirm = $("#confirm").get(0),
			pathConfirm = confirm.getTotalLength();

		var contour = $("#contour").get(0),
			pathContour = contour.getTotalLength();

		var circle = $("#circle").get(0),
			pathCircle = circle.getTotalLength();	

		var line = $("#line").get(0),
			pathLine = line.getTotalLength();

		var time = 300;

		$("path").each(function() {
			var path = $(this).get(0),
				pathTotal = path.getTotalLength();

			$(this).css({
				'stroke-dasharray': pathTotal,
				'stroke-dashoffset': pathTotal
			});
		});

		$(".email, .password").on('focusin', function() {
			$(this).parent(".cd-block").addClass('in-focus');
		});

		$(".email, .password").on('focusout', function() {
			$(this).parent(".cd-block").removeClass('in-focus');
		});

		$(".email, .password").on('change keyup', function() {
			($(this).val() !== '') ? $(this).parent(".cd-block").addClass('typing') : $(this).parent(".cd-block").removeClass('typing');
		});

		$(".email").on('focusin keyup', function() {

			$("#path").animate({
				'stroke-dashoffset': pathMain - $(".email").innerWidth()
			}, time);

			//Validation Email - http://stackoverflow.com/questions/3663968/how-to-validate-email-in-jquery
			var testEmail = /^[A-Z0-9._%+-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i;

		    (testEmail.test(this.value)) ? $("#confirm").animate({'stroke-dashoffset': 0}, time) : $("#confirm").animate({'stroke-dashoffset': pathConfirm}, time);

		});

		$(".password").on('focusin keyup', function() {

			$("#path").animate({
				'stroke-dashoffset': - (pathMain - $(".email").innerWidth())
			}, time);

			if ($(this).val() == '') {
				$("#contour").animate({'stroke-dashoffset': pathContour}, time);
				$("#circle").animate({'stroke-dashoffset': pathCircle}, time);
				$("#line").animate({'stroke-dashoffset': pathLine}, time);
				$(".password").attr('type', 'password');
			} else {
				$("#contour, #circle").animate({'stroke-dashoffset': 0}, time);
			}

		});

		$("#show_password").on('click', function() {
			$(".password").attr('type') === 'password' ? 
			($(".password").attr('type', 'text'), $("#line").animate({'stroke-dashoffset': 0}, time)) : 
			($(".password").attr('type', 'password'), $("#line").animate({'stroke-dashoffset': pathLine}, time));
				
		});
	}

});
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 1); // 1일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>
</head>
<body>
<div class="contenido1 bg-animado-blue">  
<head>
  <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
</head>
<div class="wrapper">
  <div class="background"></div>
  <div class="auth opa">
     <div class="image-size">
     <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 150 150" enable-background="new 0 0 150 150" xml:space="preserve">
<g id="レイヤ?_1">
</g>
<g id="レイヤ?_2">
</g>
<g id="レイヤ?_3">
</g>
<g id="レイヤ?_5">
</g>
<g id="レイヤ?_7">
	<g>
		
	</g>
	<g>
		<g>
			<path fill="#efefef" d="M39.7,56c9.6,17.6,19.2,35.3,28.8,52.9c0.6,1,2,0.9,2.6,0c15-23.1,29.9-46.1,44.9-69.2
				c1.1-1.6-1.5-3.1-2.6-1.5c-15,23.1-29.9,46.1-44.9,69.2c0.9,0,1.7,0,2.6,0c-9.6-17.6-19.2-35.3-28.8-52.9
				C41.4,52.8,38.8,54.4,39.7,56L39.7,56z"/>
		</g>
	</g>
</g>
<g id="レイヤ?_6">
</g>
</svg>
 </div>
  <div class="login-title">
      <h3>Welcome Back!</h3>
  </div>
 <div class="inputWrapper">
      <div class="user-icon">
      <i class="fa fa-user fa-fw"></i>
      </div>
      <form method="post" action="/user/loginPost">
      <input type="text" class="username" id="email" name="email" placeholder="Enter your email"/>
      <div class="user-icon">
      <i class="fa fa-key fa-fw"></i>
      </div>
      <input type="password" id="password" name="password" class="password" placeholder="Enter your password"/>
      <button type="submit" class="btn btn-login" value="Login">Login</button>
      </form>
      <div class="forget">
        <p>
          Forget your password?
          <span><a href="#">sign up</a></span>
        </p>
      </div>
    </div>
    <div class="overlay">
      <div class="profile">
        <div class="overlay-color"></div>
      </div>
      <div class="profile-left">
        <h5>Date</h5>
        <span>May 10th, 2015</span>
      </div>
      <div class="profile-right">
        <h5>Team</h5>
        <span>Management</span>
      </div>
      <div class="tasks">
        <div class="task">
          <img src="http://www.freedigitalphotos.net/images/gallery-thumbnails.php?id=54012690482861871531622583" alt="" class="task-pic"/>
          <h3>Meeting!</h3>
          <span><i class="fa fa-clock-o"></i>9:00 AM</span>
        </div>
        <div class="task">
          <img src="http://www.freedigitalphotos.net/images/gallery-thumbnails.php?id=1309949958494783511039444" alt="" class="task-pic"/>
          <h3>More Meeting!</h3>
          <span><i class="fa fa-clock-o"></i>12:00 PM</span>
        </div>
        <div class="task">
          <img src="http://pixabay.com/static/uploads/photo/2015/04/20/13/41/person-731479_640.jpg" alt="" class="task-pic"/>
          <h3>Meeting Again!?</h3>
          <span><i class="fa fa-clock-o"></i>15:00 PM</span>
        </div>
      </div>
      <div class="footer">
        <div class="no">
          <h3>Thanks for login</h3>
        </div>
      <div class="bottom-button">
      </div>
      </div>
    </div>
  </div>
</div>
 
</body>
</html>