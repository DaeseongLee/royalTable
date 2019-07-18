<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<form:form modelAttribute="menu" action="reMenu.shop" enctype="multipart/form-data">
	<table>
			<tr><td>메뉴명</td>
				<td><form:input path="menuName" maxlength="20"/><br>
				<font color="red"><form:errors path="menuName"/></font></td>
			</tr>
			
			<tr><td>기본가격</td>
				<td><form:input path="mprice" maxlength="20"/><br>
				<font color="red"><form:errors path="mprice"/></font></td>
			</tr>
			<tr><td>내용</td>
				<td><form:input path="content" maxlength="20"/><br>
				<font color="red"><form:errors path="content"/></font></td>
			</tr>
			<tr><td>카테고리</td>
				<td><form:input path="category" maxlength="20"/><br>
				<font color="red"><form:errors path="category"/></font></td>
			</tr>
			<tr><td>메뉴 이미지</td>
				<td colspan="2"><input type="file" name="img"/></td>
			</tr>
			<tr><td colspan="3"><input type="submit" value="메뉴등록">&nbsp;
				<input type="button" value="메뉴목록" onclick="location.href='menuList.shop'"></td>
			</tr>
	</table>
</form:form>

</div>
</body>
</html>