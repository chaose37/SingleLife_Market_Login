<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<hr>
		</div>
		
		<ul class="mailbox-attachments clearfix uploadedList"></ul>
		<button type="submit" class="btn btn-primary">Submit</button>
		</div>
		<script type="text/javascript" src="/resources/js/upload.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
		<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script> 
		
		<script>
		
// 			var template = Handlebars.compile($("template").html());
			
// 			$(".fileDrop").on("dragenter dragover", function(event){
// 				event.preventDefault();
// 			});
			
// 			$(".fileDrop").on("drop", function(event){
// 				event.preventDefault();
				
// 				var files = event.originalEvent.dataTransfer.files;
				
// 				var file = files[0];
				
// 				var formData = new FormData();
				
// 				formData.append("file", file);
				
// 				$.ajax({
// 					url: '/uploadAjax',
// 					data: formData,
// 					dataType: 'text',
// 					processData: false,
// 					contentType: false,
// 					type: 'POST',
// 					success: function(data){
// 						var fileInfo = getFileInfo(data);
						
// 						var html = template(fileInfo);
						
// 						$(".uploadedList").append(html);
// 					}
// 				});
// 			});
var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];
	var formData = new FormData();
	
	formData.append("file", file);	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});

		
		</script>
		
		<script>
		$("#registerForm").submit(function(event){
			event.preventDefault();
			var that = $(this);
			
			var str = "";
			
			
			$(".uploadedList .delbtn").each(function(index){
				str = "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href")+"'>";
				that.append(str);
			
				that.get(0).submit();
			});
		});
		</script>
		
	</form>
</body>
</html> 
<%@ include file="../include/footer.jsp"%>