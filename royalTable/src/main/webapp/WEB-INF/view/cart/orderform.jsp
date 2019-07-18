<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서</title>
<!-- 
<link rel="stylesheet" href="//www.thebanchan.co.kr/fo/css/odr.css" type="text/css">
-->
<link rel="stylesheet" href="../css/thebanchan.css" type="text/css">
<!-- 카드결제 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init('imp91187363');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
	                                                  //아임포트에서 설정 안할 시 pg에 쓰여있는 것 실행
			/*
			 'kakao':카카오페이,
			 html5_inicis':이니시스(웹표준결제)
			 'nice':나이스페이
			 'jtnet':제이티넷
			 'uplus':LG유플러스
			 'danal':다날
			 'payco':페이코
			 'syrup':시럽페이
			 'paypal':페이팔
			 */
	
			pay_method : pay_method,
			/*
			 'samsung':삼성페이,
			 'card':신용카드,
			 'trans':실시간계좌이체,
			 'vbank':가상계좌,
			 'phone':휴대폰소액결제
			 */
			merchant_uid : 'merchant_'
					+ new Date()
							.getTime(),
			/*
			 merchant_uid에 경우
			 https://docs.iamport.kr/implementation/payment
			 위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 참고하세요.
			 나중에 포스팅 해볼게요.
			 */
			name : productName,
			//결제창에서 보여질 이름
			amount : totalPrice,
			//가격
			buyer_email : buyer_email,
			buyer_name : buyer_name,
			buyer_tel : buyer_tel,
			buyer_addr : buyer_addr,
			buyer_postcode : buyer_postcode,
			m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		/*
		 모바일 결제시,
		 결제가 끝나고 랜딩되는 URL을 지정
		 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		 */
		},
		function(rsp) {
			console
					.log(rsp);
			if (rsp.success) {
				//결제성공시 여기서 처리!!!
				$('#form')
						.submit();
	
			} else {
				alert('결제에 실패하였습니다.');
			}
	
		});
</script>
<style>
.odr_insTbl .tr .td {
	font-color:black;
}
</style>
</head>
<body>
<!-- HEADER -->

