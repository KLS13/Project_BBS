<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/bbsStyle.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
<form method="post">
<input type="hidden" name="writer" value="${view.writer }"/>
<div class="container">
		<table class="table table-bordered">
		<caption> 시크릿톡 - 수정하기 </caption>
<tr>
<th><label>제목</label></th>
<td><input type="text" name="title" value="${view.title }" class="form-control"/></td>
</tr>

<tr>
<td><label>작성자</label></td>
<th>${view.writer }</th>
</tr>
<tr>
<th><label>내용</label></th>
<td>
<pre><textarea cols="50" rows="5" name="content" class="form-control">${view.content }</textarea></pre>
</td>
</tr>
<tr>
<td colspan="2">
<button type="submit" class="pull-right"><img src="/images/확인.png" class="imgBtn"/></button>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>