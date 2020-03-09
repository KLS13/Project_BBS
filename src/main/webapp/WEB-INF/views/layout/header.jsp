<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<style>
.mainPic {
	width: 1400px;
	margin: 0 auto;
	overflow: hidden;
}

.menu{
	width:1200px;
	height: 40px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 50px;
	
}


#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 40px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .talkmenu {
	text-decoration: none;
	color: white;
	display: block;
	width: 281px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
var id = '${pageContext.request.userPrincipal.name}';

$(function(){
  $('.talkLogin').click(function(){
	  if(id == "") {
    alert("로그인을 해주세요");
    return false;
	  }
  });
});


</script>
</head>
<body>
	<div class="mainPic">
		<div class="menu">
			<nav id="topMenu">
				<ul>
					<li><a class="talkmenu" href="http://localhost:9090/">홈</a></li>
					<li>
					<c:if test="${empty pageContext.request.userPrincipal.name}">
					<a class="talkmenu" href="/loginform.it">로그인</a>				
					</c:if>
					<c:if test="${!empty pageContext.request.userPrincipal.name}">
					<a class="talkmenu" href="j_spring_security_logout">로그아웃</a>				
					</c:if>
					</li>
					<li class="talkLogin"><a class="talkmenu" href="/board/listPage?num=1">시크릿톡</a></li>
					<li class="talkLogin"><a class="talkmenu" href="/board/secretDiary">시크릿 다이어리</a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>