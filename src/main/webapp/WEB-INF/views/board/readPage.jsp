<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Hydrogen &mdash; A free HTML5 Template by FREEHTML5.CO</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/res/favicon.ico">
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/animate.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/icomoon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/salvattore.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/style.css">
	<script src="${pageContext.request.contextPath}/resources/res/js/modernizr-2.6.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/res/js/respond.min.js"></script>
<style>
.fileDrop {
  width: 80%;
  height: 300px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
.popup{
	position: absolute;
}
.back{
	background-color: gray;
	opacity : 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}
.front{
	z-index: 1110;
	opacity : 1;
	border : 1px;
	margin :auto;
}
.show{
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
</style>
</head>
<body>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<form role="form" method="post">
		<input type='hidden' name='bno' value="${boardVO.bno }">
		<input type='hidden' name='page' value="${cri.page }">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
		<input type='hidden' name='searchType' value="${cri.searchType }">
		<input type='hidden' name='keyword' value="${cri.keyword }">
	</form>

	<div class="box-body">
<!-- 		<div class="form-group"> -->
<!-- 				<label for="exampleInputEmail1">Detail Image</label> -->
<!-- 				<div class="fileDrop"></div> -->
<!-- 		</div> -->
		<div class="form-group">
			<label for="exampleInputEmail1">조회수</label> 
			<input type="text" name="viewCnt" class="form-control" value="${boardVO.viewcnt}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> 
			<input type="text" name="title" class="form-control" value="${boardVO.title}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">글쓴이</label> 
			<input type="text" name="writer" class="form-control" value="${boardVO.writer}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">내용</label>
			<textarea class="form-control" rows="3" readonly="readonly">${boardVO.content}</textarea>
		</div>
	</div>
			
	<div class = "popup back" style = "display:none;"></div>
	<div id = "popup_front" class = "popup front" style = "display:none;">
		<img id = "popup_img" />
	</div>
	
	
	<div class = "box-footer">
		<div>
				<hr>
		</div>
		<ul class="mailbox-attachments clearfix uploadedList"></ul>
		<c:if test="${login.email == boardVO.writer}">
		<button class = "btn btn-warning" id="modBoard" type = "submit">modify</button>
		<button class = "btn btn-danger" id="delBoard" type = "submit">delete</button>
		</c:if>
		<button class = "btn btn-primary" id="listBoard" type = "submit">list</button>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class ="box-title">댓글 추가</h3>
				</div>
				<c:if test="${not empty login}">
					<div class="box-body">
						<label for="exampleInputEmail1">글쓴이</label>
						<input class="form-control" type="text" value="${login.email}" readonly="readonly" placeholder="아이디" id="newReplyWriter">
						<label for="exampleInputEmail1">댓글내용</label>
						<input class="form-control" type="text" placeholder="내용" id="newReplyText">
					</div>
					<!-- box 바디 -->
					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="replyAddBtn">댓글등록</button>
					</div>
				</c:if>
				
				<c:if test="${empty login}">
					<div class="box-body">
					<div><a href="javascript:goLogin();">Login Please</a></div>
					</div>
				</c:if>	
				
			</div>
		</div>
	</div>
	<!-- 댓글 목록 -->
	<ul class="timeline">
		<li class="time-label" id="repliesDiv"><span class="bg-green">댓글 목록<small id='replycntSmall'>${boardVO.replycnt }</small></span></li>
	</ul>
	
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin">
		</ul>
	</div>
	<!-- modal 추가 -->
	<div id = "modifyModal" class = "modal modal-primary fade" role = "dialog">
		<div class = "modal-dialog">
			<div class = "modal-content">
				<div class = "modal-header">
					<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					<h4 class = "modal-title" ></h4>
				</div>
				<div class = "modal-body" data-rno>
					<p>
						<input type = "text" id = "replytext" class = "form-control" />
					</p>
				</div>
				<div class = "modal-footer">
					<button type = "button" class = "btn btn-info" id = "replyModBtn">수정</button>
					<button type = "button" class = "btn btn-danger" id = "replyDelBtn">삭제</button>
					<button type = "button" class = "btn btn-default" data-dismiss = "modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		$(document).ready(function(){
			
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$("#modBoard").on("click", function(){
				formObj.attr("action", "/board/modifyPage");
				formObj.attr("method", "get");
				formObj.submit();
			});
			
			$("#delBoard").on("click", function(){
				var replycnt = $('#replycntSmall').html();
				
				alert(replycnt);
				
				if(replycnt>0){
					alert("댓글이 달린 게시물을 삭제 할 수 없습니다.");
					return;
				}
				
				var arr = [];
				$(".uploadedList li").each(function(index){
					arr.push($(this).attr("data-src"));
				});
				if(arr.length>0){
					$.post("/deleteAllFiles",{files:arr},function(){
						
					});
				}
				formObj.attr("action", "/board/removePage");
				formObj.submit();
			});			
			
			$("#listBoard").on("click", function(){
				formObj.attr("method","get");
				formObj.attr("action","/board/list");
				formObj.submit();
			});
			
		});
	</script>
	<script type="text/javascript" src="/resources/js/upload.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="template" type="text/x-handlebars-template">
		{{#each .}}
		<li class="replyLi" data-rno={{rno}}>
				<i class="fa fa-comments bg-blue"></i>
				<div class="timeline-item">
					<span class="time">
						<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
					</span>
					<h3 class="timeline-header"><strong>{{rno}}</strong>-{{replyer}}</h3>
					<div class="timeline-body">{{replytext}}</div>
					<div class="timeline-footer">
					{{#eqReplyer replyer}}
					<a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">수정</a>
					{{/eqReplyer}}
					</div>
				</div>
		</li>
		{{/each}}
	</script>
	
	<script id="templateAttach" type="text/x-handlebars-template">
	<li data-src = '{{fullName}}'>
		<span class = "mailbox-attachment-icon has-img"><img src = "{{imgsrc}}" alt = "Attachment"></span> 
		<div class = "mailbox-attachment-info">
		<a href = "{{getLink}}" class = "mailbox-attachment-name">{{fileName}}</a>
		</span>
		</div>
	</li>
	</script>
		
	<script>
		Handlebars.registerHelper("eqReplyer", function(replyer, block){
			var accum='';
			if(replyer == '${login.email}'){
				accum += block.fn();
			}
			return accum;
		});
		
		Handlebars.registerHelper("prettifyDate", function(timeValue){
			var dateObj = new Date(timeValue);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth();
			var date = dateObj.getDate();
			
			return year + "/"+month+"/"+date;
		});
		
		var printData = function(replyArr, target, templateObject){
			var template = Handlebars.compile(templateObject.html());
			var html = template(replyArr);
			$(".replyLi").remove();
			target.after(html);
		}
		var bno = ${boardVO.bno};
		var replyPage = 1;
		
// 		function getPage(pageInfo){
			
// 			$.getJSON(pageInfo,function(data){

// 				printData(data.list,$("#repliesDiv"),$('#template'));
// 				printPaging(data.pageMaker,$(".pagination"));
// 			});
// 		}
		
		var printPaging = function(pageMaker,target){
			var str = "";
			if(pageMaker.prev){
				str += "<li><a href='"+(pageMaker.startPage-1)+"'><<</a></li>";
				
			}
			for(var i = pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
				var strClass= pageMaker.cri.page == i ? 'class=active' : '';
				str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
			}
			if(pageMaker.next){
				str += "<li><a href='"+(pageMaker.endPage+1)+"'>>></a></li>";
			}
			target.html(str);			
		};
		
		$("#repliesDiv").on("click",function(){
			if($(".timeline li").size()>1)
			{
				return;
			}
			getPage("/replies/" + bno + "/1");
		});
		
		$(".pagination").on("click", "li a",function(event){
			event.preventDefault();
			replyPage = $(this).attr("href");
			getPage("/replies/"+bno+"/"+replyPage);
		});
		
		$("#replyAddBtn").on("click",function(){
			var replyerObj = $("#newReplyWriter");
			var replytextObj = $("#newReplyText");
			var replyer = replyerObj.val();
			var replytext = replytextObj.val();
			
			$.ajax({
				type:'POST',
				url:'/replies/',
				headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"POST"},
				dataType:'text',
				data:JSON.stringify({bno:bno , replyer:replyer , replytext:replytext }),
				success:function(result){
					console.log("result :" + result);
					if(result == 'SUCCESS'){
						alert("등록 되었습니다.");
						replyPage =1;
						getPage("/replies/"+bno+"/"+replyPage);
						replytextObj.val("");
						}
				}});
		});
		
		$(".timeline").on("click",".replyLi", function(event){
			var reply = $(this);
			$("#replytext").val(reply.find('.timeline-body').text());
			$(".modal-title").html(reply.attr("data-rno"));
		});
		
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type:'PUT',
				url:'/replies/'+rno,
				headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"PUT"},
				dataType:'text',
				data:JSON.stringify({replytext:replytext}),
				success:function(result){
					console.log("result :" + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage);
						}
				}});
		});
		
		$("#replyDelBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type:'DELETE',
				url:'/replies/'+rno,
				headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"DELETE"},
				dataType:'text',
				success:function(result){
					console.log("result :" + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/replies/"+bno+"/"+replyPage);
						}
				}});
		});
		
		//  파일 조회
		var bno = ${boardVO.bno};
		var template = Handlebars.compile($("#templateAttach").html());
		
		$.getJSON("/board/getAttach/"+bno, function(list){
			$(list).each(function(){
				var fileInfo = getFileInfo(this);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
				
			});
		});

		
		$(".uploadedList").on("click", ".mailbox-attachment-info a",  function(event){
			var fileLink = $(this).attr("href");

			if(checkImageType(fileLink)){
				
				event.preventDefault();
				
				var imgTag = $("#popup_img");
				imgTag.attr("src", fileLink);
				
				console.log(imgTag.attr("src"));
				
				$(".popup").show('slow');
				imgTag.addClass("show");
			}
		});
		
		$("#popup_img").on("click", function(){
			$(".popup").hide('slow');
		});
		
		
		// ajax 댓글 수 갱신
		function getPage(pageInfo){
			$.getJSON(pageInfo, function(data){
				printData(data.list, $("#repliesDiv"), $("#template"));
				printPaging(data.pageMaker, $(".pagination"));
				$("#modifyModal").modal("hide");
				$("#replycntSmall").html("[ " +data.pageMaker.totalCount+"]");
			});
		}
		
		$("#removeBtn").on("click", function(){
			var replycnt = $("replycntSmall").html();
			
			
			if(replyCnt > 0){
				alert("댓글이 달린 게시물을 삭제할 수 없습니다.")
				return;
			}
			
			var arr = [];
			$("uploadedList li").each(function(index){
				arr.push($(this).attr("data-src"));
			});
			
			if(arr.length > 0){
				$.post("/deleteAllFiles", {files:arr}, function(){
				});
			}
			
			formObj.attr("action", "/board/removePage");
			formObj.submit();
		});
	</script>
	
</body>
</html>
<%@ include file="../include/footer.jsp"%>