<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function list(page){
	location.href="${contextPath}/review.do?imageName=${movieInfo.getImage_name()}&movieName=${movieInfo.getMovie_name()}&curPage="+page;
}
$( document).ready(function(){
	$('.starRev span').hover(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  
		  
			if ($(this).attr("class") == "starR1 on") {
				var score = $(this).text();
				$('#score').val(score);
			} else {
				var score = $(this).text();
				$('#score').val(score);
			}
			
		  return false;
	});
});
function fn_write() {

	if($('#user_id').val() == null || $('#user_id').val() == "" ) {
		alert("로그인 해주세요");
		return;
	}
	
	if ($('#score').val() == null || $('#score').val() == 0) {
		alert("별점을 넣어주세요");
		return;
	}
	if($('.length').val() == null || $('.length').val() == 0 ) {
		alert("리뷰를 작성해주세요");
		return;
	}
	var list = new Array(); 
	$('.id_info').each(function(index,item){
		list.push($(item).text());
	});
	for(var i=0; i<list.length; i++) {
		if(list[i] == $('#user_id').val()) {
			alert("하나의 아이디로 하나의 리뷰만 작성하실 수 있습니다.");
			return;
		}
	}
	var form = $('.writeForm');
	form.submit();
}
var x=0;
$( document).ready(function(){
	$('.n_btn').click(function(){
		var length=$('.top_poster').length-5;
		if(x==length*-184) {
			return;
		}  
		x-=184;
		$('.all_poster').css("transform","translate("+x+"px,0px)");
	});
	$('.p_btn').click(function(){
		if (x==0) {
			return;
		}
		x+=184;
		$('.all_poster').css("transform","translate("+x+"px,0px)");
	});
});

$( document).ready(function(){
	$('.poster').click(function(){
		const cbtn = $(event.target); 
		const imageName = cbtn.attr('name');
		const movieName = cbtn.attr('id');

		
		location.href="review.do?imageName=" + imageName
		+"&movieName=" + movieName +"&curPage=1";
		
	});
});
function fn_delete(user_id, image_name, movie_name, des) {
	var form= document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action","delReview.do");
	
	var userId = document.createElement("input");
	userId.setAttribute("type","hidden");
	userId.setAttribute("name","user_id");
	userId.setAttribute("value",user_id);
	
	var imageName = document.createElement("input");
	imageName.setAttribute("type", "hidden");
	imageName.setAttribute("name", "image_name");
	imageName.setAttribute("value", image_name);
	
	var movieName = document.createElement("input");
	movieName.setAttribute("type", "hidden");
	movieName.setAttribute("name", "movie_name");
	movieName.setAttribute("value", movie_name);
	
	var desc = document.createElement("input");
	desc.setAttribute("type", "hidden");
	desc.setAttribute("id", "des");
	desc.setAttribute("name", "des");
	desc.setAttribute("value", des)
	
	form.appendChild(userId);
	form.appendChild(imageName);
	form.appendChild(movieName);
	form.appendChild(desc);
	document.body.appendChild(form);
	form.submit();
	
}

function fn_mod() {
	$(event.target).parent().parent().children('.review_content').children('span').html("<textarea class='des_mod' id='des' name='des' >"
			+$(event.target).parent().parent().children('.review_content').children('span').text()+"</textarea>");
	$(event.target).parent().parent().children('.writer').children('.id_score').html("<input type='number' class='score_mod' min='1' max='10'>");
	$(event.target).parent().parent().children('.review_content').children('#modBtn').css("visibility", "visible");
	$(event.target).parent().parent().children('.review_content').children('#cancel').css("visibility", "visible");
	$(event.target).css("visibility", "hidden");
	$(event.target).parent().children('.delBtn').css("visibility", "hidden");
	
}

