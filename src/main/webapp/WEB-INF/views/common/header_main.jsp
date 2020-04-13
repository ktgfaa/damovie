
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String session_id = (String) session.getAttribute("id");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.top {
	position: relative;
	width: 100%;
	height: 300px;
	top: 0;
	left: 0;
	z-index: 100;
}

li {
	list-style: none;
}

/* 메뉴화면 */
.mainForm {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	left: 0;
	background-color: black;
	opacity: 0.95;
	visibility: hidden;
	box-shadow: 0px 2px 4px 4px #000000;
	z-index: 100;
}
/* menuForm 전체화면 내부 설정 */
.menu_toggle {
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.menu_num { /* 메뉴 숫자 */
	display: block;
	font-size: 40px;
	font-weight: 200;
	text-align: center;
	padding: 85px 0 0 0;
	font-style: italic;
	text-decoration: none;
	color: white;
	font-family: "Nanum Pen Script", cursive;
}

.menu_toggle li a { /* 글씨 */
	display: block;
	font-size: 60px;
	font-weight: 200;
	text-align: center;
	margin-top: -10px;
	font-style: italic;
	text-decoration: none;
	color: white;
	font-family: "Nanum Pen Script", cursive;
}

.menu_toggle li:nth-child(4), li:nth-child(6) {
	margin-right: 15px;
}

.menu_toggle li a:link {
	text-decoration: none;
	color: white;
}

.menu_toggle li a:visited {
	text-decoration: none;
	color: white;
}

.menu_toggle li a:hover {
	text-decoration: none;
	color: light gray;
}

.menu_toggle li a:active {
	text-decoration: none;
	color: yellow;
}

/* 햄버거 버튼  */
#wrapper {
	position: absolute;
}

#line-wrapper {
	cursor: pointer;
	width: 40px;
	height: 40px;
	position: absolute;
	top: -255px;
	left: 20px;
	z-index: 101;
}

.init {
	animation: none !important;
}

.line {
	background: #ffffff;
	margin-top: 10px;
	margin-bottom: 0;
	width: 40px;
	height: 3px;
	border-radius: 2px;
	box-shadow: 0 1px 3px rgba(0, 0, 0, .5);
	position: relative;
	z-index: 103;
	background-color: white;
}

.line-top {
	animation: line-top .5s forwards ease-out, line-top-rotate .3s .5s
		forwards ease-out;
}

.top-reverse {
	animation: line-top-rotate-reverse .3s forwards ease-out,
		line-top-reverse .5s .3s forwards ease-out;
}

.line-mid {
	animation: line-mid .5s forwards ease-out;
}

.mid-reverse {
	animation: line-mid-invisible .3s forwards ease-out, line-mid-reverse
		.5s .3s forwards ease-out;
}

.line-bot {
	animation: line-bot .5s forwards ease-out, line-bot-rotate .3s .5s
		forwards ease-out;
}

.bot-reverse {
	animation: line-bot-rotate-reverse .3s forwards ease-out,
		line-bot-reverse .5s .3s forwards ease-out;
}

@
keyframes line-top { 0% {
	transform: translateY(0px)
}

100%
{
transform
:translateY(13px)
}
}
@
keyframes line-top-reverse { 0% {
	transform: translateY(13px)
}

100%
{
transform
:translateY(0px)
}
}
@
keyframes line-top-rotate { 0% {
	transform: translateY(13px) rotateZ(0deg)
}

100%
{
transform
:translateY(13px)
 
rotateZ
(45deg)
}
}
@
keyframes line-top-rotate-reverse { 0% {
	transform: translateY(13px) rotateZ(45deg)
}

100%
{
transform
:translateY(13px)
 
rotateZ
(0deg)
}
}
@
keyframes line-mid { 0% {
	transform: scale(1)
}

100%
{
transform
:scale(0)
}
}
@
keyframes line-mid-reverse { 0% {
	transform: scale(0)
}

100%
{
transform
:scale(1)
}
}
@
keyframes line-mid-invisible { 0% {
	transform: scale(0)
}

100%
{
transform
:scale(0)
}
}
@
keyframes line-bot { 0% {
	transform: translateY(0px)
}

100%
{
transform
:translateY(-13px)
}
}
@
keyframes line-bot-reverse { 0% {
	transform: translateY(-13px)
}

100%
{
transform
:translateY(0px)
}
}
@
keyframes line-bot-rotate { 0% {
	transform: translateY(-13px) rotateZ(0deg)
}

100%
{
transform
:translateY(-13px)
 
rotateZ
(135deg)
}
}
@
keyframes line-bot-rotate-reverse { 0% {
	transform: translateY(-13px) rotateZ(135deg)
}

100%
{
transform
:translateY(-13px)
 
rotateZ
(0deg)
}
}

/* 로고 */
.title_logo {
	position: absolute;
	left: 43%;
	top: 15%;
}

/* 하단 footer */
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 100px;
	font-size: 12px;
	font-style: italic;
	color: #FFF;
	text-align: center;
	opacity: 0.9;
}

.footer a span {
	margin-left: 24px;
}

/* 우측 아이콘  */
.fa {
	vertical-align: middle;
}

