<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/login.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<form:form modelAttribute="user" method="post" action="login.shop">
	<input type="hidden" name="name" value="유효성 검증을 위한 의미없는 이름">
	
	<table border="1" style="width:650px;margin-left:200px;">
		<caption style="font-size:25px;">로그인</caption>
		<tr height="40px"><td>아이디</td><td><form:input path="userId"/>
		<br><font color="red"><form:errors path="userId" /></font></td></tr>
		<tr height="40px"><td>비밀번호</td><td><form:password path="password"/>
		<br><font color="red"><form:errors path="password" /></font></td></tr>
		<tr height="40px"><td colspan="2" align="center">
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='userEntry.shop'"></td></tr>
	</table>
	<spring:hasBindErrors name="user">
		<font color="red" style="margin-left:200px;">
			<c:forEach items="${errors.globalErrors}" var="error">
				<spring:message code="${error.code}" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
</form:form>
</body>
</html>