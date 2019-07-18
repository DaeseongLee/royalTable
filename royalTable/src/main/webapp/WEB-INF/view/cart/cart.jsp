<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/odr.css" type="text/css">
<script type="text/javascript">
	function allchkbox(allchk) {
		var chks = document.getElementsByName("idchks");
		for(var i = 0; i < chks.length; i++){
			chks[i].checked = allchk.checked;
		}
	}
	//click 함수를 사용하지 않고 on() 함수를 사용해서 click이벤트 감지.. 이렇게 안하면 새로만들어진 버튼에 이벤트가 안걸림
  $(document).ready(function(){
		$(document).on('click','.del',function(){
			$('.odr_slt_btn').parent().remove();
		});
		$(document).on('click','.w_del',function(){
			$('.odr_slt_btn').parent().remove();
		});
		$(document).on('click','.del',function(){
			$('.del_bx').parent().remove();
		});
  });

</script>
<script type="text/javascript">
$(document).ready(function() {
 
	/* Set rates + misc */
	var taxRate = 0.05;
	var shippingRate = 15.00; 
	var fadeTime = 300;
 
/* Assign actions */
$('.product-quantity input').change( function() {
	updateQuantity(this);
});
 
$('.product-removal button').click( function() {
	removeItem(this);
});
 
 
/* Recalculate cart */
function recalculateCart() {
  var subtotal = 0;
   
  /* Sum up row totals */
  $('.product').each(function () {
    subtotal += parseFloat($(this).children('.product-line-price').text());
  });
   
  /* Calculate totals */
  var tax = subtotal * taxRate;
  var shipping = (subtotal > 0 ? shippingRate : 0);
  var total = subtotal + tax + shipping;
   
  /* Update totals display */
	$('.totals-value').fadeOut(fadeTime, function() {
		$('#cart-subtotal').html(subtotal.toFixed(2));
		$('#cart-tax').html(tax.toFixed(2));
		$('#cart-shipping').html(shipping.toFixed(2));
		$('#cart-total').html(total.toFixed(2));
		if(total == 0){
			$('.checkout').fadeOut(fadeTime);
		}else{
			$('.checkout').fadeIn(fadeTime);
		}
		$('.totals-value').fadeIn(fadeTime);
	});
}
 
/* Update quantity */
function updateQuantity(quantityInput) {
/* Calculate line price */
	var productRow = $(quantityInput).parent().parent();
	var price = parseFloat(productRow.children('.product-price').text());
	var quantity = $(quantityInput).val();
	var linePrice = price * quantity;
 
/* Update line price display and recalc cart totals */
	productRow.children('.product-line-price').each(function () {
		$(this).fadeOut(fadeTime, function() {
		$(this).text(linePrice.toFixed(2));
			recalculateCart();
		$(this).fadeIn(fadeTime);
		});
	});  
}
 
	/* Remove item from cart */
	function removeItem(removeButton) {
	  /* Remove row from DOM and recalc cart total */
		var productRow = $(removeButton).parent().parent();
		productRow.slideUp(fadeTime, function() {
			productRow.remove();
			recalculateCart();
		});
	}
 
});
</script>
<style type="text/css">
/* Global settings */

 
/* This is used as the traditional .clearfix class */
.group:before, .shopping-cart:before, .column-labels:before, .product:before, .totals-item:before,
.group:after,
.shopping-cart:after,
.column-labels:after,
.product:after,
.totals-item:after {
  content: '';
  display: table;
}
 
.group:after, .shopping-cart:after, .column-labels:after, .product:after, .totals-item:after {
  clear: both;
}
 
.group, .shopping-cart, .column-labels, .product, .totals-item {
  zoom: 1;
}
 
/* Apply clearfix in a few places */
/* Apply dollar signs */
.product .product-price:before, .product .product-line-price:before, .totals-value:before {
  content: '$';
}
 
/* Body/Header stuff */
body {
  padding: 0px 30px 30px 20px;
  font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-weight: 100;
}
 
h1 {
  font-weight: 100;
}
 
label {
  color: #aaa;
}
 
.shopping-cart {
  margin-top: -45px;
}
 
/* Column headers */
.column-labels label {
  padding-bottom: 15px;
  margin-bottom: 15px;
  border-bottom: 1px solid #eee;
}
.column-labels .product-image, .column-labels .product-details, .column-labels .product-removal {
  text-indent: -9999px;
}
 
