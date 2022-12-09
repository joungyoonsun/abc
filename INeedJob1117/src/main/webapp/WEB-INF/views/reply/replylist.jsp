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
<title>댓글</title>
<script src="https://code.jquery.com.jquery-3.6.1.min.js"></script>
<script>
$(function() {
   $("a#delete").click(function(event) {
      if(confirm("댓글을 삭제하시겠습니까??")) {
         console.log("댓글 삭제");
         return true;
      } else {
         console.log("삭제 취소");
           return false;
       }
   });
});
</script>
</head>
<body>


   <h1>현직자 댓글 리스트</h1>

   <table border="1">

      <tr>
         <th>댓글번호</th>
         <th>작성자</th>
         <th>작성 날짜</th>
         <th>댓글 내용</th>
         <th>  삭제  </th>

      </tr>
      <c:forEach var="reply" items="${replyList}">
         <tr>
            <td>${reply.boardReplyNumber}</td>
            <td>${reply.userId}</td>
            <td>${reply.replyInsertDate}</td>
            <td>${reply.replyContent}</td>
            <td> 
             <a id="delete" href='<c:url value="/replyVO/delete/${reply.boardReplyNumber}/${reply.userId}"/>'>
             <button type="button"> 
             <fmt:message key="DELETE"/>
             </button>
             </a>
             </td>
            
      </c:forEach>
   </table>
   


</body>
</html>