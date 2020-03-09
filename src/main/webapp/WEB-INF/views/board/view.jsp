<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/bbsStyle.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/boardCommon.css">
<title>게시판 [ ${view.title} ]</title>
<style>
th {
	width: 200px;
}
</style>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
		<caption> 시크릿톡 - 비밀일기 </caption>
			<tr>
				<th><label>제목</label></th>
				<td>${view.title}</td>
			</tr>
			<tr>
				<th><label>작성자</label></th>
				<td>${view.writer}</td>
			</tr>
			<tr>
				<th><label>내용</label></th>
				<td><pre><c:out value ="${view.content}"/></pre></td>
			</tr>
			<tr>
				<td colspan="2">	
					<button type="button" onclick="location.href='/board/modify?bno=${view.bno}'"
					class="pull-right"><img src="/images/글쓰기.png" class="imgBtn"/></button>
					
					<button type="button" onclick="location.href='/board/delete?bno=${view.bno}'"
					class="pull-right"><img src="/images/삭제.png" class="imgBtn"/></button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>