/* Product entries */
.product {
  margin-bottom: 20px;
  padding-bottom: 10px;
  border-bottom: 1px solid #eee;
}
.product .product-image {
  text-align: center;
}
.product .product-image img {
  width: 100px;
}
.product .product-details .product-title {
  margin-right: 20px;
  font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
}
.product .product-details .product-description {
  margin: 5px 20px 5px 0;
  line-height: 1.4em;
}
.product .product-quantity input {
  width: 50%;
}
.product .remove-product {
  border: 0;
  padding: 4px 8px;
  background-color: #c66;
  color: #fff;
  font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
  font-size: 12px;
  border-radius: 3px;
}
.product .remove-product:hover {
  background-color: #a44;
}
 
/* Totals section */
.totals .totals-item {
  float: right;
  clear: both;
  width: 100%;
  margin-bottom: 10px;
}
.totals .totals-item label {
  float: left;
  clear: both;
  width: 79%;
  text-align: right;
}
.totals .totals-item .totals-value {
  float: right;
  width: 21%;
  text-align: right;
}
.totals .totals-item-total {
  font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
}
 
.checkout {
  float: right;
  border: 0;
  margin-top: 20px;
  padding: 6px 25px;
  background-color: #6b6;
  color: #fff;
  font-size: 25px;
  border-radius: 3px;
}
 
.checkout:hover {
  background-color: #494;
}
 
</style>

</head>
<body>
<!-- HEADER -->
<!-- 
<script type="text/javascript" src="//www.thebanchan.co.kr/common/js/order/overpass.cart.base.js?v=1563264496148"></script>
<script type="text/javascript" src="//www.thebanchan.co.kr/fo/js/order/overpass.cart.js?v=1563264496148"></script>
-->
	<!-- CONTENT -->
	<div id="content" class="content">
		<!-- WRAP -->
		<div class="wrap odr">
			<!-- .odr_car -->
			<h2 class="odr_cart_tit">장바구니</h2>
			<div class="odr_top">
				<ol style="list-style:none;">
					<li class="on"><em>01</em> 장바구니</li>
					<li><em>02</em>  주문서</li>
					<li><em>03</em> 결제완료</li>
				</ol>
			</div>
			<div class="odr_cart">
				<table class="odr_tbl">
					<!-- 
					<caption>장바구니 | 제품전체선택, 제품정보, 판매금액, 수량, 구매금액, 선택으로 이루어진 장바구니</caption>
					-->
					<col style="width:5%" /> <!-- 체크박스 -->
					<col style="width:30%" /> <!-- 제품정보 -->
					<col style="width:20%" /> <!-- 판매금액 -->
					<col style="width:10%" /> <!-- 수량 -->
					<col style="width:20%" /> <!-- 구매금액 -->
					<col style="width:15%" /> <!-- 선택 -->
					<thead>
						<tr>
							<th scope="col">
								<input type="checkbox" name="allchk" onchange="allchkbox(this)">
								<label for="crt_all">제품전체선택</label>
							</th>
							<th scope="col">제품정보</th>
							<th scope="col">판매금액</th>
							<th scope="col">수량</th>
							<th scope="col">구매금액</th>
							<th scope="col"><span class="ir">선택</span></th>
						</tr>
					</thead>
					<tbody>
					<c:set var="tot" value="${0}"/> <!-- tot을 정수값으로 지정하는 설정 -->
					<c:forEach items="${cartlist}" var="cart">						
						<tr>
							<td class="chck"><!-- 체크박스 -->
								<input type="checkbox" name="idchks" value="${cart.menuName}">
							</td>
							<td class="info"><!-- 제품정보 -->
								<div class="img">
									<a href="/royalTable/item/detail.shop?menuNo=${cart.menuNo}"><img src="../item/img/${cart.menuName}" width="100" height="100" />
									</a>
								</div>
								<div class="txt"><span class="name">[로얄식탁] ${cart.menuName}</span>
									<span class="opt">옵션1, 옵션2..</span>
								</div>
							</td>
							<td class="product-price"><!-- 판매금액 -->
								<span class="om"><em class="thm">${cart.price}</em>원</span>
							</td>
				            <td class="product-quantity" ><!-- 수량 변경 -->
		  					  	<input type="number" value="${cart.quantity}" min="1">
				         	</td>
				         	<!-- 구매금액 -->
				         	<td class="product-line-price">${cart.price*cart.quantity}원</td>
						<%-- 	<td class="prc_dl"><!-- 구매금액 -->
								<span class="thm">${itemSet.item.price*itemSet.quantity}</span><em>원</em>
							</td> --%>
							<td class="product-removal"> <!-- 삭제선택 -->
								<button class="remove-product">삭제</button>
							</td>
						</tr>
						<c:set var="tot" value="${tot + (cart.price*cart.quantity)}" />
					</c:forEach>
					</tbody>
				</table>
			<div class="odr_slt_btn"><!-- 제품 삭제 선택 -->
					<span>선택한 항목</span>
					<button type="button" class="del" title="선택한 항목 삭제하기" name="delete_button" data-role="checked" ><em>삭제</em></button>
					<button type="button" class="w_del" title="품절/매진제품 전체 삭제" name="delete_button" data-role="sellout" style="display: none;" ><em>품절/매진제품 전체 삭제</em></button>
			</div>
			
			<div class="cart_info">
					주문 마감은 <em>오후9시</em>입니다.
				<br />
				<c:choose>
					<c:when test="${empty cartlist}">
						<span>주문취소는 주문마감 이전만 가능하며 부분취소는 불가능하며 주문마감시간 이후 추가주문은 불가능 합니다.</span> 
					</c:when>
					<c:otherwise>
						<span>즉시 취소는 결제완료 단계까지 가능하며 제품 준비중 단계에서는 취소가 불가합니다.</span>
					</c:otherwise>
				</c:choose>
				
				<div class="odr_total type1">
					<dl class="prd_sum">
						<dt>제품금액</dt>
						<dd><span class="thm" id="total_sale_price">${tot}</span><em>원</em></dd>
					</dl>
					<dl class="dis_sum">
						<dt><span class="icon plus">더하기</span>배송비</dt>
						<!-- 포인트 수정할것 -->
						<dd><span class="thm" id="total_dc_amt">2500</span><em>원</em></dd>
					</dl>
					<dl class="cart_sum">
						<dt><span class="icon equal">계산결과</span>주문 합계금액</dt>
						<dd>
							<span class="thm" id="total_price">${tot+2500}</span><em>원</em>
							<!-- 포인트 수정할것 -->
							<span class="deposit" style="display:none">(예정적립금 <span class="thm" id="total_save_amt">0</span>원)</span>
						</dd>
					</dl>
