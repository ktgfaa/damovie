<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<link href='${path}/damovie/resources/css/fullcalendar/core_main.css' rel='stylesheet' />
<link href='${path}/damovie/resources/css/fullcalendar/daygrid_main.css' rel='stylesheet' />
<script src='${path}/damovie/resources/js/fullcalendar/coremain.js'></script>
<script src='${path}/damovie/resources/js/fullcalendar/interaction_main.js'></script>
<script src='${path}/damovie/resources/js/fullcalendar/daygrid_main.js'></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var date = new Date();
    if(date.getDate() > 9) {
	var dd = date.getDate();
	var ddd = date.getDate() + 1;
	var dddd = date.getDate() + 2;
    } else if (date.getDate() <10) {
    	var dd = "0" + date.getDate();
    	var ddd = "0" + (date.getDate()+1);
    	var dddd = "0" + (date.getDate()+2);
    }
    if(date.getMonth() + 1 > 9) {
    	var mm = date.getMonth() + 1;
        } else if (date.getMonth() +1 <10) {
        	var mm = "0" + (date.getMonth() + 1);
        }
	var y = date.getFullYear();
 	const todayDate = y + "-" + mm + "-" + dd;
 	const tomoDate = y + "-" + mm + "-" + ddd;
 	const nextDate = y + "-" + mm + "-" + dddd;
 	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [  'interaction', 'dayGrid'] ,
      height : 580,
      dateClick: function(info) {
    	    const date = info.dateStr;
    	    if(todayDate == date || tomoDate == date || nextDate == date) {
    		const movieName = $("#movieName").val();
    		const bmImage = $(".bmImage").attr("src");
    		const companyName = $("#company").val();
    		const theater = $("#theater").val();
    		var people = $("#people").val();
    		var price = $("#price").val();
    		
     		location.href="bookForm.do?company=" + companyName
    			+"&movieName=" + movieName
    			+"&bmImage=" + bmImage
    			+"&theater=" + theater
    			+"&people=" + people
    			+"&price=" + price
    			+"&date=" + date
    			;	
    	    } else {
    	    	alert('오늘을 기준으로 3일까지 예약이 가능합니다. 다시 선택해주세요!!');
    	    }
    	  }
    });
    calendar.render();
  });
</script>
<style>

.top {
	height: 230px;
}

.fc-unthemed td.fc-today {
	background-color : #00000000;
	color: #00fff3;
}

.fc-day:hover {
  background: #2d5a56;
  cursor: pointer;
}

.fc-unthemed td.fc-today:hover {
  background-color: #2d5a56;
  cursor: pointer;
}

#calendar {
	margin: 0;
	color: white;
	width: 400px;
	/*     position: absolute; */
	padding-left: 73.1%;
	padding-top: 33px;
	/*     right: 183px;
    top : 10px; */
}

.bookForm {
	height: 637px;
}

.firstBook {
	margin-left: 10.5%;
	width: 1524px;
	height: 100%;
	border: 1px solid;
	border-color: white;
	position: absolute;
		margin-top: 40px;
}

.movieSel {
	width: 250px;
	border-right: 1px solid;
	height: 636px;
	margin: 0;
	position: absolute;
	border-color: white;
}

.theaterSel {
	width: 545px;
	border-right: 1px solid;
	border-left: 1px solid;
	height: 636px;
	margin: 0;
	position: absolute;
	left: 36.6%;
	border-color: white;
}

.movieRes_div {
	width: 95%;
    height: 96%;
    padding: 7px;
}

.movieRes_div>div>ul {
	padding: 0;
	margin: 0;
	color: #a7c7da;
}

.movieRes_div>div>ul>li {
	margin-top: 10px;
}

.bmImage {
	width: 229px;
	height: 257px;
}

#movieName {
	font-size: 20px;
	border: none;
	background-color: #00000000;
	color: white;
}

.movieName {
		float : left;
	margin: 0;
	font-size: 17px;
	border: none;
	background-color: #00000000;
	color: white;
}

.inputFont {
	font-size: 15px;
	border: none;
	background-color: #00000000;
	color: white;
	padding-top: 6px;
    padding-left: 10px;
}

#reset {
	width: 90px;
	border-radius: 10px;
	height: 40px;
	background-color: black;
	font-style: oblique;
	color: white;
}

#sit {
	margin-left: 30px;
	width: 100px;
	border-radius: 10px;
	height: 40px;
	background-color: black;
	font-style: oblique;
	color: white;
}

.movieSel_div {
	width: 300px;
	height: 636px;
	margin: 0;
	position: absolute;
	left: 16.7%;
	border-color: white;
}

