<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>


.top {
	height: 270px;
}
.bookForm {
	height: 637px;
}

.firstBook {
	margin-left: 10.5%;
	width: 1524px;
	height: 101%;
	border: 1px solid;
	border-color: white;
	position: absolute;
}

.movieSel {
	width: 250px;
	border-right: 1px solid;
	height: 640px;
	margin: 0;
	position: absolute;
	border-color: white;
}

.seatSel {
	width: 1272px;
    height: 643px;
    float: left;
    margin-left: 252px;
}

.movieRes_div {
	width: 95%;
    height: 96%;
    padding: 7px;
}

.seatRes_div {
	width: 93%;
    height: 86%;
    padding-top: 4%;
    padding-left: 3%;
    padding-right: 4%;
    padding-bottom: 0;
    margin: 0;
}

.seatBtn_div > ul {
	margin : 0;
	padding: 0;
}

.movieRes_div>div>ul {
	padding: 0;
	margin: 0;
	color: #a7c7da;
}

.movieRes_div>div>ul>li {
	margin-top: 13px;
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
	font-size: 14px;
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

.screen_div > button {
	border:none;background-color:#398aefb3;color:white;
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

.seatButton_li {
	float : left;
	margin : 0px;
	margin-right: 20px;
}

.seatButton_li > button {
	width : 35px;
	height: 35px;
}

li:nth-child(4) , li:nth-child(6) {
	margin : 0;
	margin-right: 20px;
}

.screen_div {
	text-align: center;
	margin-bottom: 40px;
}

.screen_btn {
	width: 636px;
    height: 50px;
}

.seatBtn_div {
	height: 78%;
    padding-left: 45px;
}

.seatState_div {
	padding-left: 45px;
	margin-top: 20px;
	height: 50px;
}

.seatState_div > ul {
	margin : 0;
	padding : 0;
	width: 1000px;
	height: 50px;
    margin-left: 140px;
    float: left;
}

.seatState_div > ul > li {
	float : left;
	margin : 0;
	margin-right : 10px;
	height: 50px;
	margin-right: 20px;
}

.seatState_div > ul > li > button {
	width : 35px;
	height: 35px;
	float : left;
	margin-right: 10px;
}

.seatState_div > ul > li >  p {
	float : left;
	color: white;
	margin : 0;
	vertical-align: middle;
	margin-top: 6px;
}

.seatRow_name {
	width: 50px;
    height: 423px;
    margin: 0;
    padding: 0;
    position: absolute;
    top: 145px;
    left: 260px;
}

.seatRow_name > ul {
	margin : 0;
	padding : 0;
	padding-left: 20px;
}

.seatRow_name > ul > li > p {
	margin: 0;
    color: white;
    width: 30px;
    height: 30px;
    margin-bottom: 5.5px;
}

#resetBtn {
	width: 111px;
	border : none;
	border: 1px solid;
    background-color: black;
    color: white;
    border-radius: 10px 10px 10px 10px;
}

#resetBtn:hover {
	  background: #398aefb3;
}
</style>
</head>
<body onload="myFunction()">

	<div class="bookForm">
		<div class="firstBook">
			<!--------------------------------------------------- 예약 정보 ------------------------------------------------------------- -->
			<div class="movieSel">
				<div class="movieRes_div">
					<div class="Book" name="frmBook">
						<ul>
							<li style="margin-top:0px;"><img class="bmImage"src="${order.getBmimage() }"  /></li>
							<li><input type="hidden" id="id" name="id" value="${order.getId() }" name="id" /></li>
							<li><p class="movieName">영화 : </p><input type="button" id="movieName" name="movieName" value="${order.getMovie_name() }" /></li>
							<li><p class="movieName">회사 : </p><input type="button" id="company" class="inputFont" name="movieName" value="${order.getCompany() }" /></li>
							<li><p class="movieName">극장 : </p><input type="button" id="theater" class="inputFont" name="movieName" value="${order.getTheater_name() }"  /></li>
							<li><p class="movieName">영화관 : </p><input type="button" id="theater_num" class="inputFont" name="movieName" value="${order.getTheater_num() }"  /></li>
							<li><p class="movieName">날짜 : </p><input type="button" id="moive_date" class="inputFont" name="movieName" value="${order.getMovie_date() }"/><p style="color:white;width: 5px;display: inline-block;margin: 0;">, </p>
							<input type="button" id="time" value="${order.getTime() }"/></li>
							<li><p class="movieName">성인 : </p><input type="button" id="adult" class="inputFont" name="adult" value="${order.getAdult() }"  /></li>
							<li><p class="movieName">학생 : </p><input type="button" id="student" class="inputFont" name="student" value="${order.getStudent() }"  /></li>
							<li><p class="movieName">금액 : </p><input type="button" id="price" class="inputFont" name="movieName" value="${order.getPrice() }"  /></li>
							<li><p class="movieName">좌석 : </p><input type="button" id="seat" class="inputFont" name="seat" value=""  /></li>
						</ul>
					</div>
				</div>
			</div>
			
			<!-- -------------------------------------------- 좌석 선택 ------------------------------------------------------------------- -->
			<div class="seatSel" >
				<div class="seatRes_div">
					<!-- ------------------------ Screen -------------------------------- -->
					<div class="screen_div">
						<button class="screen_btn" disabled="disabled">SCREEN</button>
					</div>
					<!-- ------------------------ Seat button -------------------------- -->
					<c:set var="count" value="-1"></c:set>
					<c:set var="firstwidthNum" value="47"></c:set>
					<c:set var="b" value="${(MaxSeatNum - 1) + firstwidthNum }"></c:set>
					<c:set var="firstmarginNum" value="41"></c:set>
					<c:set var="c" value="${firstmarginNum - ((MaxSeatNum - 1) * 2)}"></c:set>
					<div class="seatBtn_div" style="width:${MaxSeatNum * b}px;margin-left:${c}%">
						<ul id="seat_ul" >
							<c:forEach var="j" begin="1" end="${seatRow_distinct.size() }">
								<c:forEach var="i" begin="1" end="${MaxSeatNum }">
										<c:set var="count" value="${count + 1}"></c:set> 
										<li class="seatButton_li">
												<c:if test="${seat_info.get(count).get('seatState') eq 'yes'}">
														<button id="${seatBtnid.get(count) }" class="Seatbtn" style="background-color: #2861a8;border: 1px solid;border-color: white;color: white;" onclick="seatSel()">${i }</button>
												</c:if>
												<c:if test="${seat_info.get(count).get('seatState') eq 'no' }">
														<button id="${seatBtnid.get(count) }" class="Seatbtn" style="background-color: #70113f;border: 1px solid;border-color: white;color: white;" disabled="disabled" onclick="seatSel()">X</button>
												</c:if>
										</li>
								</c:forEach>
							</c:forEach>
						</ul>
					</div>
					<!-- ---------------- 좌석 배열 ----------------------------------------------- -->
					<div class="seatRow_name">
						<ul>
							<c:forEach var="alphabet" items="${seatRow_distinct }">
								<li><p>${alphabet }</p></li>
							</c:forEach>
						</ul>
					</div>
					<!-- ---------------------- 좌석 설명 ---------------------------------- -->
					<div class="seatState_div">
						<ul>
							<li><button style="border: 1px solid;border-color:white;;background-color:#398aefb3;color:white;"></button><p>빈자리</p></li>
							<li><button disabled="disabled" style="border:1px solid;border-color:white;background-color: #ff008d59;color: white;">X</button><p>예약불가</p></li>
							<li><button style="border: 1px solid;border-color:white;color: white;background-color: #808080c7;">X</button><p>예약완료</p></li>
							<li><button style="border: 2px solid;background-color: #398aefb3;color: white;border-color: red;"></button><p>선택좌석</p></li>
							<li><button id="resetBtn" disabled="disabled">취소 : 좌석 클릭</button></li>
							<li style="margin-left: 110px;"><input id="reset" type="button" value="처음으로" onclick="backtoRes()" /><input id="sit" type="button" value="예 약" /></li>
						</ul>
					</div>
				</div>
			</div>


		</div>
	</div>
