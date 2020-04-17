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
<link href="${contextPath }/resources/css/member/checkMyBook.css?ver=1" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".button").hover(function(){
		$(this).css("background-color","rgba(54,45,68,0.7)");
	},function(){
		$(this).css("background","none");
	});
});
$(function() {
	$("#mypage").click(function(){
		location.href="/damovie/mypage.do";
	});
	
	$('form').submit(function(){
		var check_submit=confirm('정말 취소하시겠습니까?');

		return check_submit;
	});
});

</script>
<meta charset="UTF-8">
<title>예매확인</title>
</head>
<body>
<div id="main_Form">
	<div class="main_box">
		<form id="input" name="input" method="post" action="${contextPath }/member/cancelMyBook.do">
			<div class="input_box">
				<div class="top_box">
					<p><span>${member.name }</span>님 예매내역</p>
				</div>
					
				<div class="middle_box">
					<div class="left_box">
						<ul>
							<li>${order.company}  ${order.theater_name}</li>
							<li>${order.movie_name}</li>
							<li>${order.time} ~ ${endTime }</li>
							<li>${order.theater_num}관 ${rowCol}</li>
						</ul>
					</div>
				
					<div class="right_box">
						<p>안녕하세요 DaMovie입니다<br>
						각 제휴사와의 원활한 예매를 위해<br>
						상영시간 20분 전까지 취소가 가능하며<br>
						상영시작 후 취소는 불가합니다.<br><br>
						저희 DaMovie 예매사이트를 통해<br>
						즐거운 영화관람 하시길 바랍니다.<br>
						</p>
						<div class="btn_box">
							<input type="submit" value="예매취소" class="button" id="cancel">
							<input type="button" value="마이페이지" class="button" id="mypage">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>
