<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="${contextPath }/resources/css/customer/customerSeat.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
<script src='${path}/damovie/resources/js/daygrid_main.js'></script>
<script src='${path}/damovie/resources/js/daygrid_main.js'></script>
<script src='${path}/damovie/resources/js/daygrid_main.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="mainDIV_SEAT">
		<div class="subDIV_SEAT">
			<div class="seatDIV">
				<div class="seat">
					<table style="border: 1px solid;">
						<caption>극장 선택</caption>
						<tbody>
							<tr>
								<td style="width: 150px;">회사 이름</td>
								<td style="width: 150px;">극장 이름</td>
								<td style="width: 150px;">영화관 번호</td>

							</tr>
							<tr>
								<td><select name="company" class="companycheck">
									<c:set var="company" value="${company }"></c:set>
											<option value="${company }" selected="selected" id="company">${company }</option>
									</select></td>
								<td><select name="theater_name" class="theater_namecheck">
									<c:forEach var="theater" items="${theater_name }">
											<option value="${theater }" >${theater }</option>
									</c:forEach>
								</select></td>
								<td><select name="theater_num" class="theater_numcheck">
										<c:forEach var="theaterNum" items="${theater_num }">
											<option value="${theaterNum }">${theaterNum }</option>
										</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>
					<table style="border: 1px solid;">
						<caption>좌석 최대 값 선택</caption>
						<tbody>
							<tr>
								<td style="width: 150px;">열 최대값</td>
								<td style="width: 150px;">행 최대값</td>
								<td style="width: 150px;" rowspan="2"><button id="call_SEAT">불러오기</button></td>
								<td style="width:150px;" rowspan="2"><button id="save_SEAT">저장하기</button></td>

							</tr>
							<tr>
								<td><select name="company" class="seatRow_check">
									<c:forEach var="Alphabet" items="${Alphabet }">
										<c:if test="${seatAlphabet ne Alphabet }">
											<option value="${Alphabet }"  id="${Alphabet }">${Alphabet }</option>
										</c:if>
										<c:if test="${seatAlphabet eq Alphabet }">
											<option value="${Alphabet }"  id="${Alphabet }" selected="selected">${Alphabet }</option>
										</c:if>
									</c:forEach>
									</select></td>
								<td><select name="theater_name" class="seatCol_check">
									<c:forEach var="i" begin="1" end="25">
										<c:if test="${seatCol ne i }">
											<option value="${i }" >${i }</option>
										</c:if>
										<c:if test="${seatCol eq i }">
											<option value="${i }" selected="selected" >${i }</option>
										</c:if>
									</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btnDIV">
				<ul class="seatAlphabet">
				<c:if test="${seatRow < 1 }">
				</c:if>
				<c:if test="${seatRow > 0 }">
					<c:forEach var="Alphabet" begin="0" end="${seatRow-1 }" items="${Alphabet }">
						<li><p>${Alphabet }</p></li>
					</c:forEach>
				</c:if>
				</ul>
				<ul class="seatNum">
					<c:forEach var="i" begin="1" end="${seatRow }">
						<li>
						<c:forEach var="j" begin="1" end="${seatCol }">
							<button class="seatCol_BTN" value="${j }">${j }</button>
						</c:forEach>
					</c:forEach>
				</ul>
				<ul class="seat_Explanation">
					<li><p>순서</p> : 극장선택 > 영화관 번호 선택 > 열 최대값 선택 > 행 최대값 선택 > 불러오기 > 안쓰는 좌석 체크 > 저장하기</li>
					<li><p>불러오기</p> : 선택한 행,열에 따른 좌석 불러오기</li>
					<li><p>좌석선택</p> : 사용하지 않는 좌석 만들기</li>
					<li><p>저장하기</p> : 저장</li>
					<li><p>팁</p> : A1번 좌석이 X체크 되어도 좌석예약 페이지에서 X표시로 자리를 차지하므로 상영관 배치에 맞게 체크해주세요</li>
				</ul>
			</div>
		</div>
	</div>
	<script>
		// 불러오기 클릭시 좌석 배치 구현
		$("#call_SEAT").click(function(){
			const seatRow = $(".seatRow_check option:checked").val();
			const seatCol = $(".seatCol_check option:checked").val();

			$.ajax({
	 			url: "${contextPath}/customer/customerSeatValue.do",
	 			type: "post",
	 			dataType:"text",
	 			data : {
						seatRow : seatRow,
						seatCol : seatCol
	 			    },  
	 			success: function(data){       //성공시 data라는 변수에 리턴값이 매칭됨 오브젝트형으로 리턴시 개별 파싱해야됨
	 				location.href="/damovie/customer/customerSeat.do"; 
	 			},complete: function(data){
	 			},error: function (request, status, error) {
	 			   alert("다시 시도해주세요!");
	 			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			  
	 			}
	 		});
		});
		
		// 좌석 클릭시 X표시 , 다시 클릭시 원상태로 복귀!!
		$(".seatCol_BTN").click(function(){ // 원상복귀
			
			if($(event.target).text() == "X") {
				$(event.target).html($(event.target).val());
				$(event.target).css("background","");
				$(event.target).css("color","");
			} else { // X 표시
				
				if($(event.target).text() < 10){ // 크기 같게 하기
					$(event.target).css("width","23.42");
					$(event.target).css("height","21");
				} else { // 크기 같게 하기
					$(event.target).css("width","30.83");
					$(event.target).css("height","21");
				}
			
				$(event.target).html("X");
				$(event.target).css("background","red");
				$(event.target).css("color","white");
				$(event.target).css("border","none");
				
			}
		});
	</script>
</body>
</html>