function lastMod(image_name, movie_name, user_id) {
	
	if($('.score_mod').val() == 0 ) {
		alert("별점을 주세요");
		return;
	}
	
	if($('.score_mod').val() > 10) {
		alert("별점은 1~10점 까지만 가능합니다.");
		return;
		
	}
	if($('.des_mod').val() == null || $('.des_mod').val() == "") {
		alert("리뷰를 작성해주세요");
		return;
	}
	if($('.des_mod').val().length > 200) {
		alert("글자수는 최대 200글자입니다.");
		return;
		
	}
	
	
	var form= document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action","modReview.do?imageName="+image_name+"&movieName="+movie_name);
	
	var movieName = document.createElement("input");
	movieName.setAttribute("type", "hidden");
	movieName.setAttribute("id", "movie_name");
	movieName.setAttribute("name", "movie_name");
	movieName.setAttribute("value", movie_name);
	
	var userId = document.createElement("input");
	userId.setAttribute("type","hidden");
	userId.setAttribute("id","user_id");
	userId.setAttribute("name","user_id");
	userId.setAttribute("value",user_id);
	
	var desc = document.createElement("input");
	desc.setAttribute("type", "hidden");
	desc.setAttribute("id", "des");
	desc.setAttribute("name", "des");
	desc.setAttribute("value", $('.des_mod').val());
	
	var sco = document.createElement("input");
	sco.setAttribute("type", "hidden");
	sco.setAttribute("id", "score");
	sco.setAttribute("name", "score");
	sco.setAttribute("value", $('.score_mod').val());
	
	
	
	form.appendChild(userId);
	form.appendChild(movieName);
	form.appendChild(desc);
	form.appendChild(sco);
	document.body.appendChild(form);
	form.submit();
	
}
function cancel(des,score) {
	console.log(des);
	console.log(score);
	$(event.target).parent().children('span').html("<span>"+des+"</span>");
	$(event.target).parent().parent().children('.writer').children('.id_score').html("<span class='id_score'>"+score+"</span>");
	$(event.target).css("visibility", "hidden");
	$(event.target).parent().children('#modBtn').css("visibility", "hidden");
	$(event.target).parent().parent().children('.review_option').children('.modBtn').css("visibility", "visible");
	$(event.target).parent().parent().children('.review_option').children('.delBtn').css("visibility", "visible");
	
}
$(document).ready(function(){
	$('.length').on('keyup',function(){
		if($(this).val().length > 200) {
			$(this).val($(this).val().substring(0,200));
		}
		$('#length').text($('.length').val().length);
	});
	
	
});
	
