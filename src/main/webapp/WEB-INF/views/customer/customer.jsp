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
    left: 667px;
    width: 700px;
    height: 160px;
    display: flex;
}
.select_menu div{
	width: 300px;
    cursor: pointer;
    height: 130px;
    padding-top: 20px;
}
.movie_box p{
    margin-left: 24px;
    width: 146px;
}
.theater_box{
	margin: 0px 105px 0 130px;
}
.theater_box p{
    width: 172px;
    margin-left: -6px;
}
.seat_box p{
	margin-left: 26px;
}
.seat_box .fas{
	margin-left:45px;
}
.select_menu .fas {
	margin-left:35px;  
 	} 

.movie > img {
	width : 200px;
	height: 200px;
}

.theater > img {
	width : 200px;
	height : 200px;
}

.movie > img {
	background-image: url('/damovie/resources/images/customer_icon/wrench1.png');
	background-size: cover;
}

.theater > img {
	background-image: url('/damovie/resources/images/customer_icon/save.png');
	background-size: cover;
}

.movie > img:hover {
	background-image: url('/damovie/resources/images/customer_icon/wrench2.png');
	background-size: cover;
}

.theater > img:hover {
	background-image: url('/damovie/resources/images/customer_icon/save2.png');
	background-size: cover;
}


</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
 	$(function(){
		$(".movie_box").click(function(){
			location.href="${contextPath}/customer/customerConfirm.do";
		});
		
		$(".theater_box").click(function(){
			location.href="${contextPath}/customer/customerUpdate.do";
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
					<span style="color: white"  class="movie">
						<img />
					</span>
					<p>관리 페이지</p>
				</div>
			
				<div class="theater_box">
					<span style="color: white" class="theater" >
						<img />
					</span>
					<p>업데이트 페이지</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
    
