<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<style>
	.top {
	height: 270px;
}

.bmImage {
	float: left;
    width: 256px;
    height: 338px;
    border: 1px solid;
    border-color: white;
    border-right: none;
}
.bookForm {
	height: 637px;
}
.firstBook {
	text-align: center;
    padding: 6%;
    padding-top: 4%;
}

caption {
	border: 1px solid;
    border-color: white;
    color: white;
    font-size: 20px;
}
.ResTable {
	height: 312px;
}

.movieSel {
	margin-top: 20px;
}

.ResTable > tbody > tr > td {
	color : white;
	border-right : 1px solid;
	border-bottom : 1px solid;
	border-color : white;
	    width: 200px;
    text-align: center;
}

.ResList {
	background-color: #80808066;
}

.ResComBtnUl {
    margin: 0;
    padding: 0;
    margin-left: 715px;
    margin-top: 45px;
}

strong {
	    color: white;
    font-size: 50px;
    margin-left: 140px;
}

.ResComBtnUl > li {
	list-style: none;
    float: left;
    margin-right: 100px;
}

.ResComBtnUl > li > a> button {
	    width: 100px;
    height: 50px;
    border-radius: 10px 10px 10px 10px;
    background-color: black;
    color: white;
}

.ResComBtnUl > li > a>  button:hover {
	background-color: #aef7172b;
	cursor : pointer;
}
</style>
</head>
<body>

	<div class="bookForm">
		<div class="firstBook">
			<!--------------------------------------------------- 예매 확인 내용 ------------------------------------------------------------- -->
			<strong>예약이 완료되었습니다</strong>
			<div class="movieSel">
				<img class="bmImage"src="${order.getBmimage() }"  />
				<table class="ResTable">
			      <caption>예약 확인</caption>
			      <tbody>
			        <tr>
			          <td class="ResList">영화</td>
			          <td style="color: #d6f71f;">${order.getMovie_name() }</td>
			          <td class="ResList">회사</td>
			          <td style="color: #d6f71f;">${order.getCompany() }</td>
			          <td class="ResList">극장</td>
			          <td style="color: #d6f71f;">${order.getTheater_name() }</td>
			          <td class="ResList">영화관</td>
			          <td style="color: #d6f71f;">${order.getTheater_num() }</td>
			        </tr>
			        <tr>
			          <td class="ResList">날짜</td>
			          <td style="color: #d6f71f;">${order.getMovie_date() }</td>
			          <td class="ResList">시간</td>
			          <td style="color: #d6f71f;">${order.getTime() }</td>
			          <td class="ResList">성인</td>
			          <td style="color: #d6f71f;">${order.getAdult() }</td>
			          <td class="ResList">학생</td>
			          <td style="color: #d6f71f;">${order.getStudent() }</td>
			        </tr>
			        <tr>
			          <td class="ResList">금액</td>
			          <td style="color: #d6f71f;">${order.getPrice() }</td>
			          <td class="ResList">좌석 행</td>
			          <td style="color: #d6f71f;">${order.getSeatrow() }</td>
			          <td class="ResList">좌석 열</td>
			          <td style="color: #d6f71f;">${order.getSeatcol()}</td>
			          <td></td>
			          <td></td>
			        </tr>
			      </tbody>
			    </table>
			
			</div>
			<ul class="ResComBtnUl">
				<li><a href="${contextPath }/main.do"><button>홈으로</button></a></li>
				<li><a href="${contextPath }/member/checkMyBook.do"><button>예매내역 확인</button></a></li>
			</ul>
		</div>
	</div>

</body>
</html>