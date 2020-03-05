<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../layout/header.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap"
	rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시크릿 다이어리</title>
<script type="text/javascript">

	$(document).ready(function() {

		$('#summernote').summernote({
			height : 400,
			focus : true
		});
	});

	$(function() {
		var date = new Date();
		var now = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 "
				+ date.getDate() + "일";
		$('.dateBtn').click(function() {
			$('.date').val(now);
		});
	});

	function ajax_diary() {

		$.ajax({
			type : 'POST',
			url : "/board/diaryInsert",
			data : $("#diaryForm").serialize(),
			success : function(data) {
				if (data == "YES") {
					
					alert("성공");
					$('#summernote').val("");
				}
			},
			error : function(request, status, error) {
				
			}
		});
	}

	
	function getDiaryList() {
		
		$.ajax({
			type : 'GET',
			url : "/board/diaryList",
			data : $("#diaryForm").serialize(),
			success : function(data) {
				$('#summernote').val(data);
			},
			error : function(request, status, error) {
				alert("에러");
			}
		});
	}
</script>
<style>
.container {
	width: 1100px;
	height: 700px;
	margin: 0 auto;
	overflow: hidden;
}

h1 {
	font-family: 'Indie Flower', cursive;
}

.dateBtn {
	background: white;
	border: 0px;
	width: 50px;
	height: 50px;
}

.imgBtn {
	width: 50px;
	height: 50px;
}
</style>
</head>
<body>
	<form id="diaryForm" name="diaryForm">
		<div class="container">
			<div>
				<h1>
					Secret Diary &nbsp;&nbsp;
					<button type="button" class="dateBtn">
						<img src="/images/달력.png" class="imgBtn" />
					</button>
				</h1>

				<h5>Tip ! 달력 아이콘을 클릭하시면 오늘 날짜가 아래 입력되요.</h5>
				<textarea rows="1" class="date"></textarea>
				<br /> <br />
				<textarea name="content" id="summernote"><c:out
						value="${content}" /> </textarea>
			</div>
			<input type="button" value="작성" onclick="ajax_diary()" id="diaryBtn" />
			<input type="button" value="메모장 불러오기" onclick="getDiaryList()" id="listBtn" />
			<input type="hidden" name="writer" id="writer" value="${pageContext.request.userPrincipal.name}" />
		</div>
	</form>
</body>
</html>