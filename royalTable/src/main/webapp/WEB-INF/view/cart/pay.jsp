<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
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
</head>
<body>
<div id="submit">
	<button id="check_module" class="btn-primary btn-lg" value="결제하기"
		type="button">결제하기</button>
</div>
</body>
</html>