    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
String session_id=(String)session.getAttribute("id");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/61cd314508.js" crossorigin="anonymous"></script>
<style type="text/css">
#side_bar{
	position: fixed;
    width: 174px;
    height: 245px;
    background: rgba(255,255,255,0.7);
}
#side_bar li:nth-child(1){
	margin-top:55px;
}
#side_bar li{
    list-style: none;
    margin-top: 25px;
    margin-left: -44px;
    text-align: center;
    cursor: pointer;
    font-size: 23px;
    font-weight: 600
}
#side_bar a:link { color: black; text-decoration: none;}
#side_bar a:visited { color: black; text-decoration: none;}
#side_bar a:hover { color: gray; text-decoration: none;}
</style>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<div id="side_bar">
		<ul>
			<li><a href="${contextPath }/customer/customer.do">메 인</a></li>
			<li><a href="${contextPath }/customer/customerUpdate.do">업데이트</a></li>
			<li><a href="${contextPath }/customer/customerConfirm.do">관리</a></li>
		</ul>
	</div>
</body>
</html>