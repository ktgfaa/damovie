<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath }/resources/css/member/mypage.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/61cd314508.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
 	$(function(){
		$(".book_box").click(function(){
			location.href="member/checkMyBook.do";
		});
		
		$(".info_box").click(function(){
			location.href="member/memberUpdateView.do";
		});

		$(".unsubscribe_box").click(function(){
			location.href="member/memberDeleteForm.do";
		});
		
	}); 
</script>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<div id="main_Form">
		<div class="main_box">
			<div class="member_profile">
				<p><span>${member.name }</span>님 환영합니다!</p>
			</div>
	
			<div class="select_menu">
				<div class="book_box">
					<span style="color: white"  class="member_book"><i class="fas fa-tablet-alt fa-5x" aria-hidden="true">&nbsp;</i></span>
					<p>예매확인</p>
				</div>
			
				<div class="info_box">
					<span style="color: white" class="member_info" ><i class="fas fa-user-lock fa-5x" aria-hidden="true">&nbsp;</i></span>
					<p>회원정보 수정</p>
				</div>

				<div class="unsubscribe_box">
					<span style="color: white" class="unsubscribe" ><i class="fas fa-user-times fa-5x" aria-hidden="true">&nbsp;</i></span>
					<p>회원탈퇴</p>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>