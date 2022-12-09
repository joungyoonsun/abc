<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:url var="actionURL" value='/empBoard/insert' />
<form action="${actionURL}" method="post" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<th>카테고리</th>
			<td><input type="hidden" value="${categoryId}" name="categoryId">${categoryName}
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${sessionScope.userId}  <!--게시글 등록에서 get 할때 보기 위해  -->
				<input type="hidden" name="userId" value="${userId}"> <!-- post할때 컨트롤러에서 가져오기 위해 -->
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="empBoardTitle" required></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><input type="text" name="empBoardContent" required></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
			<input type="file" name="empFile">
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="저장"> 
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>