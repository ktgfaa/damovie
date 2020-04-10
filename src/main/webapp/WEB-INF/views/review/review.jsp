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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$( document).ready(function(){
	$('.starRev span').hover(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
	});
});
</script>
<style>
	html, body, div, span, a, img, p {
		padding:0; 
		margin:0;
	}
	.review_page{
		width:1280px;
		height:1280px;
	}
	.review_page > .review_box {
		margin : 10px;
	}
	.prev
	.poster > img {
		width : 150px;
		height: 200px;
	}
	.top_poster {
		float : left;
	}
	.poster1 > img {
		width : 150px;
		height: 200px;
		position:absolute;
		left:280px;
		
	}
	.poster2 > img {
		width : 150px;
		height: 200px;
		position:absolute;
		left:480px;
		
	}
	.poster3 > img {
		width : 150px;
		height: 200px;
		position:absolute;
		left:680px;
		
	}
	.poster4 > img {
		width : 150px;
		height: 200px;
		position:absolute;
		left:880px;
		
	}
	.poster5 > img {
		width : 150px;
		height: 200px;
		position:absolute;
		left:1080px;
		
	}
	
	<!-- 영화 정보 -->
	
	.info_container {
		float:left;
		display:inline;
	}
	.info_container > .info_image {
		padding-right:50px;
		margin-left:100px;
		float:left;
		display:inline;
	}
	.info_image > img {
		width: 185px;
    	height: 260px;
	}
	.info_container > .info_contents {
	
	}
	.info_contents > .title {
		float: none;
		text-align : left;
	}
	.title strong {
		font-size: 25px;
    }
    .title p {
    	font-size:13px;
    	text-align : left;
    	margin-top : 5px;
    }
    .title #sub {
    	margin-top :30px;
    }
    .title #sub1 {
    	margin-top:10px;
    }
	<!-- 리뷰 작성 -->
	.review_container {
		
	}
	.review_container {
		display: -webkit-inline-box;
	    width: 1280px;
	    height: 200px;
	    margin-left:70px;
	}
	.review_container > .star_score{
		display: inline-block;
	    text-align: center;
	    margin: 30px 0 30px 30px;
	    border: 1px solid;
	    width: 200px;
	    height: 90px;
	}
	 .starRev {
		display:inline-block;
		padding-top: 5px;
	} 
	.starR1{
	    background:url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR2{
	    background:url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR1.on{background-position:0 0;}
	.starR2.on{background-position:-15px 0;}


	.star_value {
		padding-top : 15px;
	}
	.star_value strong {
		font-size:25px;
	}
	.review_write {
		border-top:1px solid;
		border-bottom:1px solid;
		width: 800px;
	    height: 90px;
	    margin: 30px 0 30px 0;
	}
	.review_write textarea {
		border:none;
		width:800px;
		height: 55px;
		resize:none;
	}
	.review_container > button {
		width: 200px;
	    height: 90px;
	    margin: 30px 0px 30px 0px;
	}
	/* 쓴 리뷰 */
	
	.review_see {
		margin-left:60px;
	}
	.review_see ul {
		display:block;
	}
	.review_see li {
		position: relative;
	    padding: 20px 0 15px 0px;
	    border-top: 1px solid;
	}
	.writer {
		margin-bottom: 12px;
	}
	
	
	.writer > .id_info {
		position: relative;
	    padding-right: 11px;
	    margin-right: 9px;
	    font-size: 15px;
	}
	.review_content {
		margin-bottom: 12px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 상단 이미지 -->
	<div class="review_page">
		<div class="review_box">
			<div class="top_container" style="width:1900px; height:270px;">
			<button type="button" role="presentation" class="prev"><span aria-label="Previous">‹</span></button>
			<div class="top_poster" style="width: 184px; margin-right: 15px;">
			<div class="item">
			<span class="poster1"><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202002/15521_101_1.jpg" alt="인비저블맨"></span>
			</div>
			</div>
			<div class="top_poster" style="width: 184px; margin-right: 15px;">
			<div class="item">
			<span class="poster2"><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202002/15449_101_1.jpg" alt="1917"></span>
			</div>
			</div>
			<div class="top_poster" style="width: 184px; margin-right: 15px;">
			<div class="item">
			<span class="poster3"><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202003/15570_101_1.jpg" alt="다크 워터스"></span>
			</div>
			</div>
			<div class="top_poster" style="width: 184px; margin-right: 15px;">
			<div class="item">
			<span class="poster4"><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/201810/13293_101_1.jpg" alt="스타 이즈 본"></span>
			</div>
			</div>
			<div class="top_poster" style="width: 184px; margin-right: 15px;">
			<div class="item">
			<span class="poster5"><img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202002/15415_101_1.jpg" alt="작은 아씨들"></span>
			</div>
			</div>
				
				<button type="button" role="presentation" class="next"><span aria-label="Next">›</span></button>
			</div>
			
			<div class="info_container" style="width:1900px; height:300px;">
				<div class="info_image">
					<img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202002/15521_101_1.jpg">
				</div>
				<div class="info_contents">
					<div class="title">
						<strong>인비저블맨</strong>
						<p id="sub">장르  공포 | 개봉일 2020.02.20 | 상영시간 119분</p>
						<p >감독  조지</p>
						<p>출연진  마커</p>
						<p id="sub1">줄거리 </p>
					</div>
					<div class="reserve_btn">
						<button>예매하기</button>
					</div>
				</div>
			</div>
			
			<div class="review_container">
				<div class="star_score">
					<div class="starRev">
						<span class="starR1">별1_왼쪽</span>
						<span class="starR2">별1_오른쪽</span>
						<span class="starR1">별2_왼쪽</span>
						<span class="starR2">별2_오른쪽</span>
						<span class="starR1">별3_왼쪽</span>
						<span class="starR2">별3_오른쪽</span>
						<span class="starR1">별4_왼쪽</span>
						<span class="starR2">별4_오른쪽</span>
						<span class="starR1">별5_왼쪽</span>
						<span class="starR2">별5_오른쪽</span>
					</div>
					<div class="star_value">
						<strong>별점</strong>
					</div>
				</div>
				<div class="review_write">
					<textarea></textarea>
				</div>
				<button>글쓰기</button>
			</div>
		<div class="review_see">
			<ul>
				<li>
				<div class="writer">
					<span class="id_info">id</span>
					<span class="id_score">별점</span>
					<span class="id_date">작성일</span>
				</div>
				<div class="review_content">
					<span>리뷰내용</span>
				</div>
				<div class="review_option">
					<button>수정</button>
					<button>삭제</button>
				</div>
				</li>
			</ul>
		</div>
		</div>
	</div>
</body>
</html>