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