<!-- CONTENT -->
	<div id="content" class="content">
	
		<!-- WRAP -->
		<div class="wrap odr">
			<!-- .odr_car -->
			<h2 class="odr_ins_tit">주문서</h2>
			<div class="odr_top">
				<ol style="list-style:none;">
					<li><em>01</em> 장바구니</li>
					<li class="on"><em>02</em>  주문서</li>
					<li><em>03</em> 결제완료</li>
				</ol>
			</div>
			
			<!-- odr_ins_top -->
			<div class="odr_insTop">
				<dl class="ntx">
					<dt>
						로얄식탁 고객님께<br />알려드립니다.
					</dt>
					<dd>
						* 제품의 특성상 주문취소는 <em>주문마감 이전만 가능</em>합니다. 출고당일 이미 조리된 제품(제품준비중 단계) 은
						취소가 불가능하니 유의하시기 바랍니다.
					</dd>
					<dd>
						* <em>주문마감은 <span class="orderSheetFinTime">오전 06시</span></em> 입니다. 또한 제품이 주문량만큼 익일 조리되어 바로 출고되기 때문에
						주문마감시간 이후 추가 주문이 불가능합니다.
					</dd>
					<dd>
						* 주말동안 많은 주문량으로 인해 배송이 지연될 수 있으니 <em>가급적 수/목/금 요일에 주문</em>해주시면 더욱
						편리하게 이용하실 수 있습니다.
					</dd>
					<dd>
						* 배송은 희망배송일 도착을 원칙으로 하나 <em>주문폭주, 천재지변(폭우,폭설 등 기타 자연재해), 택배사의 사정</em>등으로 인한 경우 배송이 지연될 수 있습니다.
					</dd>
				</dl>
				
				<table class="odr_insTbl">
					<colgroup>
						<col />
						<col style="width: 260px;" />
						<col style="width: 80px;" />
						<col style="width: 110px;" />
					</colgroup>
					<thead>
						<tr>
							<th scope="col">제품정보</th>
							<th scope="col">판매금액</th>
							<th scope="col">수량</th>
							<th scope="col">결제금액</th>
						</tr>
					</thead>
					<tbody>
					<c:set var="tot" value="${0}"/> <!-- tot을 정수값으로 지정하는 설정 -->
					<c:forEach items="${cart.itemSetList}" var="itemSet" varStatus="stat">
						<tr>
							<td><strong>${itemSet.item.name}</strong>
							<td>${itemSet.item.price}</td>
							<td>${itemSet.item.quantity}</td>
							<td>${itemSet.item.price*itemSet.quantity}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="odr_insCrt">
					<a href="javascript:void(0);" id="go_cart_button"><em>장바구니
							돌아가기</em></a>
				</div>
			</div>
			<!-- odr_ins_top -->
			
			<!-- odr_ins_sht -->
			<div class="odr_insWrap">
			<div class="odr_sheet">
				<h3>
					<span name="info_idx_area"></span>1. 주문자정보
				</h3>
				<table>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>주문자<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="orderer_nm">김유경</div></td>
							<!-- 
							<td><div class="inf" name="member_info_display"
									data-role="orderer_nm">${buyerinfo.recipientName}</div></td>
							-->
						</tr>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>휴대전화<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="cell_no">010-8815-5016</div></td>
							<!-- 
							<td><div class="inf" name="member_info_display"
									data-role="cell_no">${buyerinfo.recipientPhoneNum}</div></td>
							-->
						</tr>
						<tr 
							data-role="cert" data-cert-yn="Y">
							<th>이메일<em class="pt">*</em></th>
							<td><div class="inf" name="member_info_display"
									data-role="email">kyk7497@naver.com</div></td>
							<!-- 
							<td><div class="inf" name="member_info_display"
									data-role="email">${user.email}</div></td>
							-->
						</tr>
					</tbody>
				</table>
			</div>
			<div class="odr_sheet">
				<h3>
					<span name="info_idx_area"></span>2. 배송지정보
				</h3>
				<span class="dlv_tx">배송지 정보는 장바구니 화면에서 설정하셔야 하며 주문서에서는 수정할 수가
					없습니다</span>
				<table>
					<colgroup>
						<col style="width: 220px;" />
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th>받으시는 분<em class="pt">*</em></th>
							<td><div class="inf">김유경</div></td>
							<!-- 
							<td><div class="inf">${buyerinfo.recipientName}</div></td>
							-->
						</tr>
						<tr>
							<th>주소<em class="pt">*</em></th>
							<td><div class="inf">
									(08505)서울특별시 금천구 가산디지털2로 115 (가산동)
									509호 구디아카데미</div></td>
							<!-- 
							<td><div class="inf">
									${buyerinfo.recipientAddress}</div></td>
							-->
						</tr>
						<tr>
							<th>휴대전화<em class="pt">*</em></th>
							<td>
								<div class="inf">
									<span class="phone">010-8815-5016</span>
									<!-- 
									<span class="phone">${buyerinfo.recipientPhoneNum}</span>
									-->
								</div>
							</td>
						</tr>
						<tr>
							<th>배송정보<em class="pt">*</em></th>
							<td>
								<div class="inf"><!-- 수정할 것 -->
									<dl>
										<dt>새벽직배송</dt>
									</dl>
								</div>
							</td>
						</tr>
						<tr>
							<th>특이 요청사항 (50자)</th>
							<td>
								<div class="inf">
									<label for="ord_memo_cont" class="ir">특이 요청사항 입력</label>
									<textarea id="ord_memo_cont" cols="30" rows="5" maxlength="50"></textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				</div>
				
				<!-- odr_ins_fixed -->
				<div class="odr_insFixed">
					<div class="contain">
						<div class="top">
	
							<div class="dlv">새벽직배송
								7월19일(금)</div>
							<dl class="total">
								<dt>
									<b>최종결제정보</b>
								</dt>
								<dd class="tp">
									<strong>주문 합계 금액</strong><span><b id="total_goods_price">0</b>원</span>
								</dd>
								<dd class="tp">
									<strong>할인 적용 금액</strong><span><b
										name="total_dc_price_display">0</b>원</span>
									<p name="dc_price_list_display"></p>
								</dd>
								<dd class="tp">
									<strong>배송비</strong><span id="total_deli_price_display"><b>0</b>원</span>
									<p class="dv">
										<em>45,000원
											이상 구매 시 무료</em>
										
										<em name="use_deli_coupon_display" style="display: none;">배송비
											쿠폰 사용</em>
									</p>
								</dd>
								
							</dl>
							<div class="total_prc">
								<span class="prc"><strong>최종 결제금액</strong><span><b
										id="total_pay_amt_display">0</b>원</span></span> <span class="save" style="display:none">예정적립금
									: <b name="total_save_amt_display">0</b>원
								</span>
							</div>
						</div>
						<!-- 
						<button type="button" class="odr_total_ok" id="check_order_button">
							결제하기<em class="ir">주문확인레이어 열기</em>
						</button>
						-->
						<div id="submit">
							<button id="check_module" class="btn-primary btn-lg" value="결제하기"	type="button">결제하기</button>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {
						fn_odr_insFixed()
					})
				</script>
				<!--// odr_ins_fixed -->
			
			</div>
			<!--// odr_ins_sht -->
			
			</div>
			<!-- //WRAP -->
		</div>
<!-- //CONTENT -->
</body>
</html>