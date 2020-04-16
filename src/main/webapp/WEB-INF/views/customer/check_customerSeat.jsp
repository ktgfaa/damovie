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
								<td style="width: 150px;" rowspan="2"><button id="call_SEAT">불러오기</button></td>

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
			</div>
			<div class="seat_ConfirmDIV">
				<div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>