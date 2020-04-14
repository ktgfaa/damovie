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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/61cd314508.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">
body {
	font-family: "Nanum Pen Script", cursive;
	font-size : 23px;
}
#outBox {
	width: 1000px;
 	height: 600px;
    float: left;
    margin-left: 465px;
    margin-top: 50px;
    background-color: #00000059;
}
table, th, td, tr{
border: 1px solid white;
}
table, tr, td, th, caption{
	text-align:center;
	color: white;
}
table{
margin-left: 114px;
    margin-top: 80px;
}
caption{
    font-size: 50px;
}
th:nth-child(1){
	width:250px;
}
th:nth-child(2){
	width:400px;
}
th:nth-child(3){
	width:50px;
}
th:nth-child(4){
	width:30px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function del_movie(movie_name){
		var form = document.createElement("form");
		form.setAttribute("method","post");
		form.setAttribute("action","${contextPath }/customer/movieDelete.do");
		
		var input = document.createElement("input");
		input.setAttribute("type","hidden");
		input.setAttribute("name","del_movie");
		input.setAttribute("value",movie_name);
		
		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
	} 
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="outBox">
	<form name="theater_select" id="select" method="post" action="${contextPath }/customer/check_customerMovie.do">
		<select name="searchOption">
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}" />>전체</option>
			<option value="id" <c:out value="${map.searchOption == 'id'?'selected':''}" />>아이디</option>
			<option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}" />>이름</option>
			<option value="user_level" <c:out value="${map.searchOption == 'user_level'?'selected':''}" />>등급</option>
		</select>
		<input name="keyword" value="${map.keyword }">
		<input type="submit" value="조회">
	</form>


	<table>
		<caption>${company }  영화 리스트</caption>
		<tr>
			<th>극장</th>
			<th>영화제목</th>
			<th>상영관</th>
			<th>삭제</th>
		</tr>
 		<c:forEach var="movie" items="${movieList}">
			<tr>
				<td>${movie.theater_name }</td>
				<td>${movie.movie_name }</td>
				<td>${movie.theater_num }관</td>
 				<td><input type="button" id="del_btn" value="삭제" onClick="del_movie('${movie.movie_name}')"></td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>