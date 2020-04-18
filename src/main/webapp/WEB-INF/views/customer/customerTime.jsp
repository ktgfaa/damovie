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
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="${contextPath }/resources/css/customer/customerTime.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body>
	<div class="mainDIV">
		<div class="theaterCheckDIV">
			<div class="info">
				<table class="infoTable">
					<caption style="margin-bottom: 60px;">극장 선택</caption>
					<tbody>
						<tr>
							<td style="width: 150px;">회사 이름</td>
							<td><select name="company" class="companycheck">
							<c:set var="company" value="${company }"></c:set>
									<option value="${company }" selected="selected" id="company">${company }</option>
							</select></td>
						</tr>
						<tr>
							<td style="width: 150px;">극장 이름</td>
							<td><select name="theater_name" class="theater_namecheck">
								<option  selected="selected" disabled="disabled" >극장 선택</option>
							<c:forEach var="theater" items="${theater_name }">	
								<c:if test="${theater_name_selected eq theater }">
									<option value="${theater }" selected="selected" >${theater }</option>
								</c:if>
								<c:if test="${theater_name_selected ne theater }">
									<option value="${theater }" >${theater }</option>
								</c:if>
							</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td style="width: 150px;">영화관 번호</td>
							<td><select name="theater_num" class="theater_numcheck">
									<c:forEach var="theaterNum" items="${theater_num }">
										<c:if test="${theater_name_selected eq '이미 시간이 업데이트된 영화관은 관리페이지에서 수정해주세요' }">
											<option value="${theater_name_selected }" >${theater_name_selected }</option>
										</c:if>
										<c:if test="${theater_name_selected ne '이미 시간이 업데이트된 영화관은 관리페이지에서 수정해주세요' }">
											<option value="${theaterNum }">${theaterNum }</option>
										</c:if>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td style="width: 150px;">날짜</td>
							<td><select name="datatime" class="movie_datecheck">
									<c:forEach var="datatime" items="${datatime }">
										<option value="${datatime }">${datatime }</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td colspan="2" style="border: none; text-align: center;"><button
									id="theaterSave">저장하기</button></td>
						</tr>
					</tbody>
				</table>
			</div>



			<div class="info">
				<table class="infoTable">
					<caption style="margin-bottom: 60px;">시간 쓰기</caption>
					<tbody>
						<tr>
							<td style="width: 150px;">시간1</td>
							<td><input type="text" placeholder="08:00 꼭 이렇게 적어주세요" id="time1"/></td>
						</tr>
						<c:forEach var="i" begin="2" end="10">
							<tr>
								<td style="width: 150px;">시간${i }</td>
								<td><input type="text" id="time${i }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>


			<input type="hidden" name="id" id="userid" value="${member.getId() }" />
		</div>
	</div>
	<script>
	
		$('.theater_namecheck').change(function(){
			 const company = $('.companycheck option:checked').val();
			 const theater_name = $('.theater_namecheck option:checked').val();
			 
	  			$.ajax({
		 			url: "${contextPath}/customer/customerTimeValue.do",
		 			type: "post",
		 			dataType:"text",
		 			data : {
		 					company : company,
		 					theater_name : theater_name
		 			    },  
		 			success: function(data){     
		 			location.href="/damovie/customer/customerTime.do";
		 			},complete: function(data){
		 			},error: function (request, status, error) {
		 			   alert("다시 시도해주세요!");
		 			  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 			  
		 			}
		 		}); 
		});

		$('#theaterSave').click(function() {

		 const company = $('.companycheck option:checked').val();
		 const theater_name = $('.theater_namecheck option:checked').val();
		 const theater_num = $('.theater_numcheck option:checked').val();
		 const movie_date = $('.movie_datecheck option:checked').val();
		 const time1 = $('#time1').val();
		 const time2 = $('#time2').val();
		 const time3 = $('#time3').val();
		 const time4 = $('#time4').val();
		 const time5 = $('#time5').val();
		 const time6 = $('#time6').val();
		 const time7 = $('#time7').val();
		 const time8 = $('#time8').val();
		 const time9 = $('#time9').val();
		 const time10 = $('#time10').val();
		 const id = $('#userid').val();
		 
		
		 if(company != null || company != "" ||
		 theater_name != null || theater_name != "" ||
		 theater_num != null || theater_num != "" ||
		 movie_date != null || movie_date != "" || id != null || id != "" && time1 != null
		 ) {
		 $.ajax({
		 url: "${contextPath}/customer/addtheater.do",
		 type: "post",
		 dataType:"text",
		 data : {
		 id : id,
		 company : company,
		 theater_name : theater_name,
		 theater_num : theater_num,
		 movie_date : movie_date,
		 time1 : time1,
		 time2 : time2,
		 time3 : time3,
		 time4 : time4,
		 time5 : time5,
		 time6 : time6,
		 time7 : time7,
		 time8 : time8,
		 time9 : time9,
		 time10 : time10
		 },  
		 success: function(data){       //성공시 data라는 변수에 리턴값이 매칭됨 오브젝트형으로 리턴시 개별 파싱해야됨
		 alert("저장 성공!!");
		 location.href="${contextPath}/customer/customer.do";
		 },complete: function(data){
		 },error: function (request, status, error) {
		 alert("전부 선택해야 다음페이지로 넘어갈수있습니다.");
		 console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		
		 }
		 });
		 } else if (time1 == null && time2 == null && time3 == null &&
				 time4 == null && time5 == null && time6 == null &&
				 time7 == null && time8 == null && time9 == null &&
				 time10 == null
		 ){
			 alert('시간대를 써주신후 저장해주세요!');
		 } 
		 
		 else {
			 alert('극장 정보를 선택 주신후 저장해주세요!!');
		 }
		 });
	</script>
</body>
</html>