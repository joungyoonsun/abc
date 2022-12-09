<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/user" />
<%@ taglib prefix="jk" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jobhunter Search</title>
</head>
<body>
	<h1>취업준비생 게시물 검색 목록</h1>
	%{message}
	<div class="row">
		<div class="col-1g-12">
	<%-- 	<form action="<c:url value='/jhBoard/search/1'/>" > --%>
	<c:url var="actionURL" value='/jhBoard/search/1'/>
	<form action="${actionURL}" id="searchForm">

				<select type="name">
					<option value="T">제목</option>		
					<!-- <option value="C">내용</option>
					<option value="U">작성자</option>  -->
				</select> 
				<input type="text" name="keyword">

				<input type="submit" value="<fmt:message key="SEARCH"/>"> 
			</form>
		</div>
	</div> 
	<table border="1">
		<tr>
			<th>jh_id</th>
			<th>user_id</th>
			<th>jh_board_title</th>
			<th>jh_insert_date</th>
			<th>jh_read_count</th>
		</tr>
		<c:forEach var="jhBoard" items="${jhBoardList}">
			<tr>
				<td>${jhBoard.jhId}</td>
				<td>${jhBoard.userId}</td>
				<td>${jhBoard.jhBoardTitle}</td>
				<td>${jhBoard.jhInsertDate}</td>
				<td>${jhBoard.jhReadCount}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>