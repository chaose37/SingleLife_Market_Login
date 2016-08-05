<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Hydrogen &mdash; A free HTML5 Template by FREEHTML5.CO</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FREEHTML5.CO"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>
    <meta name="author" content="FREEHTML5.CO"/>
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <link rel="shortcut icon" href="favicon.ico">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/salvattore.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/res/css/style.css">
    <script src="${pageContext.request.contextPath}/resources/res/js/modernizr-2.6.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/res/js/respond.min.js"></script>
</head>
<body>
<div id="fh5co-offcanvass">
    <a href="#" class="fh5co-offcanvass-close js-fh5co-offcanvass-close">Menu <i class="icon-cross"></i> </a>
    <h1 class="fh5co-logo"><a class="navbar-brand" href="list">Market</a></h1>
    <ul>
        <li class="active"><a href="list">Home</a></li>
        <li><a href="register">Regist</a></li>
        <li><a href="pricing.html">Pricing</a></li>
        <li><a href="contact.html">Contact</a></li>
    </ul>
    <h3 class="fh5co-lead">Connect with us</h3>
    <p class="fh5co-social-icons">
        <a href="#"><i class="icon-twitter"></i></a>
        <a href="#"><i class="icon-facebook"></i></a>
        <a href="#"><i class="icon-instagram"></i></a>
        <a href="#"><i class="icon-dribbble"></i></a>
        <a href="#"><i class="icon-youtube"></i></a>
    </p>
</div>
<header id="fh5co-header" role="banner">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <a href="#" class="fh5co-menu-btn js-fh5co-menu-btn">Menu<i class="icon-menu"></i></a>
                <a class="navbar-brand" href="list">Market</a>
            </div>
        </div>
    </div>
</header>
<!-- END .header -->
<div id="fh5co-main">
    <div class="container">
        <div class="row">
            <div id="fh5co-board" data-columns>
				<c:forEach var="boardVO" items="${list}">
				<div class="item">
                    <div class="animate-box">
                        <a href="${pageContext.request.contextPath}/board/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}" class="fh5co-board-img" title="Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo, eos?">
                            <img src="${pageContext.request.contextPath}/displayFile?fileName=${boardVO.files[0]}" onerror='this.src="/displayFile?fileName=/sl_logo2.gif"' />
                        </a>
                    </div>
                    <div class="fh5co-desc">${boardVO.content}</div>
                </div>
				</c:forEach>
            </div>
        </div>
    </div>
</div>
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
<button type="button" id="searchBtn" class="btn btn-primary btn-sm">search</button>
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

<footer id="fh5co-footer">
    <div class="container">
        <div class="row row-padded">
            <div class="col-md-12 text-center">
                <p class="fh5co-social-icons">
                    <a href="#"><i class="icon-twitter"></i></a>
                    <a href="#"><i class="icon-facebook"></i></a>
                    <a href="#"><i class="icon-instagram"></i></a>
                    <a href="#"><i class="icon-dribbble"></i></a>
                    <a href="#"><i class="icon-youtube"></i></a>
                </p>
                <p>
                    <small>&copy; Hydrogen Free HTML5 Template. All Rights Reserved. <br>Designed by:
                        <a href="http://freehtml5.co/" target="_blank">FREEHTML5.co</a> | Images by:
                        <a href="http://pexels.com" target="_blank">Pexels</a></small>
                </p>
            </div>
        </div>
    </div>
</footer>
<script src="${pageContext.request.contextPath}/resources/res/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/salvattore.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/res/js/main.js"></script>
</body>
</html>