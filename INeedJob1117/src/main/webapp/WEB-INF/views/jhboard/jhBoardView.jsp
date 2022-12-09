
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="i18n/user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취업준비생 상세 게시글</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

//empBoard delete jqery
$(function() {
 $("a#delete").click(function(event) {
    if(confirm("게시글을 삭제하시겠습니까??")) {
       console.log("게시글 삭제");
       return true;
    } else {
       console.log("삭제 취소");
         return false;
     }
 });
});


//댓글 delete jquery
/* $(function() {
    $("#replydelete").click(function(event) {
       
    });
 }); */
 
 function deleteReply(param){
	   let object = $(param);
	   
	   console.log(object.parent().html());
	   if(confirm("댓글을 삭제하시겠습니까??")) {
         console.log("댓글 삭제");
         object.parent().parent().find("#replyDeleteForm").submit();
         
         return true;
      } else {
         console.log("삭제 취소");
           return false;
       }
 }
</script>




<!-- jhBoard -->
</head>
<body>
	<h1>취업준비생 상세 게시글</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>게시글 제목</th>
			<th>게시글 내용</th>
			<th>게시글 입력 날짜</th>
			<th>조회수</th>
		</tr>

		<tr>
			<td>${jhBoard.jhId}</td>
			<td>${jhBoard.userId}</td>
			<td>${jhBoard.jhBoardTitle}</td>
			<td>${jhBoard.jhBoardContent}</td>
			<td>${jhBoard.jhInsertDate}</td>
			<td>${jhBoard.jhReadCount}</td>
		</tr>
		<c:if test="${!empty jhBoard.jhFileName}">
			<tr>
				<td><fmt:message key="FILE" /></td>
				<td colspan=4><c:set var="len"
						value="${fn:length(jhBoard.jhFileName)}" /> <c:set var="filetype"
						value="${fn:toUpperCase(fn:substring(jhBoard.jhFileName, len-4, len))}" />
					<c:if
						test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}">
						<img src='<c:url value="/jhFile/${jhBoard.jhFileId}"/>'>
					</c:if> <a href='<c:url value="/jhFile/${jhBoard.jhFileId}"/>'>${jhBoard.jhFileName}(<fmt:formatNumber>${jhBoard.jhFileSize}</fmt:formatNumber>byte)
				</a>
			</tr>
		</c:if>
	</table>

	<a href='<c:url value="/jhBoard/update/${categoryId}/${jhId}"/>'>
		<button type="button" class="btn btn-info">
			<fmt:message key="UPDATE" />
		</button>
	</a>

	<a id="delete"
		href='<c:url value="/jhBoard/delete/${categoryId}/${jhId}"/>'>
		<button type="button" class="btn btn-info">
			<fmt:message key="DELETE" />
		</button>
	</a>


	<!-- 댓글 입력-->
	<form action="/INeedJob/reply/jhdetails" method="post">
		<h3>댓글 입력</h3>
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${sessionScope.userId}<!-- 로그인이 되어있는 동안 실행되게 --> <input
					type="hidden" name="userId" value="chlqudwns">
				</td>
			</tr>
			<tr>
				<th>댓글 내용</th>
				<td><input type="text" name="replyContent" required></td>
			</tr>
		</table>
		<input type="hidden" name="categoryId" value="${categoryId}">

		<input type="hidden" name="jhId" value="${jhBoard.jhId}"> <input
			type="submit" value="저 장"> <input type="reset" value="취 소">
	</form>





	<h3>댓글 목록</h3>
	<table border="1">
		<tr>
			<th>댓글번호</th>
			<th>작성자</th>
			<th>작성 날짜</th>
			<th>댓글 내용</th>
			<th>삭제</th>

		</tr>
		<c:forEach var="reply" items="${replyList}">
			<tr>
				<td>${reply.boardReplyNumber}</td>
				<td>${reply.userId}</td>
				<td>${reply.replyInsertDate}</td>
				<td>${reply.replyContent}</td>
				<td>
					<form id="replyDeleteForm"
						action='<c:url value="/replyvo/jhdelete/${reply.boardReplyNumber}/${reply.userId}/"/>'
						method="get">
						<input type="hidden" name="categoryId" value="${categoryId}">
						<input type="hidden" name="jhId" value="${jhId}">
						<button type="button" id="replydelete" onclick="deleteReply(this)">
							<fmt:message key="DELETE" />
						</button>
					</form>
				</td>
		</c:forEach>
	</table>
</body>
</html>