<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<body>
<div id="fh5co-main">
    <div class="container">
        <div class="row">
            <div id="fh5co-board" data-columns>
				<c:forEach var="boardVO" items="${list}">
				<div class="item">
                    <div class="animate-box">
                        <a href="${pageContext.request.contextPath}/board/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}" class="fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?">
                            <img src="${pageContext.request.contextPath}/displayFile?fileName=${fn:substring(boardVO.files[0],0,12)}${fn:substring(boardVO.files[0],14,fn:length(boardVO.files[0]))}" onerror='this.src="/displayFile?fileName=/images.png"' style="width:250px; height: 200px;" />
                        </a>
                    </div>
                    <div class="fh5co-desc">${boardVO.title}</div>
                </div>
				</c:forEach>
            </div>
        </div>
    </div>
</div>
<div id="searchDiv" style="text-align: center; line-height: 0px;">
<select id="st" name="searchType" class="select2 req_place" data-select-search="true" placeholder="Option" style="text-align: center;">
	<option value="n" <c:out value="${cri.searchType == null ? 'selected' : ''}" />>---</option>
	<option value="t" <c:out value="${cri.searchType eq 't' ? 'selected' : ''}" />>Title</option>
	<option value="c" <c:out value="${cri.searchType eq 'c' ? 'selected' : ''}" />>Content</option>
	<option value="w" <c:out value="${cri.searchType eq 'w' ? 'selected' : ''}" />>Writer</option>
	<option value="tc" <c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}" />>Title OR Content</option>
	<option value="cw" <c:out value="${cri.searchType eq 'cw' ? 'selected' : ''}" />>Content OR Writer</option>
	<option value="tcw" <c:out value="${cri.searchType eq 'tcw' ? 'selected' : ''}" />>Title OR Content OR Writer</option>
</select>
<input type="text" class="input-small" style="height: 28px; width: 215px; margin-left: 0px;" name="keyword" id="keywordInput" value="${cri.keyword}">
<button type="button" id="searchBtn" class="btn-primary btn-sm">search</button>
<button type="button" id="registBtn" style="margin-left:5px;" class="btn-success btn-sm">regist</button>
</div>
<div class="input-group input-group-sm" style="width: 150px;"></div>
<!-- listPage 시작 -->
<div class="text-center">
	<ul class="pagination pagination-sm">
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
<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script src="${pageContext.request.contextPath}/resources/res/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/salvattore.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/main.js"></script>
<script>
	var result = '${msg}';
	if(result == 'success'){
		alert("요청한 처리가 완료되었긔");
	}
	$(document).ready(function(){
		$("#searchBtn").on("click", function(event){
			self.location = 'list' 
								+ '${pageMaker.makeQuery(1)}' 
								+ '&searchType=' 
								+ $("select option:selected").val() 
								+ "&keyword=" 
								+ $("#keywordInput").val(); 
		});
		
		$("#registBtn").on("click", function(evt){
			self.location = "register";
		});
	})
</script>
</body>
</html>