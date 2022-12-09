<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>현업자 게시글 목록</h1>
${message}
<table border="1">
<tr>
	<th>emp_id</th>
	<th>user_id</th>
	<th>emp_board_title</th>
	<th>emp_inert_date</th>
	<th>emp_read_count</th>

</tr>
<c:forEach var="empBoard" items="${empBoardList}">
<tr>
	<td>${empBoard.empId}</td>
	<td>${empBoard.userId}</td>
	<td>${empBoard.empBoardTitle}</td>
	<td>${empBoard.empInsertDate}</td>
	<td>${empBoard.empReadCount}</td>
</tr>
</c:forEach>
</table>
</body>
</html>