<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>
<!-- MemberVO 파일 임포트하기 -->
<%@ page import="com.movie.damovie.member.vo.MemberVO" %>
<%@ page import="com.movie.damovie.member.dao.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath }/resources/css/member/memberUpdateView.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/v4-shims.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	//패스워드 일치 확인
	$(".alert-success").hide();
	$(".alert-danger").hide();
	$("#input").keyup(function(){
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		if(pwd != "" || pwd2 != ""){
			if(pwd == pwd2){
				$(".alert-success").show();
				$(".alert-danger").hide();
				$("#edit").removeAttr("disabled");
			}else{
				$(".alert-success").hide();
				$(".alert-danger").show();
				$("#edit").attr("disabled","disabled");
			}
		}
	});
		
		$(".button").hover(function(){
			$(this).css("background-color","rgba(54,45,68,0.7)");
		},function(){
			$(this).css("background","none");
		});
	
		$("#main").click(function(){
			location.href="/damovie/main.do";
		});
	
	
});
//유효성 검사
function sendIt(tag) {
	var ck_pwd = $("#pwd").val();
	var ck_email = $("#email").val();
	var e;
	var regexPwd =/^.*(?=^.{4,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var pwd_check = regexPwd.test(ck_pwd);
	
	try{

		if(pwd_check == false){
			alert("비밀번호는 4~12자 영문,숫자,특수문자 조합으로 이루어져야 합니다.");
			document.input.pwd.focus();
			document.input.pwd.select();
			return false;
		}

		if (document.input.email.value == "") {
			alert("이메일을 입력하지 않았습니다.");
			document.email.focus();
			return false;
		}
		
		var regex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var email_check = regex.test(ck_email);
		if (email_check == false) {
			alert("잘못된 이메일 형식입니다.");
			document.input.email.value = "";
			document.input.email.focus();
			return false;
		}
		alert('회원정보가 수정되었습니다.');
		return true;
	}catch(e){
		return false;
	}
</script>

<meta charset="UTF-8">
<title>개인정보 페이지</title>
</head>
<body>
	<div id="main_Form">
		<div class="main_box">
			<div class="info_box">
				<form id="input" name="input" method="post" action="${contextPath }/member/memberUpdate.do" onsubmit="return sendIt();">
				<table class="info_table">
					<tr>
						<td>아이디</td>
						<td><input id="id" name="id" type="text" value=${member.id } size="20" style="color:#BDBDBD" readonly/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input id="name" name="name" type="text" value=${member.name } size="20" style="color:#BDBDBD"style="color:black" readonly/></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pwd" id="pwd" class="form-control" placeholder="비밀번호 입력" style="color:white"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="reuserPwd" id="pwd2" class="form-control" placeholder="비밀번호 확인" style="color:white"></td>
					</tr>
					<tr class="alert-success">
						<td colspan="2"><input type="text" class="alert-success" id="success" value="비밀번호가 일치합니다" style="color:white" readonly></td>
					</tr>				
					<tr class="alert-danger">
						<td colspan="2"><input type="text" class="alert-danger" id="danger" value="비밀번호가 일치하지 않습니다." style="color:white" readonly></td>
					</tr>

					<tr>
						<td>이메일</td>
						<td><input id="email" type="text" name="email" value=${member.email } style="color:white"></td>
					</tr>
				</table>
				<div class="3_btn">
					<input type="reset" id="reset" class="button" value="리셋">
					<input type="submit" id="edit" class="button" value="회원정보수정" disabled>
					<input type="button" id="main" class="button" value="메인화면">
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>