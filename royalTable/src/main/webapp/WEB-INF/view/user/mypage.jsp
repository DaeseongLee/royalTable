<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/user/mypage.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" href="${path}/css/main.css">
<style type="text/css">
	.select {
		padding:3px;
		text-decoration: none; font-weight: bold;
		background-color: #0000ff;
	}
	.select>a {color : #ffffff;
				text-decoration: none;
				font-weight="bo"}
</style>
</head>
<body>

<div class="w3-container w3-border w3-padding-16" style="width:150px;float:left;">
		<c:if test="${sessionScope.loginUser.userId != 'admin' }">
			<a href="">주문조회</a><br><br>
			<a href="">적립금조회</a><br><br>
			<a href="">후기조회</a><br><br>
			<a href="../board/list.shop">1:1 상담 내역</a><br><br>
			<a href="update.shop?id=${user.userId}">개인정보수정</a><br><br>
			<a href="delete.shop?id=${user.userId}">회원탈퇴</a>
			<br>
		</c:if>
		<c:if test="${sessionScope.loginUser.userId == 'admin'}">
			<a href="list.shop">재고관리</a><br><br>
			<a href="menuList.shop">상품관리</a><br><br>
			<a href="../admin/list.shop">회원관리</a><br><br>
			<a href="">주문관리</a><br><br>
			<a href="">판매현황</a><br><br>
			<a href="">적립금관리</a><br><br>
			<div class="w3-dropdown-hover">게시판관리
				<div class="w3-dropdown-content w3-border" style="padding:15px;">
					<a href="../board/notice.shop">공지사항</a><br><br>
					<a href="../board/list.shop">1:1 상담 내역</a>
				</div>
			</div>
			<br>
		</c:if>
		</div>
	<div class="w3-main w3-container w3-right" style="width:850px; float:right;">


<%-- minfo : 회원정보출력 --%>
<div id="minfo" class="info">
	<table>
		<caption style="font-size:25px;">회원정보</caption>
		<tr><td>아이디</td><td>${user.userId}</td></tr>
		<tr><td>이름</td><td>${user.name}</td></tr>
		<tr><td>성별</td>
		<td><c:if test="${user.gender == 1}">남</c:if><c:if test="${user.gender == 2}">여</c:if></td></tr>
		<tr><td>전화번호</td><td>${user.phoneNum}</td></tr>
		<tr><td>주소</td><td>${user.address}</td></tr>
		<tr><td>이메일</td><td>${user.email}</td></tr>
	</table><br>
</div><br>

</div>
</body>
</html>