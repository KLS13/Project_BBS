<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/bbsStyle.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시크릿톡 게시판</title>
<style>
tr :nth-child(2){
	width: 700px;
}
tr :nth-child(3){
text-align: center;
	width: 130px;
}
tr :nth-child(4) {
text-align: center;
	width: 100px;
}
tr :nth-child(5) {
text-align: center;
	width: 100px;
}

.listClick :hover {
	cursor: pointer;
}

	.pull-right{
		background: white;
		border: 0px;
		width: 50px !important;
	    height:50px !important;
	    margin-right: 5px;
	}
	
	.imgBtn {
	width: 50px;
	height:50px;
	}
</style>
</head>
<body>
<div class="container">
		<table class="table table-bordered">
 <thead>
  <tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성일</th>
   <th>작성자</th>
   <th>조회수</th>
  </tr>
 </thead>
 
 <tbody>
  <c:forEach items="${list}" var="list">
  
  <tr onclick="location.href='/board/view?bno=${list.bno}'" class="listClick">
  <td>${list.bno}</td>
  <td>${list.title}</td>
  <td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
  <td>${list.writer}</td>
  <td>${list.viewCnt}</td>
 </tr>
</c:forEach>
 </tbody>
 <tr>
<td colspan="5">
<div>
	
	<c:if test="${prev}">
		<span>[ <a href="/board/listPage?num=${startPageNum - 1}">◀◀</a> ]&nbsp;</span>
	</c:if>
	
	<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
  		<span>
  		
  			<c:if test="${select != num}">
  				<a href="/board/listPage?num=${num}">[${num}]</a>
  			</c:if> 			
  			
  			<c:if test="${select == num}">
  				<b>[${num}]</b>
  			</c:if>
  			
		</span>
	</c:forEach>
	
	<c:if test="${next}">
		<span>&nbsp;[ <a href="/board/listPage?num=${endPageNum + 1}">▶▶</a> ]</span>
	</c:if>
	
</div>

<button type="button" onclick="location.href='/board/write'"
class="pull-right"><img src="/images/글쓰기.png" class="imgBtn"></button>
</td>	
</tr>
</table>
</div>
</body>
</html>