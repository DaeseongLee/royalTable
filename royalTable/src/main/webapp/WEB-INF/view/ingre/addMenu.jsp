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
			<div class="w3-dropdown-hover">게시판관리
				<div class="w3-dropdown-content w3-border" style="padding:15px;">
					<a href="../board/notice.shop?type=1">공지사항</a><br><br>
					<a href="../board/consult.shop?type=2">1:1 상담 내역</a>
				</div>
			</div>
			<br>
		</div>
	<div class="w3-main w3-container w3-right" style="width:850px; float:right;">
<form:form modelAttribute="menu" action="madd.shop">
	<table>
			<tr><td>메뉴명</td>
				<td>${menuName}</td>
			</tr>
			<tr><td>재료선택</td>
				<td><select name = "ingreNo" style="width: 80%;">
					<option value="">메뉴선택</option>
					<c:forEach var="ingre" items="${ingrelist}">
						<option value="${ingre.ingreNo}">${ingre.ingreName}</option>
					</c:forEach>
				</select></td>
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
			<tr><td>재료구분</td>
				<td><form:input path="ifMain" maxlength="20"/><br>
				<font color="red"><form:errors path="ifMain"/></font></td>
			</tr>
			<tr><td>메뉴 이미지</td>
				<td colspan="2"><input type="file" name="imgurl"/></td>
			</tr>
			<tr><td>1단계</td>
				<td><form:input path="one" maxlength="20"/><br>
				<font color="red"><form:errors path="one"/></font></td>
			</tr>
			<tr><td>2단계</td>
				<td><form:input path="two" maxlength="20"/><br>
				<font color="red"><form:errors path="two"/></font></td>
			</tr>
			<tr><td>기본</td>
				<td><form:input path="amount" maxlength="20"/><br>
				<font color="red"><form:errors path="amount"/></font></td>
			</tr>
			<tr><td>3단계</td>
				<td><form:input path="three" maxlength="20"/><br>
				<font color="red"><form:errors path="three"/></font></td>
			</tr>
			<tr><td>4단계</td>
				<td><form:input path="four" maxlength="20"/><br>
				<font color="red"><form:errors path="four"/></font></td>
			</tr>
			<tr><td colspan="3"><input type="submit" value="메뉴등록">&nbsp;
				<input type="button" value="메뉴목록" onclick="location.href='menuList.shop'"></td>
			</tr>
	</table>
</form:form>

</div>
</body>
</html>