<%--     <div class="totals">
	    <div class="totals-item">
	      <label>구매금액</label>
	      <div class="totals-value" id="cart-subtotal">${tot}원</div>
	   	</div>
		<div class="totals-item">
		   <label>배송비</label>
			<div class="totals-value" id="cart-shipping">2500원</div>
		</div>
	    <div class="totals-item totals-item-total">
	      <label>결제금액</label>
	      <div class="totals-value" id="cart-total">${tot+2500}원</div>
	    </div>
	  	</div>
	      <button class="checkout">주문하기</button>
	</div> --%>
					<button class="sel_date" id="set_order_date_button" style="border:0;"onclick="location.href='/royalTable/cart/orderform.shop'"><em>선택제품 주문</em></button>	
				</div>
			<br>
			<span class="odr_total_caution point" style="margin:auto;">* 결제 금액 기준 <strong>45,000원 이상 구매고객은 무료배송</strong> 혜택을 드리고 있습니다.</span>
			<span class="odr_total_caution">* 주문 합계금액은 배송비와 할인금액이 확정되지 않은 예정 금액임을 알려드립니다.</span>
				<div class="info_box01">
					<strong class="box_tit">장바구니 이용안내</strong>
					<ul class="list_01" style="text-align:left;">
						<li>주말주문폭주로 인해 배송이 지연될 수 있으니 수/목/금 구매를 권해 드립니다.</li>
						<li>오랫동안 장바구니에 보관된 상품을 주문하실 경우, 가격이나 혜택이 변동 될 수 있습니다.</li>
						<li>장바구니에 담긴 상품은 30일 동안만 보관할 수 있습니다.</li>
						<li>구매하기 선택 시, 구매시점에 품절된 상품은 제외하고 주문이 진행됩니다.</li>
						<li>주문 마감은 매일 오전 6시, 오후 1시이며, 일요일 및 공휴일 배송이 없습니다.</li>
						<li>세븐데이는 매주 제품이 변경됩니다. 세븐데이를 선택하시면 해당하는 주에만 주문이 가능합니다.</li>
						<li>기간이 한정되어 있지 않은 일반 상품의 희망배송일 지정 가능일은 주문 가능일로 부터 30일(1개월) 입니다.</li>
					</ul>
				</div>
			</div>
			<!-- //.odr_cart -->
		</div>
		<!--// WRAP -->
	</div>
	<!-- //CONTENT -->
	</div>
</body>
</html>