<script>
	function myFunction() {
		<c:if test="${seatResRowList.size() ne '0'}">	
			<c:forEach var="m" begin="0" end="${seatResRowList.size()-1 }">
				var row = "${seatResRowList.get(m)}";
				var col = "${seatResColList.get(m)}";
				var id = document.getElementById(row+col);
				id.style.background = "#808080c7";
				id.innerHTML = "X";
				id.setAttribute('disabled','disabled');
			</c:forEach>
		</c:if>
	}

	function backtoRes() {
		location.href="bookForm.do";
	}
	
	var num = 0;
	var clickSeat = new Array();
	function seatSel() {
		var maxNum = ${order.getAdult() + order.getStudent() };
		const cbtn = $(event.target);
		const seat = $("#seat");
		if(num == maxNum && cbtn.css("border") != "2px solid rgb(255, 0, 0)" ){
			alert('인원수를 초과 하였습니다.');
		} else if (cbtn.css("border") == "2px solid rgb(255, 0, 0)") {
			cbtn.css("border","1px solid");
			cbtn.css("border-color",'white');
			seat.attr("value","");
				if(num > 1) {
					clickSeat.splice( clickSeat.indexOf(cbtn.attr("id")), 1 );
					var ab = "";
					for(var i=0;i<clickSeat.length;i++){
						ab = ab + clickSeat[i] + ",";
					}
					seat.attr("value",ab);
				} else if (num == 1) {
					seat.attr("value","");
					clickSeat.pop();
				}
			
			num = num - 1;
			
		}	else if (cbtn.css("border") != "2px solid rgb(255, 0, 0)") {
		cbtn.css("border","2px solid");
		cbtn.css("border-color",'red');
		clickSeat.push(cbtn.attr("id"));
				if(num > 0) {
					var seatA1 = seat.attr("value");
					seat.attr("value", seatA1 + cbtn.attr("id") +",");
				} else if (num == 0) {
					seat.attr("value",cbtn.attr("id")+",");
				}
		num = num + 1;
		}
	}
	
 	$('#sit').click(function(){
 		const moive_date = $('#moive_date').attr('value');
 		const movie_name = $("#movieName").val();
 		const company = $("#company").val();
 		const bmImage = $(".bmImage").attr("src");
 		const adult = $("#adult").val();
 		const student = $("#student").val();
 		const price = $("#price").val();
 		const time = $("#time").val();
 		const theater = $("#theater").val();
 		const id = $("#id").val();
 		const seat = $("#seat").val();
 		const theater_num = $("#theater_num").val();
 		
 		if(moive_date == null || moive_date == "" || movie_name == null || movie_name == "" || company == null || company == "" || bmImage == null || bmImage == "" || 
 				price == null || price == "" || time == null || time == "" || theater == null || theater == "" || id == null || id == "" || 
 				theater_num == null || theater_num == "" || seat == null || seat == "" ) {
 			if(adult == null || adult == "" && student == null || student == "" ) {
 			alert("빠짐없이 선택후 다음으로 넘어가주세요!!!");
 			}
 		}  else {
 			
 	 		var seatList = new Array();
 	 		var seatPart = "";
 	 		for(var i =0; i<seat.length;i++){
 	 			if(i == 0) {
 	 			seatPart += seat.charAt(i);
 	 			} else if (i > 0 && seat.charAt(i) != ','){
 	 				seatPart += seat.charAt(i);
 	 			} else if (i > 0 && seat.charAt(i) == ',') {
 	 				seatList.push(seatPart);
 	 				seatPart = "";
 	 			}
 	 		}
 	 		
 	 		var seatRowList = new Array();
 	 		var seatColList = new Array();
 	 		for(var j = 0; j < seatList.length; j++){
 	 			if(seatList[j].length == 2) {
 	 				seatRowList.push(seatList[j].charAt(0));
 	 				seatColList.push(seatList[j].charAt(1));
 	 			} else if (seatList[j].length == 3 ){
 	 				seatRowList.push(seatList[j].charAt(0));
 	 				seatColList.push(seatList[j].charAt(1) + seatList[j].charAt(2));
 	 			}
 	 		}
 			
 	 		var seatrow = "";
 	 		var seatcol = "";
 	 		
 	 		for(var k =0 ; k < seatRowList.length;k++){
 	 			seatrow += seatRowList[k];
 	 			seatcol += seatColList[k] + ',';
 	 		}
 	 		const lastperson = Number(adult) + Number(student);
 		if(seatRowList.length != lastperson){
 			alert("인원을 모두 선택후 예약해주세요");
 		} else {
 		$.ajax({
 			url: "${contextPath}/order/order.do",
 			type: "post",
 			dataType:"text",
 			data : {
			      id : id,
 			      movie_name : movie_name,
 			      company : company,
 			      theater_name : theater,
 			      theater_num : theater_num,
 			      time : time,
 			      seatrow : seatrow,
 			      seatcol : seatcol,
 			      price:price,
 			      adult: adult,
 			      bmimage : bmImage,
 			      movie_date : moive_date,
 			      student : student
 			    },  
 			success: function(data){       //성공시 data라는 변수에 리턴값이 매칭됨 오브젝트형으로 리턴시 개별 파싱해야됨
				console.log('성공');
 				location.href="/damovie/order/ordercomplete.do"; 
 			},complete: function(data){
 			},error: function (request, status, error) {
 			   alert("전부 선택해야 다음페이지로 넘어갈수있습니다.");
 			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			  
 			}
 		});
 		}
 		}
 	});
	
	
</script>
</body>
</html>