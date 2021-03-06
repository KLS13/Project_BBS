<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp"/>
<jsp:include page="../layout/bbsStyle.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/boardCommon.css">
<title>시크릿톡 작성</title>
</head>
<body>
<form method="post">
<input type="hidden" name="writer" value="${pageContext.request.userPrincipal.name}"/>
<div class="container">
      
<table class="table table-bordered">
 <caption> 시크릿톡 - 비밀일기 </caption>
<tr>
<th><label>제목</label></th>
<td><input type="text" name="title" class="form-control"/></td>
</tr>

<tr>
<th><label>작성자</label></th>
<td>${pageContext.request.userPrincipal.name}</td>
</tr>
<tr>
<th><label>내용</label></th>
<td>
<pre><textarea cols="50" rows="5" name="content" class="form-control"></textarea></pre>
</td>
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