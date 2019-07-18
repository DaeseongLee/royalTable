<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /webapp/WEB-INF/view/admin/list.jsp --%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript">
	function allchkbox(allchk) {
		var chks = document.getElementsByName("idchks");
		for(var i =0;i<chks.length;i++) {
			chks[i].checked = allchk.checked;
		}
	}
	function graph_open(url) {
		var op = "width=800, height=600, scrollebars=yes,left=50,top=150";
		window.open(url+".shop","graph",op);
	}
</script>
</head>
<body>
<div class="w3-container w3-border w3-padding-16" style="width:150px;float:left;">
			<a href="../ingre/list.shop">재고관리</a><br><br>
			<a href="../ingre/menuList.shop">상품관리</a><br><br>
			<a href="../admin/list.shop">회원관리</a><br><br>
			<a href="">주문관리</a><br><br>
			<a href="">판매현황</a><br><br>
			<a href="">적립금관리</a><br><br>
			<a href="">게시판관리</a>
			<br>
		</div>
<div class="w3-main w3-container w3-right" style="width:850px; float:right;">
<form action="mailForm.shop" method="post">
	<table>
		<tr><td colspan="7">회원목록</td></tr>
		<tr><th>아이디</th><th>이름</th><th>성별</th><th>전화</th><th>이메일</th><th>&nbsp;</th>
			<th><input type="checkbox" name="allchk" onchange="allchkbox(this)"></th></tr>
		<c:forEach items="${list}" var="user">
			<tr><td>${user.userId}</td><td>${user.name}</td>
				<td><c:if test="${user.gender == 1 }">남</c:if><c:if test="${user.gender ==2 }">여</c:if></td>
				<td>${user.phoneNum}</td>
				<td>${user.email}</td>
				<td><a href="../user/update.shop?id=${user.userId}">수정</a>
					<a href="../user/delete.shop?id=${user.userId}">강제탈퇴</a>
					<a href="../user/mypage.shop?id=${user.userId}">회원정보</a>
				</td>
				<td><input type="checkbox" name="idchks" value="${user.userId}"></td>
			</tr>			
		</c:forEach>
		<tr><td colspan="7">
				<input type="submit" value="메일보내기">
				<input type="button" value="게시물작성그래프보기(막대)" onclick="graph_open('graph1')">
				<input type="button" value="게시물WordCloud" onclick="graph_open('graph2')">					
			</td></tr>
	</table>
</form>
</div>
</body>
</html>