<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<c:if test="${idresult != null }">
	<c:if test="${idresult eq false }">
		<script>
			window.onload=function() {
				console.log("${userid != null}");
				console.log("${idcheckresult}");
				alert('중복된 아이디 입니다.');
			}
		</script>
	</c:if>
	<c:if test="${idresult eq true }">
		<script>
			window.onload=function() {
				console.log("${userid != null}");
				console.log("${idcheckresult}");
				alert('사용 가능한 아이디 입니다.');
			}
		</script>
	</c:if>
</c:if>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean"
	rel="stylesheet">
<meta charset="UTF-8">
<title>회원 가입 창</title>
<style>
.memberForm {
	width: 1980px;
	height: 700px;
}

.text_center {
	text-align: center;
	color: white;
	margin-left: 26.5%;
	width: 43%;
	
}

.memberBox {
	height: 70%;
	margin-left: 25.5%;
}

.memberBox p {
	color: white;
}

.memberButton input {
	height: 40px;
	border-radius: 10px;
	margin-right: 10px;
}

#pwdcheck {
	color : red;
}
</style>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
</head>
<body>
	<form class="memberForm" name="member_form" id="member_form" method="post"
		action="${contextPath }/member/addMember.do" onsubmit="return sendIt();">
		<h1 class="text_center">회원 가입 </h1>
		<table class="memberBox" style="text-align:center;">
			<tr>
				<td width="200"><p align="right">아이디</p></td>
				<td width="400"><input type="text" name="id" id="textid" /></td>
				<td width="100"><input type="button" id="idcheck" onclick="idCheck()"  value="중복 확인" /></td>
			</tr>
			<tr>
				<td width="200"><p align="right">비밀번호</p></td>
				<td width="400" ><input type="password" name="pwd" id="pwd" /></td>
			</tr>
			<tr>
				<td width="200"><p align="right">비밀번호 확인</p></td>
				<td width="400"><input type="password" name="pwdcheck" id="pwdc" /></td>
				<td width="250"><p id="pwdcheck">비밀번호가 일치하지 않습니다</p></td>
			</tr>
			<tr>
				<td width="200"><p align="right">이름</p></td>
				<td width="400"><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">이메일</p></td>
				<td width="400"><input type="text" name="email" id="email"></td>
			</tr>
			<tr class="memberButton">
				<td width="100"><p>&nbsp;</p></td>
				<td width="500"><input type="submit" value="가입하기"> 
				<input type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
</body>
<script>
$( document ).ready(function() {
	console.log("${userid}");
	$("#pwd").keyup(function() {
	    const pwd = $(this).val();
	    const pwdc = $("#pwdc").val()
	    const pwdcheck = $("#pwdcheck");
	    if(pwd == pwdc) {
	    	pwdcheck.text('비밀번호가 일치합니다');
	    	pwdcheck.css('color','blue');
	    } else {
	    	pwdcheck.text('비밀번호가 일치하지 않습니다.');
	    	pwdcheck.css('color','red');
	    }
	})
		$("#pwdc").keyup(function() {
	    const pwd = $(this).val();
	    const pwdc = $("#pwd").val()
	    const pwdcheck = $("#pwdcheck");
	    if(pwd == pwdc) {
	    	pwdcheck.text('비밀번호가 일치합니다');
	    	pwdcheck.css('color','blue');
	    }  else {
	    	pwdcheck.text('비밀번호가 일치하지 않습니다.');
	    	pwdcheck.css('color','red');
	    }
	})
	

	
})

function sendIt() {
	var ck_pwd = $("#pwd").val();
	var ck_email = $("#email").val();
	var regexPwd =/^.*(?=^.{4,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var pwd_check = regexPwd.test(ck_pwd);
	var e;
		
	try{
		if(pwd_check == false){
			alert("비밀번호는 4~12자 영문,숫자,특수문자 조합으로 이루어져야 합니다.");
			document.member_form.pwd.focus();
			document.member_form.pwd.select();
			return false;
		}

		if (document.member_form.name.value == "") {
			alert("이름을 입력하지 않았습니다.");
			document.name.focus();
			return false;
		}
		if (document.member_form.email.value == "") {
			alert("이메일을 입력하지 않았습니다.");
			document.email.focus();
			return false;
		}
		
		var regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email_check = regex.test(ck_email);
		if (email_check == false) {
			alert("잘못된 이메일 형식입니다.");
			document.member_form.email.value = "";
			document.member_form.email.focus();
			return false;
		}
		alert('회원가입이 완료되었습니다.');
		return true;
	}catch(e){
		return false;
	}
	

	document.member_form.submit();
}

</script>
        <script type="text/javascript">
		function idCheck(){

			var id = $("#textid").val(); 
			
			if(id == '' || id == null) {
		    	alert('아이디를 입력후 다시 시도해주세요');
		    	console.log("1 : ${idcheckresult}");
			} else {
				location.href="idcheck.do?id="+id;
			}
		}
		
	</script>
</html>