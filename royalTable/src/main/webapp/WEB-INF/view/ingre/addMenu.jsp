<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	var price2 = price*num;
	$('#amount').text(price2);
</script>
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
<form:form modelAttribute="menu" action="madd.shop">
	<table>
	<tr><th colspan="2">메뉴 별 재료선택</th>
			<tr><td>메뉴명</td>
				<td><input type="hidden" value="${menuNo}" name="menuNo">${menuName}</td>
			</tr>
			<tr><td>재료선택</td>
				<td><select name = "ingreNo" style="width: 80%;">
					<option value="">메뉴선택</option>
					<c:forEach var="ingre" items="${ingrelist}">
						<option value="${ingre.ingreNo}">${ingre.ingreName}</option>
					</c:forEach>
				</select><br>
				<input type="radio" value="0" name="ifMain">주재료 &nbsp;&nbsp;&nbsp;
				<input type="radio" value="1" name="ifMain">보조재료  &nbsp;&nbsp;&nbsp;
			</tr>
	</table>
	<br>
	<table>
			<tr><th colspan="5">단계 별 수량 선택</th></tr> 
			<tr><td>1단계<br><form:input path="one" maxlength="20"/><br>
				<font color="red"><form:errors path="one"/></font></td>
				<td>2단계<br><form:input path="two" maxlength="20"/><br>
				<font color="red"><form:errors path="two"/></font></td>
				
				
				<td>기본<br><form:input path="amount" maxlength="20"/><br>
				<font color="red"><form:errors path="amount"/></font></td>
				
				<td>3단계<br><form:input path="three" maxlength="20"/><br>
				<font color="red"><form:errors path="three"/></font></td>
				<td>4단계<br><form:input path="four" maxlength="20"/><br>
				<font color="red"><form:errors path="four"/></font></td>
			</tr>
			<tr><td colspan="5"><input type="submit" value="메뉴등록">&nbsp;
				<input type="button" value="메뉴목록" onclick="location.href='menuList.shop'"></td>
			</tr>
	</table>
	
</form:form>

</div>
</body>
</html>