.movieList {
	width: 280px;
	height: 617px;
	padding: 10px;
	overflow: auto;
}

.List_ul, .List_ul>li , .other_ul , .other_ul>li{
	margin: 0;
	padding: 0;
}

.List_ul>li>button {
	width: 100%;
	text-align: left;
	height: 50px;
	font-size: 20px;
	background-color: black;
	font-style: oblique;
	color: white;
}

.companyList {
	width: 200px;
	height: 314px;
	padding: 7px;
	text-align: center;
	overflow: auto;
	border-bottom: 1px solid;
	border-color: white;
}

.btnhover:hover {
	background-color: #ffffff30;

}

.theaterList {
    width: 315px;
    left: 40%;
	height: 314px;
	top: 5px; padding : 5px; border-left : 1px solid; border-bottom : 1px
	solid; border-color : white;
	margin: 0;
	text-align: center;
	position: absolute;
	overflow: auto;
	padding: 5px;
	border-left: 1px solid;
	border-bottom: 1px solid;
	border-color: white;
}

.otherList {
	width: 545px;
    height: 307px;
}

.movie_time {
	width: 531px;
    height: 105px;
    padding: 7px;
    text-align: center;
    border-bottom: 1px solid;
    border-color: white;
}

.person {
	width: 531px;
    height: 173px;
    padding: 7px;
    text-align: center;
}

.other_ul > li {
	float: left;
	list-style:none;
	margin-right: 10px;
}

.other_ul > li > input {
		background-color: black;
	color : white;
}

#adult_ul , #student_ul {
	width: 540px;
    height: 75px;
}

#time {
	width: 50px;
    display: inline-block;
    margin: 0;
    color: white;
    border : none;
    font-size: 15px;
    background-color: #00000000;
}

    .fc-day-number.fc-sat.fc-past { color:#0000FF; }
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }

</style>
</head>
<body>

	<div class="bookForm">
		<div class="firstBook">
			<!--------------------------------------------------- 예약 정보 ------------------------------------------------------------- -->
			<div class="movieSel">
				<div class="movieRes_div">
					<div class="bookForm" name="order">
						<ul>
							<li style="margin-top:0px;"><img class="bmImage" name="bmimage" src="${bmImage }"  /></li>
							<li><input type="hidden" id="id" name="id" value="${member.getId() }" name="id" /></li>
							<li><p class="movieName">영화 : </p><input type="button" id="movieName" name="movie_name" value="${movieName }" /></li>
							<li><p class="movieName">회사 : </p><input type="button" id="company" class="inputFont" name="company" value="${company }" /></li>
							<li><p class="movieName">극장 : </p><input type="button" id="theater" class="inputFont" name="theater_name" value="${theater }"  /></li>
							<li><p class="movieName">영화관 : </p><input type="button" id="theater_num" class="inputFont" name="theater_num" value="${theaterNum }"  /></li>
							<li><p class="movieName">날짜 : </p><input type="button" id="date" class="inputFont" name="movie_date" value="${date }"/><p style="color:white;width: 5px;display: inline-block;margin: 0;">, </p>
							<input type="button" id="time" name="time" value=""/></li>
							<li><p class="movieName">성인 : </p><input type="button" id="adult" class="inputFont" name="adult" value="${adult }"  /></li>
							<li><p class="movieName">학생 : </p><input type="button" id="student" class="inputFont" name="student" value="${student }"  /></li>
							<li><p class="movieName">금액 : </p><input type="button" id="price" class="inputFont" name="price" value="${price }"  /></li>
							<li><input id="reset" type="reset" value="리  셋" onclick="imageReset()" /><input id="sit" type="button" value="다  음"/></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- ------------------------------ 영화 선택 ------------------------------------------- -->

			<div class="movieSel_div">
				<div class="movieList">
					<ul class="List_ul">
						<li><h1 style="color: white; margin: 0px; margin-bottom: 20px;">1 영화 선택</h1></li>
						<c:forEach var="Movie" begin="0" end="${movieList.size() }" items="${movieList }">
						<c:set var="index" value="${movieList.indexOf(Movie) }" />
						<c:out value="">${index }</c:out>	
						<li><button id="${imageList.get(index)}" class="btnhover" onclick="clickMovieEvent()">${Movie }</button></li>
						</c:forEach>
					</ul>
				</div>

			</div>

			<!-- ------------------------------ 극장 선택 ------------------------------------------- -->

			<div class="theaterSel">
				<div class="companyList">
					<ul class="List_ul">
						<li><h1 style="color: white; margin: 0px; margin-bottom: 20px;">2 회사 선택</h1></li>
						<c:forEach var="company" items="${companyList }">
						<li><button id="${company }" style="color: #ff9191;" onclick="clickCompanyEvent()" class="btnhover">${company }</button></li>
						</c:forEach>
					</ul>
				</div>
				<div class="theaterList">
					<ul class="List_ul">
						<li><h1 style="color: white; margin: 0px; margin-bottom: 20px;">3 극장 선택</h1></li>

							<c:forEach var="Theater" items="${theaterList }">
								<li><button id="theater" onclick="clickTheaterEvent()" style="color: #ff9191;" class="btnhover">${Theater }</button></li>
							</c:forEach>

					</ul>
				</div>
				<div class="otherList">
					<div class="movie_time">
						<ul class="other_ul">
							<li style="float: none;text-align: left;"><h1 style="color: white; margin: 0px; margin-bottom: 20px;">4 시간</h1></li>
