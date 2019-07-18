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





<table>
	<tr>
		<td id="tab1" class="tab"><a href="javascript:disp_div('minfo','tab1')">회원정보보기</a></td>
	</tr>
</table>
<%-- minfo : 회원정보출력 --%>
<div id="minfo" class="info">
	<table>
		<tr><td colspan="2">회원정보</td></tr>
		<tr><td>아이디</td><td>${user.userId}</td></tr>
		<tr><td>이름</td><td>${user.name}</td></tr>
		<tr><td>성별</td><td>${user.gender}</td></tr>
		<tr><td>전화번호</td><td>${user.phoneNum}</td></tr>
		<tr><td>주소</td><td>${user.address}</td></tr>
		<tr><td>이메일</td><td>${user.email}</td></tr>
	</table><br>
<%-- 
	1. 로그인 상태, 본인만 수정가능 하도록 하기.
	2. id에 해당하는 정보를 db에서 읽기
	3. update.jsp => 유효성 검증부분 처리 페이지 이동
--%>
	<a href="update.shop?id=${user.userId}">[회원정보수정]</a>&nbsp;
	<c:if test="${loginUser.userId != 'admin'}">
		<a href="delete.shop?id=${user.userId}">[회원탈퇴]</a>&nbsp;
	</c:if>
	<c:if test="${loginUser.userId == 'admin'}">
		<a href="../admin/list.shop">[회원목록]</a>&nbsp;
	</c:if>
</div><br>

</div>
</body>
</html>