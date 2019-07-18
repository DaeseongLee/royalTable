<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>
<script type="text/javascript">
	$(document).ready(function(){
		//$("#ingreLine").show();
			location.href="redirect:/ingre/madd.shop"
		
		$(".ingreLine").each(function(){ // 주문상품 목록 숨김.
			$(this).hide();
		})
	})
		function list_disp(id) {
		$("#" + id).toggle(); 
	}
</script>
</head>
<body>

<%@ include file="/WEB-INF/view/jspbody.jsp" %>
	<div class="w3-main w3-container w3-right" style="width:850px; float:right;">

	<input style="float: right" type="button" value="등록" onclick="location.href='register.shop'">
<table>
	<tr><th>메뉴번호</th><th>메뉴명</th><th>가격</th><th>내용</th><th>카테고리</th><th>별점</th><th>사진</th><th>&nbsp;</th></tr>
	
		<c:forEach var="menu" items="${menulist}">
			<tr><td>${menu.menuNo}</td>
			<td><a style="color: blue;" href="javascript:list_disp('ingreLine${menu.menuNo}')">${menu.menuName}</a></td><td>${menu.mprice}</td>
			<td>${menu.content}</td><td>${menu.category}</td><td>0</td><td>${menu.imgurl}</td>
			<td>
				<a href="addMenu.shop?menuNo=${menu.menuNo}&menuName=${menu.menuName}">[재료등록]</a> 
			</td></tr>
		
		
		<tr id="ingreLine${menu.menuNo}" class="ingreLine">
				<td colspan="8" align="center">
					<table>
						<tr><th width="14%">재료이름</th><th width="14%">주재료여부</th>
							<th width="14%">1</th><th width="14%">2</th><th width="14%">3</th>
							<th width="14%">4</th><th width="14%">5</th></tr>
							<c:forEach var="IPM" items="${menu.IPMlist}" >
								<tr><td class="title">${IPM.ingreNo}</td>
									<td>${IPM.menuNo}</td>
									<td>${IPM.ifMain}</td>
									<td>${IPM.one}</td>
									<td>${IPM.two}</td>
									<td>${IPM.amount}</td>
									<td>${IPM.three}</td>
									<td>${IPM.four}</td>
									</tr>
									<tr id="saleLine${stat.index}" class="saleLine">
									
					
							</c:forEach>
					</table></td></tr>
		</c:forEach>
	
	<c:if test="${listcount==0}">
		<tr><td colspan="8">등록된 메뉴가 없습니다.</td></tr>
	</c:if>
</table><br>



</div>
</body>
</html>