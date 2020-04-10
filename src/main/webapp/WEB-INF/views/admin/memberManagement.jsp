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
<link href="${contextPath }/resources/css/admin/memberManagement.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/61cd314508.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
// 원하는 페이지로 이동시 검색조건, 키워드 값 유지
	function list(page){
		location.href="${contextPath}/admin/memberManagement.do?curPage="+page+"&searchOption-${map.searchOption}"+"keyword=${map.keyword}";
	}
 	function del_member(id){
		var form = document.createElement("form");
		form.setAttribute("method","post");
		form.setAttribute("action","${contextPath }/admin/memberDelete.do");
		
		var idInput = document.createElement("input");
		idInput.setAttribute("type","hidden");
		idInput.setAttribute("name","del_id");
		idInput.setAttribute("value",id);
		
		form.appendChild(idInput);
		document.body.appendChild(form);
		form.submit();
	} 
 	function levelSelect(value,id){
		var form = document.createElement("form");
		var selected = $("#member_level option:selected").val();
		
		form.setAttribute("method","post");
		form.setAttribute("action","${contextPath }/admin/memberLevel.do");
		
		var level = document.createElement("input");
		level.setAttribute("type","hidden");
		level.setAttribute("name","user_level");
		level.setAttribute("value",value);
		
		var mod_level_id = document.createElement("input");
		mod_level_id.setAttribute("type","hidden");
		mod_level_id.setAttribute("name","mod_level_id");
		mod_level_id.setAttribute("value",id);
		
		form.appendChild(level);
		form.appendChild(mod_level_id);
		document.body.appendChild(form);
		form.submit();
	} 
</script>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
</head>
<body>
<div id="main_box">
	
	<form name="search_form" id="search_form" method="post" action="${contextPath }/admin/memberManagement.do"><!--  -->
		<select name="searchOption">
			<option value="all" <c:out value="${map.searchOption == 'all'?'selected':''}" />>전체</option>
			<option value="id" <c:out value="${map.searchOption == 'id'?'selected':''}" />>아이디</option>
			<option value="name" <c:out value="${map.searchOption == 'name'?'selected':''}" />>이름</option>
			<option value="user_level" <c:out value="${map.searchOption == 'user_level'?'selected':''}" />>등급</option>
		</select>
		<input name="keyword" value="${map.keyword }">
		<input type="submit" value="조회">
	</form>
		
		<p id="list_cnt">총 ${map.count }명의 회원이 있습니다.</p>
		<table id="member_list">
			<caption>회원정보 관리</caption>
			<tr>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입날짜</th>
				<th>등급</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		<c:forEach var="member" items="${map.list }">
			<tr>
				<td>${member.id }</td>
				<td>${member.pwd }</td>
				<td>${member.name }</td>
				<td>${member.email }</td>
				<td><fmt:formatDate value="${member.joinDate }" pattern="yyyy-MM-dd"/></td>
				<td>${member.user_level }</td>
				<td><select name="level" id="member_level" onchange="levelSelect(this.value,'${member.id}')">
						<option value="">등급</option>
						<option value="user">유저</option>
						<option value="customer">서브관리자</option>
						<option value="admin">관리자</option>
					</select>
				</td>
 				<td><input type="button" id="del_btn" value="삭제" onClick="del_member('${member.id}')"></td>
			</tr>
		</c:forEach>

			<tr>
				<td colspan="8" align="center">
					<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면 [처음] 하이퍼링크 출력 -->
					<c:if test="${map.memberPage.curBlock > 1 }">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
					
					<!-- 이전페이지 블록으로 이동 : 현재 페이지 블록이 1보다 크면 [이전] 하이퍼링크를 화면에 출력 -->
					<c:if test="${map.memberPage.curBlock > 1 }">
						<a href="javascript:list('${map.memberPage.prevPage }')">[이전]</a>
					</c:if>
					
					<!-- 하나의 블록에서 반복문 수행 시작페이지에서 끝페이지 까지 -->
					<c:forEach var="num" begin="${map.memberPage.blockBegin }" end="${map.memberPage.blockEnd }">
						<c:choose>
							<c:when test="${num == map.memberPage.curPage }">
								<span style="color: red">${num }</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:list('${num }')">${num }</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
				
					<!-- 다음페이지 블록으로 이동 : 현재페이지 블록이 전체 페이지 블록보다 작거나 같으면 [다음] 출력 -->
					<c:if test="${map.memberPage.curBlock <= map.memberPage.totBlock }">
						<a href="javascript:list('${map.memberPage.nextPage }')">[다음]</a>
					</c:if>
				
					<!-- 끝 페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝] 출력 -->
					<c:if test="${map.memberPage.curPage <= map.memberPage.totPage }">
						<a href="javascript:list('${map.memberPage.totPage }')">[끝]</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>