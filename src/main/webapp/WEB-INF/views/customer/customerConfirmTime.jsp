<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<c:if test="${company eq 'no'}">
		<script>
			window.onload=function() {
				alert("먼저 영화부터 등록후 선택해주세요!!!");
				location.href="customer.do";
			}
		</script>
	</c:if>
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="${contextPath }/resources/css/customer/customerConfirmTime.css?var=1" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean"
	rel="stylesheet">
<script>
function theaterCh(){
		var theaterName = ($(".theaterCheck option:selected").val());
		var form= document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action","customerConfirmTimeChange.do");
		
		var theater_name = document.createElement("input");
		theater_name.setAttribute("type", "hidden");
		theater_name.setAttribute("id", "theater_name");
		theater_name.setAttribute("name", "theater_name");
		theater_name.setAttribute("value", theaterName);
		
		form.appendChild(theater_name);
		document.body.appendChild(form);
		form.submit();
}

function fn_mod() {
	var movie_date = $(event.target).parent().parent().children('td').children('#movieDate').val();
	var theater_num = $(event.target).parent().parent().children('td').children('#theaterNum').val();
	var time_1 = $(event.target).parent().parent().children('td').children('#time1').val();
	var time_2 = $(event.target).parent().parent().children('td').children('#time2').val();
	var time_3 = $(event.target).parent().parent().children('td').children('#time3').val();
	var time_4 = $(event.target).parent().parent().children('td').children('#time4').val();
	var time_5 = $(event.target).parent().parent().children('td').children('#time5').val();
	var time_6 = $(event.target).parent().parent().children('td').children('#time6').val();
	var time_7 = $(event.target).parent().parent().children('td').children('#time7').val();
	var time_8 = $(event.target).parent().parent().children('td').children('#time8').val();
	var time_9 = $(event.target).parent().parent().children('td').children('#time9').val();
	var time_10 = $(event.target).parent().parent().children('td').children('#time10').val();

	
	var form= document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action","customerConfirmTimeMod.do");
	
	var company = document.createElement("input");
	company.setAttribute("type", "hidden");
	company.setAttribute("id", "company");
	company.setAttribute("name", "company");
	company.setAttribute("value", $('.logo > h1').text());
	
	var theaterName = document.createElement("input");
	theaterName.setAttribute("type", "hidden");
	theaterName.setAttribute("id", "theater_name");
	theaterName.setAttribute("name", "theater_name");
	theaterName.setAttribute("value", $(".theaterCheck option:selected").val()); 
	
	var movieDate = document.createElement("input");
	movieDate.setAttribute("type", "hidden");
	movieDate.setAttribute("id", "movie_date");
	movieDate.setAttribute("name", "movie_date");
	movieDate.setAttribute("value", movie_date);
	
	var theaterNum = document.createElement("input");
	theaterNum.setAttribute("type","hidden");
	theaterNum.setAttribute("id","theater_num");
	theaterNum.setAttribute("name","theater_num");
	theaterNum.setAttribute("value",theater_num);
	
	var time1 = document.createElement("input");
	time1.setAttribute("type","hidden");
	time1.setAttribute("id","time1");
	time1.setAttribute("name","time1");
	time1.setAttribute("value",time_1);
	
	var time2 = document.createElement("input");
	time2.setAttribute("type","hidden");
	time2.setAttribute("id","time2");
	time2.setAttribute("name","time2");
	time2.setAttribute("value",time_2);
	
	var time3 = document.createElement("input");
	time3.setAttribute("type","hidden");
	time3.setAttribute("id","time3");
	time3.setAttribute("name","time3");
	time3.setAttribute("value",time_3);
	
	var time4 = document.createElement("input");
	time4.setAttribute("type","hidden");
	time4.setAttribute("id","time4");
	time4.setAttribute("name","time4");
	time4.setAttribute("value",time_4);
	
	var time5 = document.createElement("input");
	time5.setAttribute("type","hidden");
	time5.setAttribute("id","time5");
	time5.setAttribute("name","time5");
	time5.setAttribute("value",time_5);
	
	var time6 = document.createElement("input");
	time6.setAttribute("type","hidden");
	time6.setAttribute("id","time6");
	time6.setAttribute("name","time6");
	time6.setAttribute("value",time_6);
	
	var time7 = document.createElement("input");
	time7.setAttribute("type","hidden");
	time7.setAttribute("id","time7");
	time7.setAttribute("name","time7");
	time7.setAttribute("value",time_7);
	
	var time8 = document.createElement("input");
	time8.setAttribute("type","hidden");
	time8.setAttribute("id","time8");
	time8.setAttribute("name","time8");
	time8.setAttribute("value",time_8);
	
	var time9 = document.createElement("input");
	time9.setAttribute("type","hidden");
	time9.setAttribute("id","time9");
	time9.setAttribute("name","time9");
	time9.setAttribute("value",time_9);
	
	var time10 = document.createElement("input");
	time10.setAttribute("type","hidden");
	time10.setAttribute("id","time10");
	time10.setAttribute("name","time10");
	time10.setAttribute("value",time_10);
	
	form.appendChild(company);
	form.appendChild(movieDate);
	form.appendChild(theaterName);
	form.appendChild(theaterNum);
	form.appendChild(time1);
	form.appendChild(time2);
	form.appendChild(time3);
	form.appendChild(time4);
	form.appendChild(time5);
	form.appendChild(time6);
	form.appendChild(time7);
	form.appendChild(time8);
	form.appendChild(time9);
	form.appendChild(time10);
	document.body.appendChild(form);
	form.submit();
}
function fn_del(movie_date, theater_num) {

	var form= document.createElement("form");
	form.setAttribute("method", "post");
	form.setAttribute("action","customerConfirmTimeDel.do");
	
	var theaterName = document.createElement("input");
	theaterName.setAttribute("type", "hidden");
	theaterName.setAttribute("id", "theater_name");
	theaterName.setAttribute("name", "theater_name");
	theaterName.setAttribute("value", $(".theaterCheck option:selected").val()); 
	
	var movieDate = document.createElement("input");
	movieDate.setAttribute("type", "hidden");
	movieDate.setAttribute("id", "movie_date");
	movieDate.setAttribute("name", "movie_date");
	movieDate.setAttribute("value", movie_date);
	
	var theaterNum = document.createElement("input");
	theaterNum.setAttribute("type","hidden");
	theaterNum.setAttribute("id","theater_num");
	theaterNum.setAttribute("name","theater_num");
	theaterNum.setAttribute("value",theater_num);
	
	form.appendChild(movieDate);
	form.appendChild(theaterName);
	form.appendChild(theaterNum);
	document.body.appendChild(form);
	form.submit();
}

