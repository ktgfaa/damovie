<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<link href="${contextPath }/resources/css/member/memberDeleteForm.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		var sessionPwd = '<%=session.getAttribute("pwd") %>';

		$("#input").keyup(function(){
			if($("#pwd") != ""){
				$("#delete").removeAttr("disabled");
				$("#false").hide();
			}
		});
		
		
		$(".button").hover(function(){
			$(this).css("background-color","rgba(54,45,68,0.7)");
		},function(){
			$(this).css("background","none");
		});
		
		
		$("#cancel").click(function(){
			location.href="/damovie/mypage.do";
		});
		
		
		$("#delete").click(function(){
			if(confirm("정말 탈퇴하시겠습니까?") == false){
				return;
			}
		});
	});
</script>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<div id="main_Form">
		<div class="main_box">
			<div id="delete_box">
				<form id="input" name="deleteForm" method="post"
					action="${contextPath }/member/memberDelete.do">
					<table id="pwd_Box">
						<tr>
							<td>비밀번호확인</td>
						</tr>
						<tr>
							<td><input type="password" name="pwd" id="pwd"></td>
						</tr>
					</table>
					<input type="button" value="취소" id="cancel" class="button"> 
					<input type="submit" value="탈퇴" id="delete" class="button" disabled>
				</form>
				<div id="false">
					<c:if test="${msg == false}">
						<p>잘못된 비밀번호입니다.</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>