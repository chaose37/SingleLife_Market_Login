<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Market</title>
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
    <style>
	#searchDiv >*  
	{
		height: 30px;
		vertical-align: middle;
	}
    </style>
</head>

<body>
	<div id="fh5co-offcanvass">
	    <a href="#" class="fh5co-offcanvass-close js-fh5co-offcanvass-close">Menu<i class="icon-cross"></i> </a>
	    <h1 class="fh5co-logo"><a class="navbar-brand" href="list">Market</a></h1>
	    <ul>
	        <li class="active"><a href="list">Home</a></li>
	        <li><a href="http://localhost:9000/singleLife_web/src/index.html">SingleLife</a></li>
	        <c:if test="${empty login}"><li><a href="http://192.168.0.5:8000/user/login">login</a></li></c:if>
	        <c:if test="${not empty login}"><li><a href="http://192.168.0.5:8000/user/logout">logout</a></li></c:if>
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
</body>