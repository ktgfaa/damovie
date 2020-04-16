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
    background-color: rgba(0,0,0,0.7);
}
#select{
	margin: 25px 0 -40px 632px;
}
#select select{
	height:26px;
}
#select input:nth-child(2){
	width: 200px;
    height: 19px;
    padding-top: 3px;
}
#select input:nth-child(3){
    width: 50px;
    height: 27px;
}

table, tr, td, th, caption{
	text-align:center;
	color: white;
}
table, th, td, tr{
	border: 1px solid #F2F2F2;
	background: black;
	font-size:25px;
}
th{
	color:#8181F7;

}
table{
	margin-left: 114px;
    margin-top: 40px;
}
#list_box select{
	width: 250px;
    height: 24px;
    background: beige;
    margin-bottom: 4px;
}
caption{
    font-size: 50px;
    color:#DA81F5;
}
th:nth-child(1){
	width:250px;
}
th:nth-child(2){
	width:400px;
}
th:nth-child(3){
	width:55px;
}
th:nth-child(4){
	width:30px;
}
table a:link { 
	color: white; text-decoration: none;}{
}
table a:visited { 
	color: white; text-decoration: none;}{
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function list(page){
	location.href="${contextPath }/customer/check_customerMovie.do?curPage="+page+"&searchOption-${map.searchOption}"+"keyword=${map.keyword}";
}


	function del_movie(movie_name) {
		var form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", "${contextPath }/customer/movieDelete.do");

		var input = document.createElement("input");
		input.setAttribute("type", "hidden");
		input.setAttribute("name", "del_movie");
		input.setAttribute("value", movie_name);

		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
	}
	
	function movieSelect(value,t_name,t_num){
		var form = document.createElement("form");
		var selected = $("#sel_movie option:selected").val();
		
		form.setAttribute("method","post");
		form.setAttribute("action","${contextPath }/customer/movieUpdate.do");
		
		var movieName = document.createElement("input");
		movieName.setAttribute("type","hidden");
		movieName.setAttribute("name","movie_name");
		movieName.setAttribute("value",value);
		
		var theater_name = document.createElement("input");
		theater_name.setAttribute("type","hidden");
		theater_name.setAttribute("name","theater_name");
		theater_name.setAttribute("value",t_name);
		
		var theater_num = document.createElement("input");
		theater_num.setAttribute("type","hidden");
		theater_num.setAttribute("name","theater_num");
		theater_num.setAttribute("value",t_num);
		
		form.appendChild(movieName);
		form.appendChild(theater_name);
		form.appendChild(theater_num);
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
				<option value="theater_name" <c:out value="${map.searchOption == 'theater_name'?'selected':''}" />>영화관</option>
				<option value="movie_name" <c:out value="${map.searchOption == 'movie_name'?'selected':''}" />>영화제목</option>
		</select>
		<input name="keyword" value="${map.keyword }">
		<input type="submit" value="조회">
	</form>

	<table id="list_box">
		<caption>${company }  영화 리스트</caption>
		<tr>
			<th>극장</th>
			<th>영화제목</th>
			<th>상영관</th>
			<th>삭제</th>
		</tr>
 		<c:forEach var="movie" items="${map.list}">
			<tr>
				<td>${movie.theater_name }</td>
				<td>
					<select name="sel_movie" id="sel_movie" onchange="movieSelect(this.value,'${movie.theater_name}','${movie.theater_num}')">
						<option value="${movie.movie_name }" selected="selected">${movie.movie_name }</option>
						<c:forEach var="m_List" items="${map.movieList }">
							<option value="${m_List}">${m_List}</option>
						</c:forEach>
					</select>
				</td>
				<td>${movie.theater_num }관</td>
 				<td><input type="button" id="del_btn" value="삭제" onClick="del_movie('${movie.movie_name}')"></td>
			</tr>
		</c:forEach>
		<tr>
				<td colspan="4" align="center">
					<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면 [처음] 하이퍼링크 출력 -->
					<c:if test="${map.paging.curBlock > 1 }">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
					
					<!-- 이전페이지 블록으로 이동 : 현재 페이지 블록이 1보다 크면 [이전] 하이퍼링크를 화면에 출력 -->
					<c:if test="${map.paging.curBlock > 1 }">
						<a href="javascript:list('${map.paging.prevPage }')">[이전]</a>
					</c:if>
					
					<!-- 하나의 블록에서 반복문 수행 시작페이지에서 끝페이지 까지 -->
					<c:forEach var="num" begin="${map.paging.blockBegin }" end="${map.paging.blockEnd }">
						<c:choose>
							<c:when test="${num == map.paging.curPage }">
								<span style="color: red">${num }</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:list('${num }')">${num }</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
				
					<!-- 다음페이지 블록으로 이동 : 현재페이지 블록이 전체 페이지 블록보다 작거나 같으면 [다음] 출력 -->
					<c:if test="${map.paging.curBlock <= map.paging.totBlock }">
						<a href="javascript:list('${map.paging.nextPage }')">[다음]</a>
					</c:if>
				
					<!-- 끝 페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝] 출력 -->
					<c:if test="${map.paging.curPage <= map.paging.totPage }">
						<a href="javascript:list('${map.paging.totPage }')">[끝]</a>
					</c:if>
				</td>
			</tr>
	</table>
</div>
</body>
</html>