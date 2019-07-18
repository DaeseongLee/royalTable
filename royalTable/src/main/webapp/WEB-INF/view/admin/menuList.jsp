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
			<a href="">게시판관리</a>
			<br>
		</div>
	<div class="w3-main w3-container w3-right" style="width:850px; float:right;">

<%-- oinfo : 주문정보 출력 --%>
<div id="oinfo" class="info" style="display:none; width:100%;">
	<table>
		<tr><td colspan="3" align="center"><b>주문 목록</b></td></tr>
		<tr><th>주문번호</th><th>주문일자</th><th>총주문금액</th></tr>
		<c:forEach items="${salelist}" var="sale" varStatus="stat">
			<tr>
				<td align="center"><a href="javascript:list_disp('saleLine${stat.index}')">${sale.saleId}</a></td>
				<td align="center"><fmt:formatDate value="${sale.updatetime}" pattern="yyyy-MM-dd"/></td>
				<td align="right">${sale.totAmount}원</td>
			</tr>	
			<tr id="saleLine${stat.index}" class="saleLine">
				<td colspan="3" align="center">
				<table>
					<tr><th width="25%">상품명</th><th width="25%">상품가격</th>
						<th width="25%">구매수량</th><th width="25%">상품총액</th>
					</tr>
					<c:forEach items="${sale.itemList}" var="saleItem">
						<tr><td class="title">${saleItem.item.name}</td>
							<td>${saleItem.item.price}원</td>
							<td>${saleItem.quantity}개</td>
							<td>${saleItem.quantity * saleItem.item.price}원</td>
						</tr>
					</c:forEach>
				</table>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<%-- minfo : 회원정보출력 --%>
<div id="minfo" class="info">
	<table>
		<tr><th colspan="2">회원정보</th></tr>
		<tr><td>아이디</td><td>${user.userId}</td></tr>
		<tr><td>이름</td><td>${user.userName}</td></tr>
		<tr><td>우편번호</td><td>${user.postcode}</td></tr>
		<tr><td>전화번호</td><td>${user.phoneNo}</td></tr>
		<tr><td>주소</td><td>${user.address}</td></tr>
		<tr><td>이메일</td><td>${user.email}</td></tr>
		<tr><td>생년월일</td><td><fmt:formatDate value="${user.birthDay}" pattern="yyyy-MM-dd" /></td></tr>
	</table><br>
<%-- 
	1. 로그인 상태, 본인만 수정가능 하도록 하기.
	2. id에 해당하는 정보를 db에서 읽기
	3. update.jsp => 유효성 검증부분 처리 페이지 이동
--%>
	<a href="update.shop?id=${user.userId}">[회원정보수정]</a>&nbsp;
	<c:if test="${loginUser.userId != 'admin'}">
		<a href="delete.shop?id=${user.userId}">[회원탈퇴]</a>&nbsp;
	</c:if>
	<c:if test="${loginUser.userId == 'admin'}">
		<a href="../admin/list.shop">[회원목록]</a>&nbsp;
	</c:if>
</div><br>



</div>
</body>
</html>