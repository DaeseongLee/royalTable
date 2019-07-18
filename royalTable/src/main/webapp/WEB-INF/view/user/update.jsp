<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/user/update.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 정보 수정</title>
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
<form:form modelAttribute="user" method="post" action="update.shop">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table style="width:650px;margin-left:200px;">
		<caption style="font-size:25px;">개인정보 수정</caption>
		<tr height="40px"><td>아이디</td><td><form:input path="userId" readonly="true"/>
			<font color="red"><form:errors path="userId" /></font></td></tr>
		<tr height="40px"><td>비밀번호</td><td><form:password path="password" />
			<font color="red"><form:errors path="password" /></font></td></tr>
		<tr height="40px"><td>이름</td><td><form:input path="name" />
			<font color="red"><form:errors path="name" /></font></td></tr>
		<tr height="40px"><td>성별</td><td><form:radiobutton path="gender" value="1" label="남자"/>
										<form:radiobutton path="gender" value="2" label="여자"/>
			<font color="red"><form:errors path="gender" /></font></td></tr>	
		<tr height="40px"><td>전화번호</td><td><form:input path="phoneNum" />
			<font color="red"><form:errors path="phoneNum" /></font></td></tr>
		<tr height="40px"><td>주소</td><td><form:input path="address" />
			<font color="red"><form:errors path="address" /></font></td></tr>
		<tr height="40px"><td>이메일</td><td><form:input path="email" />
			<font color="red"><form:errors path="email" /></font></td></tr>
		<tr height="40px">
			<td colspan="2" align="center">
				<input type="submit" value="수정">
				<input type="reset" value="초기화">
			</td>
		</tr>
	</table>
</form:form>
</div>
</body>
</html>