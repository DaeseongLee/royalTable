<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
   //수량 증감
   function increaseValue() {
     var value = parseInt(document.getElementById('number').value, 10);
     value = isNaN(value) ? 0 : value;
     value++;
     document.getElementById('number').value = value;
   }
   
   function decreaseValue() {
     var value = parseInt(document.getElementById('number').value, 10);
     value = isNaN(value) ? 0 : value;
     value < 1 ? value = 1 : '';
     value--;
     document.getElementById('number').value = value;
   }
</script>
<style type="text/css">
form {
  width: 300px;
  margin: 0 auto;
  text-align: center;
  padding-top: 50px;
}

.value-button {
  display: inline-block;
  border: 1px solid #ddd;
  margin: 0px;
  width: 40px;
  height: 20px;
  text-align: center;
  vertical-align: middle;
  padding: 11px 0;
  background: #eee;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.value-button:hover {
  cursor: pointer;
}

form #decrease {
  margin-right: -4px;
  border-radius: 8px 0 0 8px;
}

form #increase {
  margin-left: -4px;
  border-radius: 0 8px 8px 0;
}

form #input-wrap {
  margin: 0px;
  padding: 0px;
}

input#number {
  text-align: center;
  border: none;
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
  margin: 0px;
  width: 40px;
  height: 40px;
}

input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
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
               <col style="width:50px" />
               <col style="width:428px" />
               <col style="width:100px" />
               <col style="width:210px" />
               <col style="width:83px" />
               <col style="width:189px" />
               <thead>
                  <tr>
                     <th scope="col">
                        <input type="checkbox" name="allchk" onchange="allchkbox(this)">
                        <!-- 
                        <input type="checkbox" id="crt_all" name="cart_all_checkbox" checked="checked" />
                        -->
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
               <c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
                  <tr>
                     <td class="chck"><!-- 선택 -->
                        <!-- 
                        <input type="checkbox" id="crt_1" name="cart_checkbox" data-order-yn="N" data-cart-seq="1" data-svd-yn="N" checked="checked"  />
                        <label for="crt_1">${itemSet.item.name}</label>                        
                        -->
                        <input type="checkbox" name="idchks" value="${itemSet.item.name}">
                     </td>
                     <td class="info"><!-- 제품정보 -->
                        <div class="img">
                           <a href="javascript:void(0);" name="go_detail_button" data-cart-seq="1" ><img src="../item/img/${itemSet.item.pictureUrl}" width="100" height="100" alt="${itemSet.item.name}" />
                              <!-- 
                              <span class="ir">${itemSet.item.name}</span>
                              -->
                           </a>
                        </div>
                        <div class="txt"><span class="name">[로얄식탁] ${itemSet.item.name}</span>
                           <span class="opt">
                           </span>
                        </div>
                     </td>
                     <td class="prc_ori"><!-- 판매금액 -->
                        <span class="om"><em class="thm">${itemSet.item.price}</em>원</span>
                     </td>
                        <td class="w3-center" ><!-- 수량 변경 -->
                           <form>
                        <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value">-</div>
                           <input type="number" id="number" value="${itemSet.quantity}" />
                        <div class="value-button" id="increase" onclick="increaseValue()" value="Increase Value">+</div>
                          </form>
                        </td>
                        <!-- 
                     <td class="qty_set">
                        <div class="qty">
                           <input name="cart_qty" class="input" id="qty_1" data-cart-seq="1" type="text" maxlength="5" value="${itemSet.quantity}" title="옵션수량입력">
                           <button class="minus" name="change_qty_button" data-role="-" data-cart-seq="1" type="button" title="수량감소">수량감소</button>
                           <button class="plus" name="change_qty_button" data-role="+" data-cart-seq="1" type="button" title="수량증가">수량증가</button>
                        </div>
                        <button class="qty_edit" type="button" name="save_qty_button" data-cart-seq="1" title="수량수정">수정</button>
                     </td>
                     -->
                     <td class="prc_dl"><!-- 구매금액 -->
                        <span class="thm">${itemSet.item.price*itemSet.quantity}</span><em>원</em></td>
                     <td class="func_btn"><!-- 제품 삭제 선택 -->
                        <div class="del_bx">
                           <button class="del" type="button" title="제품삭제하기" name="delete_button" data-cart-seq="1"  data-role="cart" >삭제</button>
                        </div>
                     </td>
                  </tr>
                  <c:set var="tot" value="${tot + (itemSet.item.price*itemSet.quantity)}" />
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
               <c:when test="${empty cart.itemSetList}">
                  <span>주문취소는 주문마감 이전만 가능하며 부분취소는 불가능하며 주문마감시간 이후 추가주문은 불가능 합니다.</span> 
               </c:when>
               <c:otherwise>
                  <span>즉시 취소는 결제완료 단계까지 가능하며 제품 준비중 단계에서는 취소가 불가합니다.</span>
               </c:otherwise>
            </c:choose>
         <div class="odr_total type1">
         <!-- 
            <c:set var="tot" value="${tot + (itemSet.item.price*itemSet.quantity)}" />
         -->
            <dl class="prd_sum">
               <dt>제품금액</dt>
               <dd><span class="thm" id="total_sale_price">${tot}</span><em>원</em></dd>
            </dl>
            <dl class="dis_sum">
               <dt><span class="icon minus">빼기</span>예정 할인금액</dt>
               <!-- 포인트 수정할것 -->
               <dd><span class="thm" id="total_dc_amt">0</span><em>원</em></dd>
            </dl>
            <dl class="cart_sum">
               <dt><span class="icon equal">계산결과</span>주문 합계금액</dt>
               <dd>
                  <span class="thm" id="total_price">${tot}</span><em>원</em>
                  <!-- 포인트 수정할것 -->
                  <span class="deposit" style="display:none">(예정적립금 <span class="thm" id="total_save_amt">0</span>원)</span>
               </dd>
            </dl>
            <!-- 
            <button class="sel_date" id="set_order_date_button"><em>선택제품 주문</em></button>   
            -->      
            <div id="submit">
            <input type="button" value="선택제품 주문" onclick="location.href='${path}/cart/orderform.shop'">
            </div>
         </div>
         <span class="odr_total_caution point">* 결제 금액 기준 <strong>45,000원 이상 구매고객은 무료배송</strong> 혜택을 드리고 있습니다.</span>
         <span class="odr_total_caution">* 주문 합계금액은 배송비와 할인금액이 확정되지 않은 예정 금액임을 알려드립니다.</span>
            <div class="info_box01">
               <strong class="box_tit">장바구니 이용안내</strong>
               <ul class="list_01" style="list-style:none;">
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