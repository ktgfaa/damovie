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
<link href="${contextPath }/resources/css/admin/admin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/61cd314508.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
 	$(function(){
		$(".memberList_box").click(function(){
			location.href="admin/memberManagement.do";
		});
		
		$(".review_box").click(function(){
			location.href="#";
		});

	}); 
</script>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<div id="main_box">
		<div class="select_menu">
				<div class="memberList_box">
					<span style="color: black"  class="member_book"><i class="fas fa-address-book fa-7x" aria-hidden="true">&nbsp;</i></span>
					<p>회원정보 관리</p>
				</div>
			
				<div class="review_box">
					<span style="color: black" class="member_info" ><i class="fas fa-pencil-alt fa-7x" aria-hidden="true">&nbsp;</i></span>
					<p>리뷰 관리</p>
				</div>
			</div>	
		<div class="logo">
			<div class="logo_c"><a href="http://www.cgv.co.kr/"><img src="http://img.cgv.co.kr/R2014/images/title/h1_cgv.png" width="120px;"></a></div>
			<div class="logo_m"><a href="https://megabox.co.kr/"><img src="https://img.megabox.co.kr/static/pc/images/common/ci/logo.png" width="140px;"></a></div>
			<div><a href="https://www.lottecinema.co.kr/"><img src="/damovie/resources/images/lotte_logo.png" width="200px;" height="70px;"></a></div>
		</div>
	</div>
</body>
</html>