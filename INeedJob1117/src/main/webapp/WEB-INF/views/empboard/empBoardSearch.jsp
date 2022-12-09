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
<title>EmpBoard Search</title>
</head>
<body>
   <h1>현업자 게시물 검색 목록</h1>
   %{message}
<%--    <div class="content">
      <form action="<c:url value='/jhBoard/search/1'/>" method="get">
         <div class="pull-right" style="margin-bottom: 5px;">
            <div class="col-xs-9">
               <input type="text" name="keyword" class="form-control">
            </div>
            <input type="submit" class="btn btn-warning" value="<fmt:message key="SEARCH"/>">
         </div>
      </form>
   </div> --%>
   <div class="row">
      <div class="col-1g-12">
      <c:url var="actionURL" value='/empBoard/search/1' />
	   <form action="${actionURL}" id="searchForm">
            <select type="name">
               <option value="T">제목</option>      
               <!-- <option value="C">내용</option>
               <option value="U">작성자</option>  -->
            </select> 
            <input type="text" name="keyword">
         <%-- 페이징처리 추후   <input type="hidden" name='pageNum' value="${} --%>
            <input type="submit" value="<fmt:message key="SEARCH"/>"> 
         </form>
      </div>
   </div> 
   <table border="1">
      <tr>
         <th>emp_id</th>
         <th>user_id</th>
         <th>emp_board_title</th>
         <th>emp_insert_date</th>
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