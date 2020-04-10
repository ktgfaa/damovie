    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
String session_id=(String)session.getAttribute("id");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/61cd314508.js" crossorigin="anonymous"></script>
<style type="text/css">

#header{
	width:1920px;
	height:250px;
	border-bottom: 3px black dotted;
}
#title_logo{
    margin-left: 829px;
    padding-top: 30px;
}
#info{
    width: 227px;
    margin-left: 1662px;
    margin-top: -15px;
}
#info h3{
	color: red;
	font-weight: 100;
}
#logout{
	width: 68px;
    margin-left: 1828px;
    margin-top: -233px;
}
#logout a:link { color: white; text-decoration: none;}
#logout a:visited { color: white; text-decoration: none;}
#logout a:hover { color: gray; text-decoration: none;}


</style>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<div id="header">
			<!-- 로고 -->
		<div id="title_logo">
			<a href="/damovie/customer/customer.do"><img src="/damovie/resources/images/damovilogo3.png" alt="Home" /></a>
		</div>
		
		<div id="info"><h3>서브관리자 페이지 입니다</h3></div>
		
			<!-- 로그아웃 버튼 -->
		<div id="logout" >
			<a class="logout" href="/damovie/member/logout.do"><h5>로그아웃</h5></a>
		</div>
	</div>
</body>
</html>