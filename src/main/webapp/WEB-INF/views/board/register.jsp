<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
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
								<textarea name="content" class="form-control" rows="10" placeholder="Enter"></textarea>
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
			swal("Good job!", "You clicked the button!", "success");
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
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>