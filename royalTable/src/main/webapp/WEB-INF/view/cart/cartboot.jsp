<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
		$(document).on('click','.del',function(){
			$('.del_bx').parent().remove();
		});
  });
</script>
<script type="text/javascript">
$(document).ready(function() {
 
/* Set rates + misc */
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
function recalculateCart()
{
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
function updateQuantity(quantityInput)
{
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
function removeItem(removeButton)
{
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function() {
    productRow.remove();
    recalculateCart();
  });
}
 
});
</script>

<style>
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

.odr_cart{width:1060px;margin:0 auto;}
.odr_cart ul.list_01 li{color:#666;}

.odr_tbl{width:100%;border-bottom:1px solid #ddd;border-collapse:separate;}
.odr_tbl thead tr th{height:40px;border-top:#222 1px solid;border-bottom:#dbdbdb 1px solid;letter-spacing:-1px;color:#222; font-size:12px;}
.ie678 table.odr_tbl thead th:after{top:41px;}
.odr_tbl tbody td{padding:20px 0;border-top:1px solid #ededed;text-align:center;}
.odr_tbl tbody td.chck{padding-top:63px;vertical-align:top;}
.odr_tbl label{display:block;overflow:hidden;position:absolute;top:-1000em;left:0;z-index:-1;height:0;}
.odr_tbl tbody .info, .odr_tbl tbody .prc_ori, .odr_tbl tbody .qty_set, .odr_tbl tbody .prc_dl, .odr_tbl tbody .exp, .odr_tbl tbody .func_btn{vertical-align:top;}
.odr_tbl tbody .prc_ori{padding-top:38px;color:#767676;}
.odr_tbl tbody .prc_ori span{display:block;letter-spacing:0;}
.odr_tbl tbody .prc_ori span.rm{text-decoration:line-through;color:#999;}
.odr_tbl tbody .qty_set{padding-top:30px;text-align:center;}
.odr_tbl tbody .prc_dl{padding-top:37px;}
.odr_tbl tbody .exp{padding-top:37px;}
.odr_tbl tbody .exp .exp_date{position:relative;height:16px;margin-top:7px;}
.odr_tbl tbody .exp .exp_date .exp_body{position:absolute;top:0;bottom:0;width:120px;margin:auto;}
.odr_tbl tbody .func_btn{padding-top:30px;}
.odr_tbl tbody .func_btn .btn{width:100%;text-align:center;}
.odr_tbl tbody .func_btn .del_bx{width:100%;text-align:center;}
.odr_tbl tbody .soldout + .func_btn{padding:0;vertical-align:middle;}

.odr_slt_btn{overflow:hidden;margin:20px 0 0 0;padding:0 0 0 20px;}
.odr_slt_btn span{display:block;float:left;margin:0 10px 0 0;line-height:28px;color:#333;}
.odr_slt_btn button{display:block;float:left;height:28px;border:#dbdbdb 1px solid;background:#fff;}
.odr_slt_btn button em{display:block;margin:-2px 0 0 0;color:#333;}
.odr_slt_btn button.del{width:78px;}
.odr_slt_btn button.w_del{width:173px;margin:0 0 0 4px;}
.odr_slt_btn button.crt{width:78px;}
.odr_slt_btn button.crt em{display:block;width:54px;margin:-2px auto 0 auto;background:url(../../images/ko/order/arrow_02.png) no-repeat right 2px;line-height:1;text-align:left;letter-spacing:-1px;color:#222;}

.odr_tbl .info{position:relative;}
.odr_tbl .info .img a{position:absolute;top:20px;left:0;}
.odr_tbl .info .img a img{display:block;max-width:100px;height:auto;}
.odr_tbl .info .img a .out{position:absolute;top:72px;left:0;width:100px;height:28px;background:url(../images/odr/bg_out.png) no-repeat 0 0;line-height:26px;text-align:center;color:#fff;}
.odr_tbl .info .txt{min-height:100px;padding:0 60px 0 126px;text-align:left;}
.odr_tbl .info .txt .name{display:inline-block;width:300px;margin-bottom:3px;font-size:14px;color:#000;}
.odr_tbl .info .txt .name .arrow_btn01{margin:0 0 0 10px;padding:0 8px;letter-spacing:-1px;}
.odr_tbl .info .txt .name .arrow_btn01.some{color:#f7702e;}
.odr_tbl .info .txt .opt{display:block;color:#767676;line-height:18px;}
.odr_tbl .info .txt .opt .thm{letter-spacing:0;}
.odr_tbl .info .txt .opt.set{margin-top:3px;}
.odr_tbl .info .txt .opt.seven.long > span{display:block;overflow:hidden;position:relative;height:72px;padding-right:10px;font-size:12px;line-height:18px;}
.odr_tbl .info .txt .opt.seven.long > span:after{position:absolute;right:-10px;bottom:0;padding:0 11px 4px 45px;content:"…";font-size:14px;}


.odr_tbl .info .txt .opt.seven button{display:inline-block;margin-top:7px;padding-right:10px;color:#333;}
.odr_tbl .info .txt .opt.seven .close{display:none;background:url("../images/odr/arrow_up.png") no-repeat right center;}
.odr_tbl .info .txt .opt.seven .open{background:url("../images/odr/arrow_down.png") no-repeat right center;}
.odr_tbl .info .txt .opt.seven.on .close{display:inline-block;}
.odr_tbl .info .txt .opt.seven.on .open, .odr_tbl .info .txt .opt.seven.on > span:after{display:none;}
.odr_tbl .info .txt .opt.seven.on > span{height:auto;}
.odr_tbl .info .txt .opt.set + .opt, .odr_tbl .info .txt .opt.seven + .opt{margin-top:13px;}
.odr_tbl .info .txt .opt.set ul li{color:#767676;}
/*.odr_tbl .info .txt .opt.set ul li + li{margin-top:3px;}*/
.odr_tbl .info .txt .opt .friends{display:block;margin:2px 0 0 0;}

</style>

<style>
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
	  content: '￦';
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
		width:340px;
		height:56px;
		margin:29px 0 0;
		background:#f7702e;
		font-size:16px;
		font-weight:800;
		color:#fff;
		border-style:none;
	}
	 
}
</style>

</head>
<body>
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
			<col style="width:5%" /> <!-- 체크박스 -->
			<col style="width:20%" /> <!-- 제품정보 -->
			<col style="width:30%" /> <!-- 옵션 -->
			<col style="width:20%" /> <!-- 판매금액 -->
			<col style="width:5%" /> <!-- 수량 -->
			<col style="width:10%" /> <!-- 구매금액 -->
			<col style="width:10%" /> <!-- 선택 -->
			<thead>
				<tr>
					<th scope="col">
						<input type="checkbox" name="allchk" onchange="allchkbox(this)">
						<label for="crt_all">제품전체선택</label>
					</th>
					<th scope="col">제품정보</th>
					<th scope="col">옵션</th>
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
	  				<td class="chck">
	  					<input type="checkbox" name="idchks" value="${cart.menuName}">
	  				</td>
	  				<td class="info">
	  					<div class="img"><a href="/royalTable/item/detail.shop?menuNo=${cart.menuNo}"><img src="../item/img/${cart.menuName}" width="100" height="100"/>
									</a></div>
	  					<div class="txt"><span class="name">[로얄식탁] ${cart.menuName}</span></div>
	  				</td>
	  				<td class="product-options">
	  					<span>옵션1, 옵션2..</span>
	  				</td>
	  				<td class="product-price">
	  					<span>${cart.price}원</span>
	  				</td>
	  				<td class="product-quantity">
	  					<input type="number" value="${cart.quantity}" min="1">
	  				</td>
	  				<td class="product-line-price">
	  					<span>${cart.price*cart.quantity}원</span>
	  				</td>
	  				<td class="product-removal">
	  					<div class="product-removal">
						      <button class="remove-product">삭제</button>
					    </div>
	  				</td>
  				</tr>
  				<c:set var="tot" value="${tot + (cart.price*cart.quantity)}" />
				</c:forEach>
			</tbody>
		</table>
		<div class="odr_slt_btn"><!-- 제품 삭제 선택 -->
			<span>선택한 항목</span>
			<button type="button" class="del" title="선택한 항목 삭제하기" name="delete_button" data-role="checked" ><em>삭제</em></button>
		</div>
	</div>
	  			
	<div class="totals">
	  <div class="totals-item">
	    <label>구매금액</label>
	    <div class="totals-value" id="cart-subtotal">${tot + (itemSet.item.price*itemSet.quantity)}</div>
	  </div>
	  <div class="totals-item">
	    <label>배송비</label>
	    <div class="totals-value" id="cart-shipping">2500</div>
	  </div>
	  <div class="totals-item totals-item-total">
	    <label>결제금액</label>
	    <div class="totals-value" id="cart-total">${tot+2500}</div>
	  </div>
	</div>
	      <button class="checkout" onclick="location.href='/royalTable/cart/orderform.shop'">주문하기</button>
		<!-- WRAP -->
		</div>	
	<!-- content -->
	</div>
</body>
</html>