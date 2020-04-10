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
<link href="${contextPath }/resources/css/admin/admin_header.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/61cd314508.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<div id="header">
			<!-- 로고 -->
		<div id="title_logo">
			<a href="/damovie/admin.do"><img src="/damovie/resources/images/damovilogo3.png" alt="Home" /></a>
		</div>
		
		<div id="info"><h3>관리자 페이지 입니다</h3></div>
		
			<!-- 로그아웃 버튼 -->
		<div id="logout" >
			<a class="logout" href="/damovie/member/logout.do"><h5>로그아웃</h5></a>
		</div>
	</div>
</body>
</html>