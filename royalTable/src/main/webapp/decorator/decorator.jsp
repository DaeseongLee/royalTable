<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/decorator/decorator.jsp --%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title/></title>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<decorator:head />
<link rel="stylesheet" href="${path}/css/main.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href="https://fonts.googleapis.com/css?family=Lobster|Playball&display=swap&subset=latin-ext" rel="stylesheet">
</head>
<style>
a:hover{color:blue;}
a {text-decoration:none;}
</style>
<body>
	<!-- Top menu -->
	<div style="margin-right:150px;">
		<c:choose>
			<c:when test="${!empty sessionScope.loginUser}">
				<c:if test="${sessionScope.loginUser.userId == 'admin'}">
					<div class="w3-right" style="margin-top:5px;">${sessionScope.loginUser.name}님
						<a href="${path}/user/logout.shop" style="margin-left:15px;">로그아웃</a>
						<a href="${path}/user/mypage.shop?id=${sessionScope.loginUser.userId}" style="margin-left:15px;">마이페이지</a>
					</div>
				</c:if>
				<c:if test="${sessionScope.loginUser.userId != 'admin' }">
					<div class="w3-right" style="margin-top:5px;">${sessionScope.loginUser.name}님
						<a href="${path}/user/logout.shop" style="margin-left:15px;">로그아웃</a>
						<a href="${path}/cart/cartView.shop" style="margin-left:15px;">장바구니</a>
						<a href="${path}/user/mypage.shop?id=${sessionScope.loginUser.userId}" style="margin-left:15px;">마이페이지</a>
						<a href="${path}/board/notice.shop?type=1" style="margin-left:15px;">고객센터</a>
					</div>
				</c:if>
			</c:when>
			<c:when test="${empty sessionScope.loginUser}">
				<div class="w3-right" style="margin-top:5px;">
					<a href="${path}/user/login.shop" style="margin-left:15px;">로그인</a>
					<a href="${path}/user/userEntry.shop" style="margin-left:15px;">회원가입</a>
					<a href="${path}/board/notice.shop?type=1" style="margin-left:15px;">고객센터</a>
				</div>
			</c:when>
		</c:choose>
	<br>
		
		<div class="w3-padding-16" style="margin-left:150px; margin-right:150px;">
			<a href="${path}/user/main.shop" class="w3-button w3-hover-white w3-left" style="font-size:50px;font-family: 'Playball', cursive;">Royal Table</a>
				<input type="text" class="w3-white w3-border-0 w3-bottombar w3-border-blue" placeholder="Search.." style="width:300px;margin-top:25px; margin-left:30px;font-size:20px;">
				<button class="w3-button w3-light w3-hover-white"><i class="fa fa-search" style="font-size:20px;"></i></button>
		</div>	
	</div>
<br>
<div class="w3-panel w3-border-top w3-border-bottom">
	<div style="margin-left:150px; margin-right:150px;padding:10px;">
		<a href="#" style="float:right-4; margin-left:400px;">고기류</a>
		<a href="#" style="float:right-3; margin-left:200px;">해물류</a>
		<a href="#" style="float:right-2; margin-left:200px;">채소류</a>
		<a href="#" style="float:right-1; margin-left:200px;">기타</a>	
	</div>
</div>
<div class="w3-main w3-content w3-padding" style="max-width:1050px;">
	<decorator:body/>
</div>

<!--  
<div style="width:150px; background-color:gray;">
	<a href="${path}/user/mypage.shop?id=${sessionScope.loginUser.userId}">회원관리</a><br>
	<a href="${path}/item/list.shop">상품관리</a><br>
	<a href="${path}/board/list.shop">게시판</a><br>
	<a href="${path}/chat/chat.shop">채팅</a><br>
	</div>
-->
</body>
</html>