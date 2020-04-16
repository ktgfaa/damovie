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
<link href="${contextPath }/resources/css/customer/customerConfirmTime.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean"
	rel="stylesheet">
<script>
</script>
<style>
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
	text-decoration: underline;
}    
.delBtn {
	padding: 0;
    width: 45px;
    height: 33px;
	border: none;
	background-color: #0000009c;
	color: red;
	text-decoration: underline;
	cursor: pointer;
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
				<select class="theaterCheck" name="theater" id="theater" >
					<c:forEach var="theater_name" items="${theater_name }">
									<option value="${theater_name }" >${theater_name }</option>
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
							<td style="width: 150px; height: 50px; border:1px solid white;">${theaterList.movie_date }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.theater_num }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time1 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time2 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time3 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time4 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time5 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time6 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time7 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time8 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time9 }</td>
							<td style="width: 100px; border:1px solid white;">${theaterList.time10 }</td>
							<td style="width: 70px; border:1px solid white;"><input type="button" class="modBtn" onClick="fn_mod()" value="수정" /></td>
							<td style="width: 70px; border:1px solid white;"><input type="button" class="delBtn" onClick="fn_delete()" value="삭제" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>