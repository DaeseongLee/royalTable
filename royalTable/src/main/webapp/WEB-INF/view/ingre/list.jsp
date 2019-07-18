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
<%@ include file="/WEB-INF/view/jspbody.jsp" %>
	<div class="w3-main w3-container w3-right" style="width:850px; float:right;">

	<input style="float: right" type="button" value="등록" onclick="location.href='create.shop'">
<table>
	<tr><th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th>
		<th>제품번호</th><th>재료명</th><th>수량 (단위)</th><th>재료가격</th><th>입고일</th></tr>
	<c:forEach var="ingre" items="${ingrelist}">
		<tr><td><input type="checkbox" name="idchks" value="${ingre.ingreNo}"></td>
			<td>${ingre.ingreNo}</td><td>${ingre.ingreName}</td>
			<td>${ingre.currentAmount} g</td><td>${ingre.price}원</td>
		<td>
			<fmt:formatDate value="${ingre.dateReceipt}" pattern="yy/MM/dd" />
		</td></tr>
	</c:forEach>
	<c:if test="${listcount==0}">
		<tr><td colspan="5">존재하는 재고가 없습니다.</td></tr>
	</c:if>
</table><br>



</div>
</body>
</html>