<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<div class="w3-container w3-border w3-padding-16" style="width:150px;float:left;">
	<c:choose>	
		<c:when test="${!empty sessionScope.loginUser}">
		<c:if test="${sessionScope.loginUser.userId != 'admin' }">
			<a href="">주문조회</a><br><br>
			<a href="">적립금조회</a><br><br>
			<a href="">후기조회</a><br><br>
			<a href="consult.shop?type=2">1:1 상담 내역</a><br><br>
			<a href="update.shop?id=${user.userId}">개인정보수정</a><br><br>
			<a href="delete.shop?id=${user.userId}">회원탈퇴</a>
			<br>
		</c:if>
		<c:if test="${sessionScope.loginUser.userId == 'admin'}">
			<a href="../ingre/list.shop">재고관리</a><br><br>
			<a href="../ingre/menuList.shop">상품관리</a><br><br>
			<a href="../admin/list.shop">회원관리</a><br><br>
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
		</c:if>
		</c:when>
		<c:when test="${empty sessionScope.loginUser}">
			<a href="notice.shop?type=1">공지사항</a><br><br>
			<a href="consult.shop?type=2">1:1상담</a>
			<br>
		</c:when>
	</c:choose>
</div>
<div class="w3-main w3-container w3-right" style="width:850px; float:right;">
<input type="hidden" name="type" value="1">
<table>
	<caption style="font-size:25px;">공지사항</caption>
	<tr><td colspan="5" style="border-top:0">
		<form action="notice?type=1.shop" method="post" name="searchform">
			<input type="hidden" name="pageNum" value="1">
			<select name="searchtype">
				<option value="">선택하세요</option>
				<option value="subject">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchcontent" style="width:300px;" value="${param.searchcontent}">
			<input type="submit" value="검색">
		</form>
	</td></tr>
	<c:if test="${listcount > 0}">
		<tr><td colspan="4"></td><td>글개수:${listcount}</td></tr>
		<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th></tr>
		<c:forEach var="board" items="${boardlist}">
			<tr><td>${boardnum}</td>
				<c:set var="boardnum" value="${boardnum - 1}" />
				<td style="text-align:left;">
					<a href="detail.shop?boardNo=${board.boardNo}">${board.subject}</a>
				</td>
				<td>${board.userId}</td>
				<td><fmt:formatDate var="rdate" value="${board.regDate }" pattern="yyyyMMdd"/>
					<c:if test="${today == rdate }">
						<fmt:formatDate value="${board.regDate }" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${today != rdate }">
						<fmt:formatDate value="${board.regDate }" pattern="yy-MM-dd HH:mm"/>
					</c:if>
				</td>
				<td>${board.cnt}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="5">
				<c:if test="${pageNum > 1}"><a href="notice.shop?pageNum=${pageNum - 1}&searchtype=${param.searchtype}&searchcontent=${param.searchcontent}">[이전]</a></c:if>
				<c:if test="${pageNum <= 1}">[이전]</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == pageNum}">[${a}]</c:if>
					<c:if test="${a != pageNum}"><a href="notice.shop?pageNum=${a}&searchtype=${param.searchtype}&searchcontent=${param.searchcontent}">[${a}]</a></c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}"><a href="notice.shop?pageNum=${pageNum + 1}&searchtype=${param.searchtype}&searchcontent=${param.searchcontent}">[다음]</a></c:if>
				<c:if test="${pageNum >= maxpage}">[다음]</c:if>				
			</td>
		</tr>
	</c:if>
	<c:if test="${listcount == 0}">
		<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	<c:if test="${sessionScope.loginUser.userId == 'admin'}">
	<tr><td colspan="5" align="right"><a href="write.shop">[글쓰기]</a></td></tr>
	</c:if>
</table>
</div>
</body>
</html>