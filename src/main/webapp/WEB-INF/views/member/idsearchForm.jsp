<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="result" value="${param.result }"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 창</title>
<style>
	
	.emailBox {
		width : 1980px; 
		height: 700px;
}

		
	}
	
	#leftBox {
		border-right : none;
	}
	
	.email {
		height: 100%;
		padding: 0px;
	}
	
	.email > table {
		height: 100%;
		margin-left : 26%;
		width:45%;
	}
	
	.emailInput > td > input {
		width : 50%;
		height: 50px;
	}
	
	#button > input {
		width : 20%;
		float : left;
		border-radius: 10px;
	}
	
	#lbutton {
		margin-left: 25%;
	}
	
	#rbutton {
		margin-left : 10%;	
	}
	
	#searcha {
		padding-left : 29%;
	}
	.searchbox {
		height: 10px;
	}
	#search > a {
		color : white;
		float : left;
		width: 20%;
   		font-size: 20px;
	}
</style>
</head>
<body>
	<div class="idsearchForm">
		<div class="emailBox">
			<form class="email" name="frmidsearch" method="post" action="${contextPath }/member/sendMail.do">
		<table width="80%" align="center">
			<tr align="center" class="emailInput">
				<td>
					<input type="text" name="email" id="textEmail" value="" placeholder="가입때 쓴 이메일" />
				</td>
			</tr>
			<tr align="center" class="searchbox">
				<td id="search">
					<a id="searcha" href="/damovie/member/idsearchForm.do">id 찾기</a>
					<a href="/damovie/member/pwdsearchForm.do">pw 찾기</a>
				</td>
			</tr>
			<tr align="center" class="emailInput">
				<td id="button">
					<input id="lbutton" type="submit" value="이메일 보내기"/>
					<input id="rbutton" type="button" onClick="location.href='http://localhost:8080/damovie/member/memberForm.do'" value="회원가입"/>
				</td>
			</tr>
		</table>
	</form>
		</div>
	</div>
</body>
        <script type="text/javascript">
		function sendEmail(){

			var useremail = $("#textEmail").val(); 

			location.href="sendMail.do?useremail="+useremail;
		}
	</script>
</html>