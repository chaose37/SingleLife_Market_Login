<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 로그인 실패시 오류메시지 띄우기 -->
<script>
	$(function(){
		if ("${msg}"){
			$("#result").html("${msg}");
		}
	})
</script>
<!-- 아이디 저장 체크시 쿠키저장 -->
<script>
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
                <ul class="main_menu">
                    <li><a href ="${pageContext.request.contextPath}/board/list">Home</a></li>
                    <li><a href ="${pageContext.request.contextPath}/board/list">Menu</a></li>
                    <li><a href = "#" data-toggle="modal" data-target="#loginModal">Login</a></li>
					<li><a href = "${pageContext.request.contextPath}/board/createaccount">Join</a></li>
                </ul>
<!-- 	<form action="/user/loginPost" method="post"> -->
<!-- 		<div class="form-group has-feedback"> -->
<!-- 			<input type="text" name="id" class="form-control" placeholder="USER ID"/> -->
<!-- 			<span class="glyphicon glyphicon-envelope form-control-feedback"></span> -->
<!-- 		</div> -->
		
<!-- 		<div class="form-group has-feedback"> -->
<!-- 			<input type="password" name="pw" class="form-control" placeholder="Password"/> -->
<!-- 			<span class="glyphicon glyphicon-lock form-contol-feedback"></span> -->
<!-- 		</div> -->
		
<!-- 		<div class="row"> -->
<!-- 			<div class="col-xs-8"> -->
<!-- 				<div class="checkbox icheck"> -->
<!-- 				<label><input type="checkbox" name="userCookie">Remember Me</label> -->
<!-- 				</div> -->
<!-- 			</div>/.col -->
<!-- 			<div class="col-xs-4"> -->
<!-- 				<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button> -->
<!-- 			</div>/.col -->
<!-- 		</div> -->
<!-- 	</form> -->

<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">로그인</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content registerBox" >
                        <div class="form">
                            <form method="post" html="{:multipart=>true}" data-remote="true" action="/user/loginPost" accept-charset="UTF-8">
                                <input id="email" class="form-control" type="text" placeholder="Email" name="email">
                                <input id="password" class="form-control" type="password" placeholder="Password" name="password">
                                <input class="btn btn-default btn-register" type="submit" value="Login" name="commit">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="forgot login-footer">
                           
                </div>
                <div class="forgot register-footer" style="display:none">
                    <span>Already have an account?</span>
                    <a href="javascript: showLoginForm();">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!--modal 끝-->
 
</body>
</html>