.after_login {
	width: 40px;
	position: absolute;
	top: 38px;
	right: 5px;
}

.after_login i {
	z-index: 100;
	margin-top: 10px;
}

.before_login {
	z-index: 99;
	width: 40px;
	position: absolute;
	top: 15px;
	right: 25px; /*########################### 구현 후 after하고 위치 똑같이 맞추기 */
}

.after_login i {
	margin-top: 10px;
}

.before_login i {
	margin-top: 10px;
}
</style>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#line-wrapper").click(function() {
			/*  if($( '.mainForm').is("visible")==false){
				$( '.mainForm' ).fadeIn(1000);
			} 
			 if($( '.mainForm').is("visible")==true){
				$( '.mainForm' ).fadeOut(1000);
			 } */
			if ($('.mainForm').css('visibility') == "hidden") {
				$('.mainForm').css('visibility', 'visible');
			} else {
				$('.mainForm').css('visibility', 'hidden');
			}
		});
		$('#line-wrapper').click(function() {
			$('.line').removeClass('init');
			$('#line-top').toggleClass('line-top').toggleClass('top-reverse');
			$('#line-mid').toggleClass('line-mid').toggleClass('mid-reverse');
			$('#line-bot').toggleClass('line-bot').toggleClass('bot-reverse');
		});
	});
</script>
<meta charset="UTF-8">
<title>사이드 메뉴</title>
</head>
<body>


	<div class="top">
		<!-- 로고 -->
		<div class="title_logo">
			<a href="/damovie/main.do"> <img
				src="/damovie/resources/images/damovilogo3.png" alt="Home" />
			</a>
		</div>



		<c:if test="${isLogon eq 'false' || isLogon == null }">
			<div class=after_login>
				<!-- 로그인하기 버튼 -->
				<a class="login" href="/damovie/member/loginForm.do"><span
					style="color: white"><i class="fa fa-check-circle fa-2x"
						aria-hidden="true">&nbsp;</i></span></a>
				<!-- 회원가입 버튼 -->
				<a class="join" href="/damovie/member/memberForm.do"><span
					style="color: white"><i class="fa fa-user-circle fa-2x"
						aria-hidden="true">&nbsp;</i></span></a>
				<!-- 고객센터 버튼 -->
				<a class="question" href="/damovie/servicecenter.do"><span
					style="color: white"><i class="fa fa-question fa-2x"
						aria-hidden="true">&nbsp;</i></span></a>
			</div>
		</c:if>

		<c:if test="${isLogon eq 'true' || isLogon != null }">
			<div class=before_login>
				<!-- 로그아웃 버튼 -->
				<a class="logout" href="/damovie/member/logout.do"><span
					style="color: white"><i
						class="fa fa-angle-left fa-2x fa-pull-left" aria-hidden="true">&nbsp;</i></span></a>
				<!-- 마이페이지 -->
				<a class="mypage" href="/damovie/mypage.do"><span style="color: white"><i
						class="fa fa-user fa-2x fa-pull-left" aria-hidden="true">&nbsp;</i></span></a>
				<!-- 고객센터 버튼 -->
				<a class="question" href="/damovie/servicecenter.do"><span
					style="color: white"><i
						class="fa fa-question fa-2x fa-pull-left" aria-hidden="true">&nbsp;</i></span></a>
			</div>
		</c:if>


	</div>

	<div class="mainForm">
		<div class="menu_toggle">
			<ul>
				<li class="menu_num">.01.</li>
				<c:if test="${isLogon eq 'true'}">
					<li><a href="/damovie/book/bookForm.do">영화 예매</a></li>
				</c:if>

				<c:if test="${isLogon eq 'false' || isLogon == null}">
					<li><a id="l" href="/damovie/main.do">영화 예매</a></li>
					<script>
					$(document).ready(function() {
						$('#l').click(function() {
 								alert('로그인후에 가능한 기능입니다.');
						});
					});
					</script>
				</c:if>
				<li class="menu_num">.02.</li>
				<li><a href="#">영화 정보</a></li>
				<li class="menu_num">.03.</li>
				<li><a href="#">영화 리뷰</a></li>
				<li class="menu_num">.04.</li>
				<li><a href="/damovie/servicecenter.do">고객센터</a></li>
			</ul>
		</div>

		<div class="footer">
			<div>
				<p>본 콘텐츠의 저작권은 저작권자 또는 제공처에 있으며, 이를 무단 이용하는 경우 저작권법 등에 따라 법적 책임을
					질 수 있습니다.</p>
				<p>
					<span>사업자등록번호 : 555-5555555</span> <span> 통신판매업 신고번호 : 서울종로
						제 2020 - 555호</span><br> <span>대표이사 : 금영석사업자등록정보 확인</span> <span>주소
						: 서울시 종로구 종로3가 단성사</span> <span>대표전화 : 5555-5555</span>
			</div>
		</div>
	</div>

	<div id="wrapper">
		<div id="line-wrapper">
			<!-- 추가된 부분 -->
			<div id="line-top" class="line init top-reverse"></div>
			<div id="line-mid" class="line init mid-reverse"></div>
			<div id="line-bot" class="line init bot-reverse"></div>
		</div>
	</div>




</body>
</html>

