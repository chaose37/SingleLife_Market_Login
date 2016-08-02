<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../include/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Search Board</h3>
					<div class='box-body'>
		<select name = "searchType">
			<option value="n"
				<c:out value="${cri.searchType == null ? 'selected' : ''}" />> 
				---</option>
			<option value="t"
				<c:out value="${cri.searchType eq 't' ? 'selected' : ''}" />>Title</option>
				
			<option value="c"
				<c:out value="${cri.searchType eq 'c' ? 'selected' : ''}" />>Content</option>
			<option value="w"
				<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}" />>Writer</option>
			<option value="tc"
				<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}" />>Title OR Content</option>
			<option value="cw"
				<c:out value="${cri.searchType eq 'cw' ? 'selected' : ''}" />>Content OR Writer</option>
			<option value="tcw"
				<c:out value="${cri.searchType eq 'tcw' ? 'selected' : ''}" />>Title OR Content OR Writer</option>
		</select>
		<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
			<button id="searchBtn">search</button>
			<button id="newBtn">New Board</button>

<!-- 					<div class="box-tools"> -->
						<div class="input-group input-group-sm" style="width: 150px;">

<!-- 							<div class="input-group-btn"> -->
<!-- 								<button type="submit" class="btn btn-default"> -->
<!-- 									<i class="fa fa-search"></i> -->
<!-- 								</button> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>
				<div class="box-body table-responsive no-padding">
	<form id="jobForm">
		<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
		<input type='hidden' name='perPageNum' value=${pagemaker.cri.perPageNum}>
	</form>
					<table class="table table-hover">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>등록일</th>
							<th>수정날짜</th>
						</tr>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5">게시물이 없습니다.</td>
							</tr>
						</c:if>

						<c:forEach var="boardVO" items="${list}">
							<tr>
								<td><c:out value="${boardVO.bno}" /></td>
								<td><span class="label label-default">
						<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}'>${boardVO.title}</a></span></td>
								<td><span class="label label-primary">${boardVO.writer}</span></td>
								<td><span class="label label-success">${boardVO.viewcnt}</span></td>
								<td><span class="label label-warning"><fmt:formatDate value="${boardVO.regdate}" pattern="yyyy-MM-dd | hh:mm:ss" /></span></td>
								<td><span class="label label-warning"><fmt:formatDate value="${boardVO.updatedate}" pattern="yyyy-MM-dd | hh:mm:ss" /></span></td>
							</tr>
						</c:forEach>
					</table>
					<div class="pull-right hidden-xs">
						<button type="button" class="btn btn-lg btn-primary"
							onclick="location.href='${pageContext.request.contextPath}/sboard/register'">글쓰기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 	listPage 시작 -->
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a href="list${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page==idx ?'class=active':''}" />>
				<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
			</c:if>
		</ul> 
	</div>
	</div>
	</section>  
	
<script>
console.dir("${pageMaker}");
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("요청한 처리가 완료되었습니다");
	}
	
$(document).ready(function(){
	$('#searchBtn').on("click", function(event){
		self.location = "list"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword="+$('#keywordInput').val();
	});
	$('#newBtn').on("click", function(evt){
		self.location = "regist"; 
	});
});
	
// $(".pagination li a").on("click", function(event){
// 	event.preventDefault();
	
// 	var targetPage=$(this).attr("href");
	
// 	var jobForm = $("#jobForm");
// 	jobForm.find("[name='page']").val(targetPage);
// 	jobForm.attr("action", "/board/listPage").attr("method", "get");
// 	jobForm.submit();
// });
</script>
</body>

</html>
<%@ include file="../include/footer.jsp"%>