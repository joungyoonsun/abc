<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취업준비생 게시글 업데이트</title>
</head>
<body>
<form action="<c:url value='/jhBoard/update'/>" method="post" enctype="multipart/form-data">

	<h1>취업준비생 게시글 수정폼</h1>
	%{message}
	<table border="1">
		
				<tr>
				<th>카테고리</th>
				<td><input type="hidden" value="${categoryId}" name="categoryId">${categoryName}
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${sessionScope.userId}
				<input type="hidden" name="userId" value="${sessionScope.userId}">
				<input type="hidden" name="jhId" value="${jhBoard.jhId}">
				</td>
			</tr>
			<tr>
				<th>제목</th> 
				<td><input type="text" name="jhBoardTitle" value="${jhBoard.jhBoardTitle}" required>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="jhBoardContent" value="${jhBoard.jhBoardContent}" required>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
				${jhBoard.jhFileName}
				<input type="file" name="file">
				<input type="hidden" name="jhFileId" value="${jhBoard.jhFileId}">
				</td>
			</tr>
		</table>
		<input type="submit" value="저 장"> <input type="reset" value="취 소">
		
	</form>
	<script>
		var result = '${result}';
		if (result === 'updateOK') {
			alert("수정되었습니다.");
		}
	</script>
</body>
</html>