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
<link href="${contextPath }/resources/css/customer/Check_customerSeat.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>좌석확인</title>
</head>
<body>
	<div class="checkSeatMain_div">
		<div class="checkSeatsub_div">
			<div class="select_seatDIV">
				<table style="border: 1px solid;">
						<caption>극장 선택</caption>
						<tbody>
							<tr>
								<td style="width: 150px;border-bottom: 1px solid white;">회사 이름</td>
								<td style="width: 150px;border-bottom: 1px solid white;">극장 이름</td>
								<td style="width: 150px;border-bottom: 1px solid white;">영화관 번호</td>
								<td style="width: 150px;" rowspan="2"><button id="call_SEAT" title="좌석 불러오기">불러오기</button></td>
								<td style="width:150px;" rowspan="2"><button id="save_SEAT" title="변경후 불러오기로 다시 불러와야 변경된 내용이 보입니다.">변경하기</button></td>

							</tr>
							<tr>
								<td><select name="company" class="companycheck">
									<c:set var="company" value="${company }"></c:set>
											<option value="${company }" selected="selected" id="company">${company }</option>
									</select></td>
								<td><select name="theater_name" class="theater_namecheck">
									<c:forEach var="theater" items="${theater_name }">
										<c:if test="${theater_name_confirm eq theater }">
											<option value="${theater }" selected="selected" >${theater }</option>
										</c:if>
										<c:if test="${theater_name_confirm != theater }">
											<option value="${theater }" >${theater }</option>
										</c:if>
									</c:forEach>
								</select></td>
								<td><select name="theater_num" class="theater_numcheck">
										<c:forEach var="theaterNum" items="${theater_num }">
										<c:if test="${theater_num_confirm eq theaterNum }">
											<option value="${theaterNum }" selected="selected">${theaterNum }</option>
										</c:if>
										<c:if test="${theater_num_confirm != theaterNum }">
											<option value="${theaterNum }">${theaterNum }</option>
										</c:if>
											
										</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>
			</div>
			<div class="seat_ConfirmDIV">
				<div class="seatRowDIV">
					<ul class="seatAlphabet">
						<c:if test="${seatRow_confirm eq 'no' }">
							<p style="color:white;    width: 500px;font-size: 50px;text-align: center;">저장된 좌석이 없습니다.</p>
						</c:if>
						<c:if test="${seatRow_confirm != 'no' }">
							<c:forEach var="seatRow" items="${seatRow_confirm }">
								<li class="Alphabet"><p>${seatRow }</p></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<div class="seatColDIV">
					<ul class="seatNum">
						<c:if test="${seatRow_confirm eq 'no' }">
						</c:if>
						<c:set var="num" value="0"/>
						<c:if test="${seatRow_confirm != 'no' }">
							<c:forEach var="i" begin="1" end="${seatRowSize }">
								<li>
								<c:forEach var="j" begin="1" end="${seatCol_confirm }">
									<c:if test="${seat_state_confirm.get(num) eq 'yes'}">
										<button class="seatCol_BTN" value="${j }" id="yes">${j }</button>
									</c:if>
									<c:if test="${seat_state_confirm.get(num) eq 'no'}">
										<button class="seatCol_BTN" value="${j }" id="no" style="background: red; color: white; border: none;">X</button>
									</c:if>
									<c:set var="num" value="${num+1 }"></c:set>
								</c:forEach>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
<script>



	// 불러오기 클릭시 선택된 값에 따라 좌석 불러오기
$("#call_SEAT").click(function(){
	const company = $(".companycheck option:checked").val();
	const theater_name = $(".theater_namecheck option:checked").val();
	const theater_num = $(".theater_numcheck option:checked").val();
	
	$.ajax({
			url: "${contextPath}/customer/customerSeatInfo.do",
			type: "post",
			dataType:"text",
			data : {
				company : company,
				theater_name : theater_name,
				theater_num : theater_num
			    },  
			success: function(data){ 
				location.href="/damovie/customer/check_customerSeat.do"; 
			},complete: function(data){
			},error: function (request, status, error) {
			   alert("다시 시도해주세요!");
			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			  
			}
		});
}); 
	
	// 좌석 클릭시 X표시 , 다시 클릭시 원상태로 복귀!!!
$(".seatCol_BTN").click(function(){ // 원상복귀
	
	if($(event.target).text() == "X") {
		$(event.target).html($(event.target).val());
		$(event.target).attr("id","yes");
		$(event.target).css("background","");
		$(event.target).css("color","");
	} else { // X 표시
	
		$(event.target).html("X");
		$(event.target).attr("id","no");
		$(event.target).css("background","red");
		$(event.target).css("color","white");
		$(event.target).css("border","none");
		
	}
});
	
	
	// 저장하기
$("#save_SEAT").click(function(){
	var alphabet = new Array("A", "B", "C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z");
	const company = $(".companycheck option:checked").val();
	const theater_name = $(".theater_namecheck option:checked").val();
	const theater_num = $(".theater_numcheck option:checked").val();
	
	// seatrow 구하기
	var seatrow = new Array();
	var size = $( '.Alphabet').length;
	for(var i =0;i<size;i++){
		seatrow.push(alphabet[i]);
	}
	//seatcol 구하기
	const seatcolsize = $('.seatCol_BTN').length / size;
	var seatcol = new Array();
	for(var i =0;i<seatcolsize;i++){
		seatcol.push($('.seatCol_BTN').eq( i ).val());
	}
	
	//seat_state 전부 List에 저장하기
	var seat_state = new Array();
	for(var i =0;i<seatcolsize * size;i++){
		seat_state.push($('.seatCol_BTN').eq( i ).attr("id"));
	}
	
	console.log("변경하기");
	
	// list를 ajax로 보내기 위해 필요한 셋팅
 	jQuery.ajaxSettings.traditional = true; 

		$.ajax({
			url: "${contextPath}/customer/seatUpdate.do",
			type: "post",
			dataType:"text",
			data : {
					seat_state : seat_state,
					company : company,
					theater_name : theater_name,
					theater_num : theater_num,
					seatrow : seatrow,
					seatcol : seatcol
			    },  
			success: function(data){     
				alert("변경 성공");
			location.href="/damovie/customer/customerConfirm.do";
			},complete: function(data){
			},error: function (request, status, error) {
			   alert("다시 시도해주세요!");
			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			  
			}
		}); 
}); 
</script>
</body>
</html>