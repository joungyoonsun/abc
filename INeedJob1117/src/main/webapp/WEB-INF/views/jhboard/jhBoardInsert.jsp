<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취업준비생 글쓰기</title>
</head>
<body>

	<form action="<c:url value='/jhBoard/insert'/>" method="post" enctype="multipart/form-data">
		<h1>취업준비생 글쓰기 폼</h1>
		%{message}
		<table border="1">
			<c:forEach var="jhBoard" items="${categoryList}">

			</c:forEach>
				<tr>
				<th>카테고리</th>
				<td><input type="hidden" value="${categoryId}" name="categoryId">${categoryName}
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${sessionScope.userId}
				<input type="hidden" name="userId" value="rhdmsquf01">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="jhBoardTitle" required>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="jhBoardContent" required>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
				<input type="file" name="file"></td>
			</tr>
		</table>
		<input type="submit" value="저 장"> <input type="reset" value="취 소">
	</form>
</body>
</html>