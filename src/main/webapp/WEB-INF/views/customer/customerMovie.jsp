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
<link href="${contextPath }/resources/css/customer/customerMovie.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
</head>
<body>
	<div class="mainDIV">
		<div class="movieCheckDIV">
			<div class="moviePoster">
				<table class="movieTable">
					<caption>영화 선택</caption>
					<tbody>
			        <tr class="selectMovie">
			          <td style="border:none;">
						<select name="movie" id="movie">
						  <c:forEach var="i" begin="0" end="${movieList.size() -1 }">
						  	<option value="${imageList[i] }" id="${movieList[i] }">${movieList[i] }</option>
						  </c:forEach>
						</select>
					  </td>
			        </tr>
			        <tr class="selectPoster">
			          <td><img id="movieImage" src=""/></td>
			        </tr>
			        <tr class="selectMovieName">
			          <td id="movieName"></td>
			        </tr>
			        </tbody>
				</table>
			</div>
			
			<div class="info">
				<table class="infoTable">
					<caption style="margin-bottom: 60px;">회사 정보</caption>
					<tbody>
				        <tr>
				          <td style="width: 150px;">회사 이름</td>
				          <c:if test="${company eq 'no' }">
				          <td><input type="text" id="company_input" Placeholder="예: 롯데시네마"/></td>
				          </c:if>
				          <c:if test="${company ne 'no' }">
				          <td><input type="button" id="company_input" value="${company }"/></td>
				          </c:if>
				        </tr>
				        <tr>
				          <td style="width: 150px;">극장 이름</td>
				          <td><input type="text" id="theatername_input" Placeholder="예: 청량리롯데시네마"/></td>
				        </tr>
				        <tr>
				          <td style="width: 150px;">영화관 번호</td>
				          <td>
					        <select name="theater_num" class="theater_numcheck">
							  <option value="1" selected="selected">1</option>
							  <c:forEach var="i" begin="2" end="50">
								  <option value="${i }">${i }</option>
							  </c:forEach>
							</select>
				          </td>
				        </tr>
				        <tr>
				          <td colspan="2" style="border:none;text-align: center;"><button id="movieSave">저장하기</button></td>
				        </tr>
			        </tbody>
				</table>
				<input type="hidden" name="id" id="userid" value="${member.getId() }"/>
			</div>
		</div>
	</div>
<script>
$('#movie').change(function(){
	$('#movieName').html($('#movie option:checked').text());
	$('#movieImage').attr("src","/damovie//resources/images/movie/" + $(this).val());
});



 $('#movieSave').click(function() {

	 const company = $('#company_input').val();
	 const theater_name = $('#theatername_input').val();
	 const theater_num = $('.theater_numcheck option:checked').val();
	 const movie_name = $('#movieName').text();
	 const id = $('#userid').val();
	 
	if(company != null || company != "" ||
			theater_name != null || theater_name != "" ||
			theater_num != null || theater_num != "" ||
			movie_name != null || movie_name != "" || id != null || id != ""
	) {
		$.ajax({
 			url: "${contextPath}/customer/addmovie.do",
 			type: "post",
 			dataType:"text",
 			data : {
 				  id : id,
 				  company : company,
 			      theater_name : theater_name,
 			      theater_num : theater_num,
 			     movie_name : movie_name
 			    },  
 			success: function(data){       //성공시 data라는 변수에 리턴값이 매칭됨 오브젝트형으로 리턴시 개별 파싱해야됨
				alert(data);
				location.href="${contextPath}/customer/customer.do";
 			},complete: function(data){
 			},error: function (request, status, error) {
 			   alert("전부 선택해야 다음페이지로 넘어갈수있습니다.");
 			  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			  
 			}
 		});
	} else {
		alert('데이터를 전부 써 주신후 저장해주세요!!');
	}
 });
</script>
</body>
</html>