<%-- 							<c:forEach var="moiveTime" items="${movieTime }"> --%>
							<c:if test="${movieTime.getTime1() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime1() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime2() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime2() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime3() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime3() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime4() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime4() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime5() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime5() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime6() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime6() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime7() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime7() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime8() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime8() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime9() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime9() }" onclick="movieTime()"/></li>
							</c:if>
							<c:if test="${movieTime.getTime10() != null }">
							<li><input class="time" type="button" value="${movieTime.getTime10() }" onclick="movieTime()"/></li>
							</c:if>
<%-- 							</c:forEach> --%>
						</ul>
					</div>
					<div class="person">
						<ul id="adult_ul" class="other_ul" style="margin-bottom: 20px;">
							<li style="float: none;text-align: left;"><h2 style="color: white; margin: 0px; margin-bottom: 10px;">5 인원</h1></li>
							<li><input type="button" style="border: black;background: black;color: white;margin-right: 12px;font-size: 20px;"value="성인"></li>
							<li><input type="button" class="adult" value="1" onclick="adultEvent()"></li>
							<li><input type="button" class="adult" value="2" onclick="adultEvent()"></li>
							<li><input type="button" class="adult" value="3" onclick="adultEvent()"></li>
							<li><input type="button" class="adult" value="4" onclick="adultEvent()"></li>
							<li><input type="button" class="adult" value="5" onclick="adultEvent()"></li>
							<li><input type="button" class="adult" value="6" onclick="adultEvent()"></li>
							<li><input type="button" class="adult" value="7" onclick="adultEvent()"></li>
							<li><input type="button" class="adult" value="8" onclick="adultEvent()"></li>
							<li><input type="button" class="adultprice" value="10000" style="border:none;" disabled="disabled"></li>
						</ul>
						<ul id="student_ul" class="other_ul">
							<li><input type="button" style="border: black;background: black;color: white;margin-right: 12px;font-size: 20px;"value="학생"></li>
							<li><input type="button" class="student" value="1" onclick="studentEvent()"></li>
							<li><input type="button" class="student" value="2" onclick="studentEvent()"></li>
							<li><input type="button" class="student" value="3" onclick="studentEvent()"></li>
							<li><input type="button" class="student" value="4" onclick="studentEvent()"></li>
							<li><input type="button" class="student" value="5" onclick="studentEvent()"></li>
							<li><input type="button" class="student" value="6" onclick="studentEvent()"></li>
							<li><input type="button" class="student" value="7" onclick="studentEvent()"></li>
							<li><input type="button" class="student" value="8" onclick="studentEvent()"></li>
							<li><input type="button" class="studentprice" value="8000" style="border:none;" disabled="disabled"></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- ------------------------------ 날짜 선택 ------------------------------------------- -->

			<div id='calendar'></div>


		</div>
	</div>
	<script type="text/javascript">
	function imageReset() {
		$(".bmImage").attr("src","");
		$("#movieName").attr("value","");
		$("#company").attr("value","");
		$("#theater").attr("value","");
		$("#theater_num").attr("value","");
		$("#date").attr("value","");
		$("#adult").attr("value","");
		$("#student").attr("value","");
		$("#price").attr("value","");
		location.href="bookForm.do"; 
	}
	
	function clickMovieEvent() {
		const cbtn = $(event.target);
		const movieName = cbtn.text();
		const imageName = cbtn.attr('id');
		const companyName = $("#company").val();
		
		$(".bmImage").attr("src", "${path}/damovie/resources/images/movie/" +imageName);
		const bmImage = $(".bmImage").attr("src");
 		location.href="bookForm.do?company=" + companyName
			+"&movieName=" + movieName
			+"&bmImage=" + bmImage
			;	
	}
	
 	function clickCompanyEvent() {
		const cbtn = $(event.target);
		const companyName = cbtn.attr('id');
		const movieName = $("#movieName").val();
		const bmImage = $(".bmImage").attr("src");
		
 		location.href="bookForm.do?company=" + companyName
 				+"&movieName=" + movieName
 				+"&bmImage=" + bmImage
 				;	
	} 
 	
 	function clickTheaterEvent() {
		const cbtn = $(event.target);
		const theater = cbtn.text();
		$("#theater").attr("value", theater);
		const date = $('#date').attr('value');
		const movieName = $("#movieName").val();
		const companyName = $("#company").val();
		const bmImage = $(".bmImage").attr("src");
		var adult = $("#adult").val();
		var student = $("#student").val();
		var price = $("#price").val();
		console.log(movieName);
		if(movieName == "" || movieName == null) {
			alert('영화를 먼저 선택해주세요!!!');
		} else if (date == "" || date == null) {
			alert('시간을 선택 해 주세요!!!');
		} else {
	 		location.href="bookForm.do?company=" + companyName
				+"&movieName=" + movieName
				+"&bmImage=" + bmImage
				+"&theater=" + theater
				+"&adult=" + adult
				+"&student=" + student
				+"&price=" + price
				+"&date=" + date
				;	
		}
		
 		
 	}
 	
 	function adultEvent() {
 		const cbtn = $(event.target);
 		const person = cbtn.val();
 		const price = $("#price").val();
 		const adult_price = $(".adultprice").val();
 		const student_price = $(".studentprice").val();
 		const studentvalue = $("#student").attr("value");

 		if(Number(studentvalue) + Number(person) > 8 ) {
 			alert("최대 8명까지 예약가능합니다.");
 		} else {	
 		
 		$("#adult").attr("value" , Number(person));
 		$("#price").attr("value" ,  (student_price * studentvalue ) + (adult_price *person ));
 		
 		}
 	}
 	
 	function studentEvent() {
 		const cbtn = $(event.target);
 		const person = cbtn.val();
 		const price = $("#price").val();
 		const student_price = $(".studentprice").val();
 		const adult_price = $(".adultprice").val();
 		const adultvalue = $("#adult").attr("value");
 		
 		if(Number(adultvalue) + Number(person) > 8 ) {
 			alert("최대 8명까지 예약가능합니다.");
 		} else {	
	 		$("#student").attr("value" , Number(person));
	 		$("#price").attr("value" , (adult_price * adultvalue ) + (student_price * person));
 		}
 	}
 	
 	function movieTime() {
		const cbtn = $(event.target);
		const time = cbtn.attr("value");
		console.log(time);
		$("#time").attr("value",time);
 		
 	}

 	$('#sit').click(function(){
 		const date = $('#date').attr('value');
 		const movieName = $("#movieName").val();
 		const companyName = $("#company").val();
 		const bmImage = $(".bmImage").attr("src");
 		const adult = $("#adult").val();
 		const student = $("#student").val();
 		const price = $("#price").val();
 		const time = $("#time").val();
 		const theater = $("#theater").val();
 		const id = $("#id").val();
 		const theater_num = $("#theater_num").val();
 		
 		if(date == null || date == "" || movieName == null || movieName == "" || companyName == null || companyName == "" || bmImage == null || bmImage == "" || 
 				price == null || price == "" || time == null || time == "" || theater == null || theater == "" || id == null || id == "" || 
 				theater_num == null || theater_num == "") {
 			if(adult == null || adult == "" && student == null || student == "" ) {
 			alert("빠짐없이 선택후 다음으로 넘어가주세요!!!");
 			}
 		}  else {
 		
 		$.ajax({
 			url: "${contextPath}/book/addseat.do",
 			type: "post",
 			dataType:"text",
 			data : {
			      id : id,
 			      movie_name : movieName,
 			      company : companyName,
 			      theater_name : theater,
 			      theater_num : theater_num,
 			      time : time,
 			      price:price,
 			      adult: adult,
 			      bmimage : bmImage,
 			      movie_date : date,
 			      student : student
 			    },  
 			success: function(data){    
				console.log('성공');
				location.href="seat.do";
 			},complete: function(data){
 			},error: function (request, status, error) {
 			   alert("전부 선택해야 다음페이지로 넘어갈수있습니다.");
 			  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			  
 			}
 		});
 		}
 	});
</script>
</body>
</html>