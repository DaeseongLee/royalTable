<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 보기</title>
<style>
th {
	width:100px;
}
</style>
</head>
<body>
<table>
	<caption style="font-size:25px;">공지사항 상세보기</caption>
	<tr><th>작성자</th><td>${board.userId}</td></tr>
	<tr><th>제목</th><td>${board.subject}</td></tr>
	<tr><th>내용</th><td style="width:300px;height:300px;">${board.content}</td></tr>
</table>
<c:if test="${sessionScope.loginUser.userId == 'admin'}">
<a href="delete.shop?boardNo=${board.boardNo}" style="float:right;">[삭제]</a>
<a href="update.shop?boardNo=${board.boardNo}" style="float:right;">[수정]</a>
</c:if>
<a href="notice?type=1.shop" style="float:right;">[목록]</a>
</body>
</html>