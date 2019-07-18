<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
<form:form modelAttribute="board" action="delete.shop" name="f">
	<form:hidden path="boardNo" />
	<spring:hasBindErrors name="board">
		<font color="red">
			<c:forEach items="${errors.globalErrors}" var="error"><spring:message code="${error.code}" /></c:forEach>
		</font>
	</spring:hasBindErrors>
	<input type="hidden" name="boardNo" value="${board.boardNo}">
	<table>
		<caption>게시글 삭제</caption>
		<tr><td>진짜로 지울꺼야?<br><br>그럼 밑에 버튼 누르던가</td></tr>
		<tr><td><a href="javascript:document.f.submit()">[게시글 삭제]</a></td></tr>
	</table>
</form:form>
</body>
</html>