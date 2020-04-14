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
<link href="${contextPath }/resources/css/customer/customerConfirmTime.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean"
	rel="stylesheet">
</head>
<body>
	<div class="mainDiv">
		<div class="wrap">
			<div class="logo">
				<h1>롯데시네마</h1>
			</div>
			<div class="checkComp">
				<select class="companycheck" name="company" id="company" >
					<option value=""></option>
				</select>
				 <input type="submit" id="submit" value="수정하기">
				 <input type="button" id="delBtn" value="삭제하기">
			</div>
			<div class="list">
				<table>
					<tbody>
						<tr>
							<td>날짜</td>
							<td>관</td>
							<td>시간</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>