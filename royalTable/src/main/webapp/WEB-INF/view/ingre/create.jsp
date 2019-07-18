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
<form:form modelAttribute="ingre" action="add.shop" method="post" name="f">
	<table>
			<tr><td>재료명</td>
				<td><form:input path="ingreName" maxlength="20"/><br>
				<font color="red"><form:errors path="ingreName"/></font></td>
			</tr>
			<tr><td>수량</td>
				<td><form:input path="currentAmount" maxlength="20"/><br>
				<font color="red"><form:errors path="currentAmount"/></font></td>
			</tr>
			<tr><td>단위</td>
				<td><form:input path="unit" maxlength="20"/><br>
				<font color="red"><form:errors path="unit"/></font></td>
			</tr>
			<tr><td>재료가격</td>
				<td><form:input path="price" maxlength="20"/><br>
				<font color="red"><form:errors path="price"/></font></td>
			</tr>
			<tr><td colspan="3"><input type="submit" value="상품등록">&nbsp;
				<input type="button" value="상품목록" onclick="location.href='list.shop'"></td>
			</tr>
	</table>
</form:form>

</div>
</body>
</html>