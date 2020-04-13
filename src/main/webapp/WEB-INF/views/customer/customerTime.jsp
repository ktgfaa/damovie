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
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="${contextPath }/resources/css/customer/customerTime.css"
	rel="stylesheet" type="text/css">
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
							<td><select name="theater_num" class="theater_numcheck">
									<option value="1" selected="selected">1</option>
							</select></td>
						</tr>
						<tr>
							<td style="width: 150px;">극장 이름</td>
							<td><select name="theater_num" class="theater_numcheck">
									<option value="1" selected="selected">1</option>
							</select></td>
						</tr>
						<tr>
							<td style="width: 150px;">영화관 번호</td>
							<td><select name="theater_num" class="theater_numcheck">
									<option value="1" selected="selected">1</option>
									<c:forEach var="i" begin="2" end="50">
										<option value="${i }">${i }</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td style="width: 150px;">날짜</td>
							<td><select name="theater_num" class="theater_numcheck">
									<option value="1" selected="selected">1</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="2" style="border: none; text-align: center;"><button
									id="movieSave">저장하기</button></td>
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
							<td><input type="text" placeholder="08:00 꼭 이렇게 적어주세요"/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간2</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간3</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간4</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간5</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간6</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간7</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간8</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간9</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
						<tr>
							<td style="width: 150px;">시간10</td>
							<td><input type="text" placeholder=""/></td>
						</tr>
					</tbody>
				</table>
			</div>


			<input type="hidden" name="id" id="userid" value="${member.getId() }" />
		</div>
	</div>
	<script>
		/* $('#movie').change(function(){
		 $('#movieName').html($('#movie option:checked').text());
		 $('#movieImage').attr("src","/damovie//resources/images/movie/" + $(this).val());
		 }); */

		/*  $('#movieSave').click(function() {

		 const company = $('#company_input').val();
		 const theater_name = $('#theatername_input').val();
		 const theater_num = $('.theater_numcheck option:checked').val();
		 const movie_name = $('#movieName').text();
		 const id = $('#userid').val();
		
		 if(company != null || company != "" ||
		 theater_name != null || theater_name != "" ||
		 theater_num != null || theater_num != "" ||
		 movie_name != null || movie_name != "" || id != null || id != ""
		 ) {
		 $.ajax({
		 url: "${contextPath}/customer/addmovie.do",
		 type: "post",
		 dataType:"text",
		 data : {
		 id : id,
		 company : company,
		 theater_name : theater_name,
		 theater_num : theater_num,
		 movie_name : movie_name
		 },  
		 success: function(data){       //성공시 data라는 변수에 리턴값이 매칭됨 오브젝트형으로 리턴시 개별 파싱해야됨
		 alert(data);
		 location.href="${contextPath}/customer/customer.do";
		 },complete: function(data){
		 },error: function (request, status, error) {
		 alert("전부 선택해야 다음페이지로 넘어갈수있습니다.");
		 console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		
		 }
		 });
		 } else {
		 alert('데이터를 전부 써 주신후 저장해주세요!!');
		 }
		 }); */
	</script>
</body>
</html>