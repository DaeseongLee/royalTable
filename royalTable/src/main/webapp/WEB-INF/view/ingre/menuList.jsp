<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>
</head>
<body>

<div class="w3-container w3-border w3-padding-16" style="width:150px;float:left;">
			<a href="list.shop">재고관리</a><br><br>
			<a href="menuList.shop">상품관리</a><br><br>
			<a href="">회원관리</a><br><br>
			<a href="">주문관리</a><br><br>
			<a href="">판매현황</a><br><br>
			<a href="">적립금관리</a><br><br>
			<a href="">게시판관리</a>
			<br>
		</div>
	<div class="w3-main w3-container w3-right" style="width:850px; float:right;">

	<input style="float: right" type="button" value="등록" onclick="location.href='register.shop'">
<table>
	<tr><th>메뉴번호</th><th>사진</th><th>메뉴명</th><th>가격</th><th>내용</th><th>카테고리</th><th>별점</th><th>&nbsp;</th></tr>
	
		<c:forEach var="menu" items="${menulist}">
			<tr><td>${menu.menuNo}</td><td>${menu.imgurl}</td><td>${menu.menuName}</td>
			<td>${menu.mprice}</td><td>${menu.content}</td><td>${menu.category}</td><td>0</td>
			<td>
				<a href="addMenu.shop">[메뉴등록]</a>
			</td></tr>
		</c:forEach>
	
	<c:if test="${listcount==0}">
		<tr><td colspan="8">등록된 메뉴가 없습니다.</td></tr>
	</c:if>
</table><br>



</div>
</body>
</html>