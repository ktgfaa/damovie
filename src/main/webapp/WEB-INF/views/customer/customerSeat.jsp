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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="${contextPath }/resources/css/customer/customerSeat.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean"
	rel="stylesheet">
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
					<table style="border: 1px solid;float:right;">
						<caption>좌석 최대 값 선택</caption>
						<tbody>
							<tr>
								<td style="width: 150px;">열 최대값</td>
								<td style="width: 150px;">행 최대값</td>
								<td style="width: 150px;" rowspan="2"><button id="call_SEAT">불러오기</button></td>

							</tr>
							<tr>
								<td><select name="company" class="companycheck">
									<c:forEach var="Alphabet" items="${Alphabet }">
											<option value="${Alphabet }"  id="${Alphabet }">${Alphabet }</option>
									</c:forEach>
									</select></td>
								<td><select name="theater_name" class="theater_namecheck">
									<c:forEach var="i" begin="1" end="25">
											<option value="${i }" >${i }</option>
									</c:forEach>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					
				</div>
			</div>
			<div class="btnDIV">
				
			</div>
		</div>
	</div>
</body>
</html>