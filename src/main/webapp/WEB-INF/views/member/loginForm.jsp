<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="result" value="${param.result }"></c:set>
<c:set var="emailMessage" value="${param.emailMessage }"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<c:choose>
	<c:when test="${result == 'loginFailed' }">
		<script>
			window.onload=function() {
				alert("아이디나 비밀번호가 틀립니다. 다시 로그인 하세요!!!");
			}
		</script>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${emailMessage == 'true'}">
	<script>
	window.onload=function() {
		alert('이메일 보내기 성공했습니다');
	}
	</script>
	</c:when>
</c:choose>
<c:choose>
		<c:when test="${emailMessage == 'false'}">
	<script>
	window.onload=function() {
		alert('이메일 보내기 실패했습니다');
	}
	</script>
	</c:when>
	</c:choose>
<meta charset="UTF-8">
<title>로그인 창</title>
<style>
.loginForm {
	height: 100%;
}

.loginBox {
	width: 1980px;
	height: 100%;
}

}
#leftBox {
	border-right: none;
}

.login {
	height: 100%;
	padding: 0px;
}

.login>table {
	height: 600px;
	margin-left: 532px;
	width: 860px;
	top: 29px;
	position: absolute;
}

.loginInput>td>input {
	width: 50%;
	height: 50px;
}

#button>input {
	width: 20%;
	float: left;
	border-radius: 10px;
}

#lbutton {
	margin-left: 25%;
}

#rbutton {
	margin-left: 10%;
}

#searcha {
	padding-left: 29%;
}

.searchbox {
	height: 10px;
}

#search>a {
	color: white;
	float: left;
	width: 20%;
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="loginForm">
		<div class="loginBox">
			<form class="login" name="frmLogin" method="post" action="${contextPath }/member/login.do">
		<table width="80%" align="center">
			<tr align="center" class="loginInput">
				<td>
					<input type="text" name="id" value="" placeholder="아이디" />
				</td>
			</tr>
			<tr align="center" class="loginInput">
				<td>
					<input type="password" name="pwd" value="" placeholder="비밀번호" />
				</td>
			</tr>
			<tr align="center" class="searchbox">
				<td id="search">
					<a id="searcha" href="/damovie/member/idsearchForm.do">id 찾기</a>
					<a href="/damovie/member/pwdsearchForm.do">pw 찾기</a>
				</td>
			</tr>
			<tr align="center" class="loginInput">
				<td id="button">
					<input id="lbutton" type="submit" value="로그인"/>
					<input id="rbutton" type="button" onClick="location.href='http://localhost:8080/damovie/member/memberForm.do'"  value="회원가입"/>
				</td>
			</tr>
		</table>
	</form>
		</div>
	</div>

</body>
</html>