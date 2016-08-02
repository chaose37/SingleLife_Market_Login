<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello SINGLE!  
</h1>

<h2>${result}</h2>
<P> Single Life </P>
<%-- <p><a href="${pageContext.request.contextPath}/user/join">회원가입 </a></p> --%>
	<script type="text/javascript">
	
// 		parent.moveMain();
	self.location="/board/list";
	</script>
</body>
</html>