<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/user/delete.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 확인</title>
<link rel="stylesheet" href="${path}/css/main.css">
</head>
<body>
<table style="width:650px;margin-left:200px;">
	<tr><td>아이디</td><td>${user.userId}</td></tr>
	<tr><td>이름</td><td>${user.name}</td></tr>
</table>
<form action="delete.shop" method="post" name="deleteform">
	<input type="hidden" name="userId" value="${param.id}"><br>
	<div style="margin-left:350px;">
	비밀번호: <input type="password" name="password" style="width:200px;"> <a href="javascript:deleteform.submit()">회원탈퇴</a>
	</div>
</form>
</body>
</html>