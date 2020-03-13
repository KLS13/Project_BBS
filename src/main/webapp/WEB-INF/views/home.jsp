<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<jsp:include page="layout/header.jsp"></jsp:include>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script src="resources/js/Homejs.js"></script>
<html>
<head>
<title>시크릿톡Home</title>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="resources/css/home.css">
</head>
<body>
<div class="container">
	
		<div class="pic">
			<img src="images/시크릿톡.png" />
		</div>
		<div class="comment">
		<div class="commentList-Box">
		<table class="commentTable" border="1">
		<caption>비밀글 - 한줄코멘트</caption>
			<tr>
				<th>작성자</th>
				<th>내용</th>
			</tr>
			<c:if test="${empty list }">
				<tr>
					<td colspan="2">방명록이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list }">
				<c:forEach var="list" items="${list }">
					<tr>
						<th>${list.writer}</th>
						<td>${list.comment} <br /> <a href="#" onclick="commentRemove('${list.cno}')">[삭제]</a></td>
					</tr>
				</c:forEach>
			</c:if>
			
		</table>
		</div>
		<br /><hr />
		<form id="commentForm" name="commentForm">
		<table class="commentWrite" > 
		<caption>비밀글 - 코멘트작성</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" id="writer"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre><textarea cols="50" rows="5" name="comment" id="comment"></textarea></pre></td>
			</tr>
			<tr>
				<th colspan="2">
				<p>
				※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.
				</p>
				<button type="button" onclick="ajax_comment()" class="imgBtn">
				<img src="/images/확인.png" class="imgBtn">
				</button> 
				</th>
		</table>
		</form>
		</div>
</div>	
</body>
</html>