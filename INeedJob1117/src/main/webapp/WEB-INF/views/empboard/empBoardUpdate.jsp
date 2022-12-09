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
	<h1>사원정보 수정</h1>
	<c:url var="actionURL" value='/empBoard/update'/>
	<form action="${actionURL}" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>번호</th>
				<td>${empBoard.empId}</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td><input type="hidden" value="${categoryId}" name="categoryId">${categoryName}
					<input type="hidden" name="empId" value="${empBoard.empId}">
			</tr>
			<tr>
				<th>작성자</th>
				<td>${sessionScope.userId}<input type="hidden" name="userId" value="chlqudwns">
				</td>
				<!-- 회원관리랑 연결 후 보이게 해야함 -->
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="empBoardTitle" value="${empBoard.empBoardTitle}" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="empBoardContent"
					value="${empBoard.empBoardContent}"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					${empBoard.empFileName}
					<input type="file" name="empFile">
					<input type="hidden" name="empFileId" value="${empBoard.empFileId}">
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"> 
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>