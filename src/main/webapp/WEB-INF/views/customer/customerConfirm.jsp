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
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">

body {
	font-family: "Nanum Pen Script", cursive;
	font-size : 23px;
}

#main_Form{
    padding-top: 40px;
    padding-left: 320px;
}
#main_Form > .main_box {
    height: 580px;
    width: 971px;
    background: rgba(0,0,0,0.6);
    border-radius: 300px;
    margin-left: 154px;
    
}
.main_box p{
	font-size: 36px;
	font-family: "Nanum Pen Script", cursive;
	color: white;
}
.select_menu{
    position: absolute;
    top: 447px;
    left: 500px;
    width: 700px;
    height: 160px;
    display: flex;
    padding-top: 20px;
}
.select_menu div{
	width: 300px;
    cursor: pointer;
    height: 130px;
    padding-top: 20px;
}
.movie_box p{
    margin-left: 65px;
    width: 146px;
}
.theater_box{
	margin: 0px 105px 0 130px;
}
.theater_box p{
    width: 172px;
    margin-left: 26px;
}
.seat_box p{
	margin-left: 64px;
}
.seat_box .fas{
	margin-left:45px;
}
.select_menu .fas {
	margin-left:35px;  
 	} 
.fas:hover{
	 color: #FFFF99; 
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
 	$(function(){
		$(".movie_box").click(function(){
			location.href="#";
		});
		
		$(".theater_box").click(function(){
			location.href="#";
		});
		
		$(".seat_box").click(function(){
			location.href="#";
		});

	}); 
</script>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<div id="main_Form">
		<div class="main_box">
			<div class="select_menu">
				<div class="movie_box">
					<span style="color: white"  class="movie"><i class="fas fa-photo-video fa-6x" aria-hidden="true">&nbsp;</i></span>
					<p>영화 확인</p>
				</div>
			
				<div class="theater_box">
					<span style="color: white" class="theater" ><i class="fas fa-building fa-6x" aria-hidden="true">&nbsp;</i></span>
					<p>상영관 확인</p>
				</div>

				<div class="seat_box">
					<span style="color: white" class="seat" ><i class="fas fa-couch fa-6x" aria-hidden="true">&nbsp;</i></span>
					<p>좌석 확인</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>