<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="layout/header.jsp"></jsp:include>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��ũ����</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>��ũ����</h1>
		<h1>
		<c:if test="${pageContext.request.userPrincipal.name eq 'admin'}">
		�����ڴ� �ݰ�����!
		</c:if>
		<c:if test="${pageContext.request.userPrincipal.name eq 'user'}">
		����ڴ� �ݰ�����!
		</c:if>
		
		</h1>
		<a href="j_spring_security_logout" style="color: red">
		�α׾ƿ�</a>
	</div>
</body>
</html>