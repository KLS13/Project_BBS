function ajax_comment() {

	$.ajax({
		type : 'POST',
		url : "/board/commentInsert",
		data : $("#commentForm").serialize(),
		success : function(data) {
			if (data == "YES") {					
				alert("방명록이 저장되었습니다.");
				$('#writer').val("");
				$('#comment').val("");
				
			}
		},
		error : function(request, status, error) {
			
		}
	});
}

function commentRemove(cno) {

	var cno = cno;
	
	$.ajax({
		type : 'POST',
		url : "/board/commentRemove",
		data : {cno : cno},
		success : function(data) {
			if (data == "YES") {					
				alert("삭제되었습니다.");
				$('#writer').val("");
				$('#comment').val("");
				
			}
		},
		error : function(request, status, error) {
			alert("에러");
		}
	});
}