</script>
<style>
.wrap {
    width: 1400px;
    height: 600px;
    float: left;
    margin-left: 265px;
    margin-top: 50px;
    background-color: #00000059;	
}
	.theaterCheck {
	width: 175px;
    height: 30px;
    margin-left: 90px;
    margin-right: 670px;
}
.modBtn{
	padding: 0;
    width: 45px;
    height: 33px;
	padding-left: 5px;
	border: none;
	background: rgba(0, 0, 0, 0);
	color: aqua;
	cursor: pointer;
}    
.delBtn {
	padding: 0;
    width: 45px;
    height: 33px;
	border: none;
	background-color: #0000009c;
	color: red;
	cursor: pointer;
}
#movieDate {
	width: 100px;
    height: 25px;
}
#theaterNum {
	width: 45px;
    height: 25px;
    text-align: center;
    
}
.time {
	border: none;
    width: 90px;
    padding: 0;
    text-align: center;
    height: 25px;
}

</style>
</head>
<body>
	<div class="mainDiv">
		<div class="wrap">
			<div class="logo">
				<h1>${company }</h1>
			</div>
			<div class="checkComp">
				<select class="theaterCheck" name="theater" id="theater" onchange="theaterCh()" >
					<option value="${theater_name }" selected=selected >${theater_name }</option>
					<c:forEach var="theaterNameList" items="${theaterNameList }">
									<option value="${theaterNameList }" >${theaterNameList }</option>
					</c:forEach>
				</select>
			</div>
			<div class="list">
				<table class="timeList">
					<tbody>
						<tr style="text-align:center">
							<td style="width: 150px; height: 50px; border:1px solid white;">날짜</td>
							<td style="width: 100px; border:1px solid white;">관</td>
							<td style="width: 100px; border:1px solid white;">시간1</td>
							<td style="width: 100px; border:1px solid white;">시간2</td>
							<td style="width: 100px; border:1px solid white;">시간3</td>
							<td style="width: 100px; border:1px solid white;">시간4</td>
							<td style="width: 100px; border:1px solid white;">시간5</td>
							<td style="width: 100px; border:1px solid white;">시간6</td>
							<td style="width: 100px; border:1px solid white;">시간7</td>
							<td style="width: 100px; border:1px solid white;">시간8</td>
							<td style="width: 100px; border:1px solid white;">시간9</td>
							<td style="width: 100px; border:1px solid white;">시간10</td>
							<td style="width: 70px; border:1px solid white;">수정</td>
							<td style="width: 70px; border:1px solid white;">삭제</td>
						</tr>
						
						<c:forEach var="theaterList" items="${theaterList }">
						<tr style="text-align:center">
							<td style="width: 150px; height: 50px; border:1px solid white;"><select name="movieDate" id="movieDate">
								<option value="${theaterList.movie_date }" selected=selected>${theaterList.movie_date }</option>
								<c:forEach var="datatime" items="${datatime }">
								<option value="${datatime }">${datatime }</option>
								</c:forEach>
								</select></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" name="theaterNum" id="theaterNum" readonly value="${theaterList.theater_num }" >
								
</td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time1" id="time1" value="${theaterList.time1 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time2" id="time2" value="${theaterList.time2 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time3" id="time3" value="${theaterList.time3 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time4" id="time4" value="${theaterList.time4 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time5" id="time5" value="${theaterList.time5 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time6" id="time6" value="${theaterList.time6 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time7" id="time7" value="${theaterList.time7 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time8" id="time8" value="${theaterList.time8 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time9" id="time9" value="${theaterList.time9 }"></td>
							<td style="width: 100px; border:1px solid white;"><input type="text" class="time" name="time10" id="time10" value="${theaterList.time10 }"></td>
							<td style="width: 70px; border:1px solid white;"><input type="button" class="modBtn" onClick="fn_mod()" value="수정" /></td>
							<td style="width: 70px; border:1px solid white;"><input type="button" class="delBtn" onClick="fn_del('${theaterList.movie_date }','${theaterList.theater_num }')" value="삭제" /></td>
						</tr>
						</c:forEach>
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>