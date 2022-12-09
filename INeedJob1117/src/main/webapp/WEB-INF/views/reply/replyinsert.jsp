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
   <c:url var="actionURL" value='/reply/insert'></c:url>
   <form action="${actionURL}" method="post" enctype="multipart/form-data">
      <h1>현업자 댓글 입력 폼</h1>

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
      <input type="hidden" name="empId" value="${empId}">
      <input type="submit" value="저 장"> <input type="reset" value="취 소">
      
   </form>
</body>
</html>