</script>
<style>
	.review_page{
	    padding-top: 5%;
	    padding-left: 15%;
	}
	.review_page > .review_box {
		height: 100%;
    	width: 1280px;
    	background-color: #0000009c;
    	box-shadow: 0 0 43px 61px #0000009c;
	}
	.review_box > .top_container {
		width: 1280px;
	    height: 270px;
	    padding: 4% 0 0 0;
	    border-top: dashed 1px white;
	    position:relative;
	}
	.top_box {
		position: relative;
	    margin-left: 207px;
	    overflow: hidden;
	    width: 920px;
	    height: 260px;
	}
	.all_poster {
		width: 4000px;
	    height: 250px;
	    
	}
	.top_poster {
		float : left;
		width: 184px;
	}
	.top_poster .poster {
		width: 150px;
	    height: 200px;
	    background-size: 150px 200px;
	    padding: 0;
	    margin: 0;
	    border: none;
	    cursor: pointer;
	}
	.top_poster > p {
		color: white;
	    font-size: 15px;
	    width: 150px;
	    text-align: center;
	    height: 20px;
	}
	.p_btn {
		float: left;
	    height: 127px;
	    padding-right: 34px;
	    padding-top: 77px;
	    position: absolute;
	    top: 50px;
	    left: 123px;
	}
	.p_btn > button {
		background-color: transparent;
		color: white;
	    border: none;
	    width: 50px;
	    height: 50px;
	    cursor: pointer;
	    font-size: 44px;
	    padding:0;
	}
	.n_btn {
		float: left;
	    height: 127px;
	    padding-top: 77px;
	    position: absolute;
	    right: 100px;
	    top: 50px;
	}
	.n_btn > button {
	    background-color: transparent;
	    color: white;
	    border: none;
	    width: 50px;
	    height: 50px;
	    cursor: pointer;
	    font-size: 44px;
	    padding:0;
	}
	
	
	<!-- 영화 정보 -->
	.info_container {
		
	}
	
	.info_container {
		float:left;
		display:inline;
		width: 1280px;
	    height: 300px;
	    padding: 4% 0 2% 0;
	    border-top: 1px dashed white;
/* 	    visibility: hidden; */
	}
	.info_container > .info_image {
		float: left;
	    width: 185px;
	    height: 300px;
	    margin-left: 50px;
	}
	.info_image > img {
		width: 185px;
    	height: 260px;
	}
	.info_container > .info_contents {
		padding-left: 285px;
	    width: 995px;
	    height: 260px;
		color: white;
	}
	.info_contents > .info_top{
		width: 995px;
		display: -webkit-box;
		height: 55px;
	}
	.info_top > strong {
		padding-right: 143px;
    	font-size: 25px;
	}
	.info_top > button {
		height: 40px;
	    font-size: 18px;
	    width: 100px;
	    border-radius: 14px;
	    background-color: #FF243E;
	}
	.info_top a {
		color: white;
    	text-decoration: none;
	}
	.info_top > .str {
		font-size: 20px;
		padding-right: 280px;
	}
	 #str > img {
		width:20px;
		height:20px;
	}
	.title > ul {
		margin: 0px;
    	padding: 0px;
	}
	.title > ul > li {
		padding-bottom: 5px;
	}
	.title > ul > li > em {
		padding-right: 5px;
		font-size:13px;
	}
	<!-- 리뷰 작성 -->
	.review_container {
		
	}
	.review_container {
		display: -webkit-inline-box;
	    width: 1280px;
	    height: 180px;
	    padding: 4% 0 0 0%;
	    border-top: 1px dashed white;
/* 	    visibility: hidden; */
	    
	}
	.review_container > .star_score{
		display: inline-block;
	    text-align: center;
	    margin: 30px 0 30px 30px;
	    border: 1px solid white;
	    width: 200px;
	    height: 90px;
	}
	 .starRev {
		display:inline-block;
		padding-top: 5px;
	} 
	.starR1{
	    background-image:url('/damovie/resources/images/star_score.png');
	    background-repeat: no-repeat;
	    background-position : -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	.starR2{
	    background-image:url('/damovie/resources/images/star_score.png');
	    background-repeat: no-repeat;
	    background-position : right 0;
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
	.star_value #score {
		text-align: center;
	    border: none;
	    background-color: #00000000;
	    color: white;
	    cursor: auto;
	    font-size: 30px;
	    width: 35px;
	    height: 35px;
	    font-weight: bold;
	}
	.star_value span {
		color: white;
	    font-size: 18px;
	}
	.review_write {
		border-top: 1px solid white;
	    border-bottom: 1px solid white;
	    width: 800px;
	    height: 90px;
	    margin: 30px 0 30px 0;
	}
	.review_write #des {
		border: none;
	    width: 800px;
	    height: 65px;
	    resize: none;
	    background-color: #0000009c;
	    color: white;
	}
	.review_container > #button {
		width: 200px;
	    height: 90px;
	    margin: 30px 0px 30px 0px;
	    border-radius: 5px;
	    background-color: #424242;
	    font-size: 18px;
	    color: white;
	    cursor:pointer;
	}
	#score:focus{
		outline: none;
	}
	/* 쓴 리뷰 */
	
	.review_see {
		width: 1200px;
	    padding: 3% 0 0 0;
/* 	    visibility: hidden; */
	}
	.review_see ul {
		display:block;
	}
	.review_see li {
		color: white;
	    position: relative;
	    padding: 1.5% 0 1.5% 0;
	    border-top: 1px solid #2f2f2f;
	}
	.writer {
		margin-bottom: 12px;
	}
	
	.writer > .id_info {
		position: relative;
	    padding-right: 11px;
	    margin-right: 9px;
	    font-size: 12px;
	}
	.writer > img {
		width:12px;
		height:12px;
	}
	.writer > .id_score {
		padding-right: 11px;
	    margin-right: 9px;
	    font-size: 15px;
	}
	.score_mod {
		width: 40px;
	    color: white;
	    background: rgba(0, 0, 0, 0);
	    -webkit-user-modify: read-only;
	}
	.writer > .id_date {
		font-size: 11px;
	}
	.review_content {
		margin-bottom: 12px;
		font-size:13px;
	}
	.des_mod {
		font-size: 13px;
	    background-color: rgba(0, 0, 0, 0);
	    color: white;
	    cursor: auto;
	    margin: 0px;
	    height: 30px;
	    width: 990px;
	    resize: none;
	    float: left;
	}
	#modBtn {
		visibility: hidden;
		height: 33px;
	    padding-left: 5px;
	    border: none;
	    background: rgba(0, 0, 0, 0);
	    color: aqua;
	    cursor: pointer;
	    text-decoration: underline;
	}
	#cancel {
		visibility: hidden;
		height: 33px;
	    padding-left: 5px;
	    border: none;
	    background: rgba(0, 0, 0, 0);
	    color: red;
	    cursor: pointer;
	    text-decoration: underline;
	}
	.review_see .modBtn {
		border: none;
	    background-color: #0000009c;
	    color: aqua;
	    text-decoration: underline;
	    cursor: pointer;
	    font-size: 12px;
	}
	.review_see .delBtn {
		border: none;
	    background-color: #0000009c;
	    color: red;
	    text-decoration: underline;
	    cursor: pointer;
	    font-size: 12px;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 상단 이미지 -->
	<div class="review_page">
		<div class="review_box">
			<h3 style="font-size:35px; color:white;">영화정보 / 리뷰</h3>
			<div class="top_container">
				<div class="top_box">
					<div class="all_poster">
						<c:forEach var="movieList" items="${movieList}">
						<div class="top_poster" style="width: 184px;">
							<input type="button" class="poster" id="${movieList.movie_name }" name="${movieList.image_name }" style="background-image: url(/damovie/resources/images/movie/${movieList.image_name})"></button>
							<p>${movieList.movie_name }</p>
						</div>
						</c:forEach>
					</div>
				</div>
				<div class="p_btn">
					<button type="button" role="presentation" class="prev"><span aria-label="Previous">‹</span></button>
				</div>
				<div class="n_btn">
					<button type="button" role="presentation" class="next"><span aria-label="Next">›</span></button>
				</div>
			</div>
			<c:if test="${movieInfo != null}">
			<div class="info_container">
				<div class="info_image">
					<img class="mid_poster" src="/damovie/resources/images/movie/${movieInfo.getImage_name()}" />
				</div>
				<div class="info_contents">
					<div class="info_top">
        				<strong id="movieName">${movieInfo.getMovie_name() }</strong>
					    <strong id="str">
					    	<img src="/damovie/resources/images/star-filled.png" />
					    	<strong>${total } </strong>
					    </strong>
        				<button><a href="/damovie/book/bookForm.do">예매하기</a></button>
					</div>
					<div class="title">
						<ul>
    						<li><em>장르</em><em style="color:gray;">${movieInfo.getJenre() }</em>  |  <em>개봉일</em><em style="color:gray;">${movieInfo.getOpening_Date() }</em>  |  <em>상영시간</em><em style="color:gray;">${movieInfo.getRuntime() }</em></li>
                            <li><em>감독</em><em style="color:gray;">${movieInfo.getDirector() }</em></li>
                            <li><em>출연진</em><em style="color:gray;">${movieInfo.getActor() }</em></li>
                            <li><em>줄거리</em></li>
                            <li><em style="color:gray;">${movieInfo.getSummary() }</em></li>
						</ul>
					</div>
				</div>
			</div>
			
			<form action="reviewWrite.do?imageName=${movieInfo.getImage_name() }&movieName=${movieInfo.getMovie_name() }" method="post" class="writeForm">
			<div class="review_container">
				<input type="hidden" name="movie_name" value="${movieInfo.getMovie_name() }">
				<input type="hidden" name="user_id" id="user_id" value="${member.id }">
				<input type="hidden" name="image_name" value="${movieInfo.getImage_name() }">
				<div class="star_score">
					<div class="starRev">
						<span class="starR1">1</span>
						<span class="starR2">2</span>
						<span class="starR1">3</span>
						<span class="starR2">4</span>
						<span class="starR1">5</span>
						<span class="starR2">6</span>
						<span class="starR1">7</span>
						<span class="starR2">8</span>
						<span class="starR1">9</span>
						<span class="starR2">10</span>
					</div>
					<div class="star_value">
						<input type="text" id="score" name="score" readonly><span>점</span>
					</div>
				</div>
				<div class="review_write">
					<textarea placeholder="리뷰를 입력하세요(최대200자)" class="length" id="des" name="des" ></textarea>
					<div style="width:798px; height:16px; text-align:right;">
						<span style="color:white; font-size:12px;"><span id="length" style="color:white; font-size:12px;">0</span>/200</span>  
					</div>
				</div>
				
				<input type="button" id="button" onClick="fn_write()" value="글쓰기" />

			</div>
			</form>
		</c:if>
		
		<c:if test="${reviewList != null }">
		
		<div class="review_see">
			<h6 style="margin-left:39px; color:white;"><span>총 리뷰 개수 : </span>${fn:length(reviewList)}</h6>
			<ul>
				<c:forEach var="review" items="${map.list}">
				<c:if test="${review.movie_name == movieInfo.getMovie_name() }">
				<li>
				<div class="writer">
					<span class="id_info">${review.user_id }</span>
					<img src="/damovie/resources/images/star-filled.png">
					<span class="id_score">${review.score }</span>
					<span class="id_date">${review.review_date }</span>
				</div>
				<div class="review_content">
					<span>${review.des }</span>
					<input type="button" id="modBtn" onClick="lastMod('${movieInfo.getImage_name() }', '${review.movie_name }', '${review.user_id }')" value="수정하기">
					<input type="button" id="cancel" onClick="cancel('${review.des}','${rereview.score }')" value="취소">
				</div>
				<c:if test="${member.id == review.user_id }">
				<div class="review_option">
					<input type="button" class="modBtn" onClick="fn_mod()" value="수정" />
					<input type="button" class="delBtn" onClick="fn_delete('${review.user_id}','${movieInfo.getImage_name() }','${review.movie_name }','${review.des }')" value="삭제" />
				</div>
				</c:if>
				</li>
				</c:if>
				</c:forEach>
				<div style="text-align:center; width:1160px;">
					<table style="width:100%; text-align:center">
						<tr>
				<td colspan="8" align="center">
					<!-- 하나의 블록에서 반복문 수행 시작페이지에서 끝페이지 까지 -->
					<c:forEach var="num" begin="${map.BoardPager.blockBegin }" end="${map.BoardPager.blockEnd }">
						<c:choose>
							<c:when test="${num == map.BoardPager.curPage }">
								<span style="color: red">${num }</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:list('${num }')" style="color:white;">${num }</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>	
				</td>
			</tr>
					</table>
				</div>
			
		
			</ul>
		</div>
		
		</c:if>
		
		</div>
		
	</div>
</body>
</html>