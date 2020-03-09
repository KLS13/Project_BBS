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
<link rel="stylesheet" type="text/css" href="/resources/css/secretDiary.css">
<script type="text/javascript">

	$(document).ready(function() {

		$('#summernote').summernote({
			width : 500,
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
					alert("다이어리에 저장되었습니다.");
				}
			},
			error : function(request, status, error) {
				
			}
		});
	}

	
	function getDiaryList() {
		
		
		$.ajax({
			type : 'POST',
			url : "/board/diaryList",
			data : $("#diaryForm").serialize(),
			success : function(data) {

				alert("성공" + data);
				$('#saveContent').val(data);
					
				
			},
			error : function(request, status, error) {
				alert("에러");
			}
		});
	}
</script>
</head>
<body>
	<form id="diaryForm" name="diaryForm">
		<div class="container">
		<div>
			<div class="note1">
				<h1>
					Secret Diary &nbsp;&nbsp;
					<button type="button" class="dateBtn">
						<img src="/images/달력.png" class="imgBtn" />
					</button>
				</h1>

				<h5>Tip ! 달력 아이콘을 클릭하시면 오늘 날짜가 아래 입력되요.</h5>
				<textarea rows="1" class="date" id="date"></textarea>
				<br /> <br />
				<textarea name="content" id="summernote"></textarea>
			<input type="button" value="작성" onclick="ajax_diary()" id="diaryBtn" />
			</div>
			<div class="note2">
				<pre><textarea style="resize:none" name="saveContent" id="saveContent" rows="26" cols="70" readonly="readonly"></textarea></pre>
			<input type="button" value="다이어리 불러오기" onclick="getDiaryList()" id="listBtn" />
			</div>
			<input type="hidden" name="writer" id="writer" value="${pageContext.request.userPrincipal.name}" />
			</div>
		</div>
	</form>
</body>
</html>