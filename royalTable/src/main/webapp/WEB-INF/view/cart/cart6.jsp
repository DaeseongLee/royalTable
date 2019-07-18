<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>장바구니</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
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
 
.product-image {
  float: left;
  width: 20%;
}
 
.product-details {
  float: left;
  width: 37%;
}
 
.product-price {
  float: left;
  width: 12%;
}
 
.product-quantity {
  float: left;
  width: 10%;
}
 
.product-removal {
  float: left;
  width: 9%;
}
 
.product-line-price {
  float: left;
  width: 12%;
  text-align: right;
}
 
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
  width: 40px;
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
 
/* Make adjustments for tablet */
@media screen and (max-width: 650px) {
  .shopping-cart {
    margin: 0;
    padding-top: 20px;
    border-top: 1px solid #eee;
  }
 
  .column-labels {
    display: none;
  }
 
  .product-image {
    float: right;
    width: auto;
  }
  .product-image img {
    margin: 0 0 10px 10px;
  }
 
  .product-details {
    float: none;
    margin-bottom: 10px;
    width: auto;
  }
 
  .product-price {
    clear: both;
    width: 70px;
  }
 
  .product-quantity {
    width: 100px;
  }
  .product-quantity input {
    margin-left: 20px;
  }
 
  .product-quantity:before {
    content: 'x';
  }
 
  .product-removal {
    width: auto;
  }
 
  .product-line-price {
    float: right;
    width: 70px;
  }
}
/* Make more adjustments for phone */
@media screen and (max-width: 350px) {
  .product-removal {
    float: right;
  }
 
  .product-line-price {
    float: right;
    clear: left;
    width: auto;
    margin-top: 10px;
  }
 
  .product .product-line-price:before {
    content: 'Item Total: $';
  }
 
  .totals .totals-item label {
    width: 60%;
  }
  .totals .totals-item .totals-value {
    width: 40%;
  }
}
</style>
<style type="text/css">
.wrap.odr{position:relative;width:1060px;margin:0 auto;padding:64px 0 100px 0;}

.odr h2.odr_cart_tit{display:block;height:36px;margin:0 0 18px 0;padding-left:52px;background:url(../images/odr/ico_tit_cart.png) no-repeat 8px center;font-size:32px;font-weight:800;line-height:36px;text-align:left;letter-spacing:-1.5px;color:#363441;}
.odr h2.odr_ins_tit{display:block;height:36px;margin:0 0 18px 0;padding-left:48px;background:url(../images/odr/ico_tit_ins.png) no-repeat 14px center;font-size:32px;font-weight:800;line-height:30px;text-align:left;letter-spacing:-1.5px;color:#363441;}
.odr_top{overflow:hidden;position:absolute;top:12px;right:0;}
.odr_top h2{padding-left:52px;background:url("../images/odr/ico_cart.png") no-repeat 9px center;font-size:32px;font-weight:800;text-align:left;}
.odr_top ol{display:inline-block;}
.odr_top ol li{float:left;width:auto;height:48px;font-size:18px;font-weight:bold;line-height:45px;letter-spacing:-1px;color:#999;}
.odr_top ol li em{font-weight:bold;letter-spacing:0;}
.odr_top ol li + li{margin:0 0 0 12px;padding-left:22px;background:url(../images/odr/arrow_right.png) no-repeat 0 center;}
.odr_top ol li.on{font-size:18px;font-weight:bold;color:#f60;}
.odr_top ol li.on + li{background:url(../images/odr/arrow_right_on.png) no-repeat 0 center;}
</style>
</head>
<body>
<!-- 
<h1>장바구니</h1><Br>
-->
<h2 class="odr_cart_tit">장바구니</h2>
<div class="odr_top">
	<ol style="list-style:none;">
		<li class="on"><em>01</em> 장바구니</li>
		<li><em>02</em>  주문서</li>
		<li><em>03</em> 결제완료</li>
	</ol>
</div>
<div class="shopping-cart">
 
	<div class="column-labels">
		<label class="product-image">이미지</label>
		<label class="product-details">제품정보</label>
		<label class="product-price">판매가격</label>
		<label class="product-quantity">수량</label>
		<label class="product-removal">삭제</label>
		<label class="product-line-price">구매가격</label>
	</div>
 
 <c:set var="tot" value="${0}"/> <!-- tot을 정수값으로 지정하는 설정 -->
 <c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
 
	<div class="product">
	
		<div class="product-image"><!-- 이미지 -->
			<a href="javascript:void(0);">
			 	<img src="../item/img/${itemSet.item.pictureUrl}">
			</a>
		</div>
		<div class="product-details"><!-- 제품정보 -->
		  <div class="product-title">${itemSet.item.name}</div>
		  <p class="product-description">[로얄식탁] ${itemSet.item.name}</p>
		</div>
		<!-- 판매금액 -->
		<div class="product-price">${itemSet.item.price}원</div>
		<div class="product-quantity"><!-- 수량 -->
		  <input type="number" value="${itemSet.quantity}" min="1">
		</div>
		<div class="product-removal"><!-- 삭제 -->
		  <button class="remove-product">
		   	 삭제
		  </button>
		</div>
		<!-- 구매금액 -->
		<div class="product-line-price">${itemSet.item.price*itemSet.quantity}원</div>
	
	</div>
  <c:set var="tot" value="${tot + (itemSet.item.price*itemSet.quantity)}" />
 </c:forEach>

  <div class="totals">
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
</div>
</body>
