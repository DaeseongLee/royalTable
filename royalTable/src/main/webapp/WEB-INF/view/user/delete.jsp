<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/user/delete.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 확인</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<div class="w3-container w3-border w3-padding-16" style="width:150px;float:left;">
		<c:if test="${sessionScope.loginUser.userId != 'admin' }">
			<a href="">주문조회</a><br><br>
			<a href="">적립금조회</a><br><br>
			<a href="">후기조회</a><br><br>
			<a href="">1:1 상담 내역</a><br><br>
			<a href="update.shop?id=${user.userId}">개인정보수정</a><br><br>
			<a href="delete.shop?id=${user.userId}">회원탈퇴</a>
			<br>
		</c:if>
		<c:if test="${sessionScope.loginUser.userId == 'admin'}">
			<a href="../ingre/list.shop">재고관리</a><br><br>
			<a href="../ingre/menuList.shop">상품관리</a><br><br>
			<a href="../admin/list.shop">회원관리</a><br><br>
			<a href="">게시판관리</a><br><br>
			<a href="">주문관리</a><br><br>
			<a href="update.shop?id=${user.userId}">개인정보수정</a>
			<br>
		</c:if>
		</div>
	<div class="w3-main w3-container w3-right" style="width:850px; float:right;">
<table style="width:650px;margin-left:200px;">
	<caption style="font-size:25px;">회원탈퇴</caption>
	<tr><td>아이디</td><td>${user.userId}</td></tr>
	<tr><td>이름</td><td>${user.name}</td></tr>
</table>
<form action="delete.shop" method="post" name="deleteform">
	<input type="hidden" name="userId" value="${param.id}"><br>
	<div style="margin-left:350px;">
	비밀번호: <input type="password" name="password" style="width:200px;"> <a href="javascript:deleteform.submit()">회원탈퇴</a>
	</div>
</form>
</div>
</body>
</html>