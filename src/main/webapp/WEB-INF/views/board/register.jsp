<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Hydrogen &mdash; A free HTML5 Template by FREEHTML5.CO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
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
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
</head>
<body>
	<div id="fh5co-offcanvass">
		<a href="#" class="fh5co-offcanvass-close js-fh5co-offcanvass-close">Menu
			<i class="icon-cross"></i>
		</a>
		<h1 class="fh5co-logo">
			<a class="navbar-brand" href="index.html">Hydrogen</a>
		</h1>
		<ul>
			<li><a href="index.html">Home</a></li>
			<li><a href="about.html">About</a></li>
			<li><a href="pricing.html">Pricing</a></li>
			<li class="active"><a href="contact.html">Contact</a></li>
		</ul>
		<h3 class="fh5co-lead">Connect with us</h3>
		<p class="fh5co-social-icons">
			<a href="#"><i class="icon-twitter"></i></a> <a href="#"><i
				class="icon-facebook"></i></a> <a href="#"><i class="icon-instagram"></i></a>
			<a href="#"><i class="icon-dribbble"></i></a> <a href="#"><i
				class="icon-youtube"></i></a>
		</p>
	</div>
	<header id="fh5co-header" role="banner">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<a href="#" class="fh5co-menu-btn js-fh5co-menu-btn">Menu <i
					class="icon-menu"></i></a> <a class="navbar-brand" href="index.html">Hydrogen</a>
			</div>
		</div>
	</div>
	</header>

	<div id="fh5co-main">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<h2>Register</h2>
					<div class="fh5co-spacer fh5co-spacer-sm"></div>
					<form role="form" method="post" id="registerForm">
						<div class="box-body">
							<div class="form-group">
								<label for="exampleInputEmail1">Detail Image</label>
								<div class="fileDrop"></div>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Title</label> 
								<input type="text" name="title" class="form-control" placeholder="Enter Title">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Content</label>
								<textarea name="content" class="form-control" row="3" placeholder="Enter"></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Writer</label> 
								<input type="text" name="writer" class="form-control" value='${login.email}' readonly placeholder="Enter Writer">
							</div>
							<!-- box body 끝 -->
							<div class="box-footer">
								<div>
									<hr />
								</div>
								<ul class="mailbox-attachments clearfix uploadedList"></ul>
								<input type="submit" class="btn btn-primary" value="Submit">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script id="template" type="text/x-handlebars-template">
		<li>
			<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
			<div class="mailbox-attachment-info">
				<a href = "{{getLink}}" class = "mailbox-attachment-name">{{fileName}}</a>
				<a href = "{{fullName}}" id ="fileDel" class = "btn btn-default btn-xs pull-right delbtn"><i class = "glyphicon glyphicon-remove"></i></a>
			</div>
		</li>
	</script>
	<script src="${pageContext.request.contextPath}/resources/res/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/res/js/jquery.easing.1.3.js"></script>
	<script src="${pageContext.request.contextPath}/resources/res/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/res/js/jquery.waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/res/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/res/js/salvattore.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/res/js/main.js"></script>
	<script>
		var template = Handlebars.compile($("#template").html());

		$(".fileDrop").on("dragenter dragover", function(event) {
			event.preventDefault();
		});

		$(".fileDrop").on("drop", function(event) {
			event.preventDefault();
			console.dir(event)
			var files = event.originalEvent.dataTransfer.files;

			var file = files[0];
			console.dir(files)
			var formData = new FormData();

			formData.append("file", file);
			
			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					$(".uploadedList").append(html);
				}
			});
		});
		$(".uploadedList").on("click", "#fileDel", function (e){
			e.preventDefault();
			var that = $(this);
			alert($(this).attr("href"));
			console.dir(that);
						
			$.ajax({
				url : "/deleteFile",
				type : "POST",
				data : {fileName : $(this).attr("href")},
				dataType : 'text',
				success : function (result) {
					console.dir(result);
					if(result == 'deleted'){
						alert("delete success");
						that.parent("div").parent("li").remove();
					}
				},
				fail : function() {
					alert("fail");
				}
			});
		});
	</script>
	<script>
		$("#registerForm").submit(function(event) {
			event.preventDefault();
			var that = $(this);
			var str = "";
			$(".uploadedList .delbtn").each(function(index) {
				str = "<input type='hidden' name='files["
						+ index + "]' value='"
						+ $(this).attr("href") + "'>";
				that.append(str);

				that.get(0).submit();
			});
		});
	</script>
</body>
</html>