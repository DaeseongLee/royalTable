<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>제품상세정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<style>
	body, h1, h2, h3, h4, h5, h6 {font-family: "Karma", sans-serif}
	.w3-bar-block .w3-bar-item {padding: 20px}
	.mySlides{display: none;}
	
	.star-input>.input,
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
	.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
	.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
	.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
	star-input>.input.focus{outline:1px dotted #ddd;}
	.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
	.star-input>.input>label:hover,
	.star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
	.star-input>.input>label:hover~label{background-image: none;}
	.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
	.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
	.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
	.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
	.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
	.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>
<script type="text/javascript">
$(function(){
	$('#decreaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var price = $('#price').text();
	var num = parseInt(stat,10);
	num--;


	if(num<=0){
	alert('더이상 줄일수 없습니다.');
	num =1;
	}
	var price2 = price*num;
	$('#totprice').text(price2);
	$('#numberUpDown').text(num);
	});
	
	$('#increaseQuantity').click(function(e){
	e.preventDefault();
	var stat = $('#numberUpDown').text();
	var price = parseInt($('#price').text(),10);
	var num = parseInt(stat,10);
	num++;
	
	if(num>5){
	alert('더이상 늘릴수 없습니다.');
	num=5;
	}
	
	var price2 = price*num;
	$('#totprice').text(price2);
	
	$('#numberUpDown').text(num);
	});
	
	$('#increaseMain').click(function(e){
		e.preventDefault();
		var stat = $('#numberMainUpDown').text();
		var price = parseInt($('#price').text(),10);
		var num = parseInt(stat,10);
		num++;
		
		if(num>5){
		alert('더이상 늘릴수 없습니다.');
		num=5;
		}
		
		var price2 = price*num;
		
		$('#numberMainUpDown').text(num);
		});
	
	
	
	$('#decreaseMain').click(function(e){
		e.preventDefault();
		var stat = $('#numberMainUpDown').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
		alert('더이상 줄일수 없습니다.');
		num =1;
		}
		$('#numberMainUpDown').text(num);
		});
	
	
	
	
	$('[name="increasePartMain"]').click(function(e){
		e.preventDefault();
		var stat = $('[name="numberPartUpDown"]').text();
		var num = parseInt(stat,10);
		num++;

		if(num>5){
		alert('더이상 늘릴수 없습니다.');
		num=5;
		}
		$('[name="numberPartUpDown"]').text(num);
		});
	$('[name="decreasePartMain"]').click(function(e){
		e.preventDefault();
		var stat = $('[name="numberPartUpDown"]').text();
		var num = parseInt(stat,10);
		num--;
		if(num<=0){
		alert('더이상 줄일수 없습니다.');
		num =1;
		}
		$('[name="numberPartUpDown"]').text(num);
		});
	
	
	});
</script>	
</head>
<body>
 <div class="w3-row w3-padding-64" id="about">
    <div class="w3-col m6 w3-padding-large w3-hide-small">
     <img src="/royalTable/item/된장국.jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="100%" height="100%">
    </div>
    <div class="w3-col m6 w3-padding-large">
      <h1 class="w3-center">미역국</h1><br>
       <span class="w3-center" style="font-size: 40px; margin-left:5%;">☆☆☆☆☆</span>
       <span class="w3-center" style="margin-left:5%;font-size: 20px;">평점  4.5<span style="font-size: 10px;" >(고객후기 : 3건)</span></span>
    <div class="w3-container">
		  <table class="w3-table w3-bordered" >
		    <tr>
		      <th class="w3-center">판매가격</th>
		      <td class="w3-center"><span id="price">2900</span></td>
		    </tr>
		    <tr>
		      <th class="w3-center">category</th>
		      <td class="w3-center" >기타</td>
		    </tr>
		    <tr>
		      <th class="w3-center"><h4>메뉴 수량</h4></th>
		      <td class="w3-center" >
		      	<div class="number">
		      	  <button type="button" class="btn btn-light" id="decreaseQuantity">-</button>
					<span id="numberUpDown">1</span>
				<button type="button" class="btn btn-light" id="increaseQuantity">+</button>
			</div>
			</td>
		    </tr>
		    <tr>
		      <th class="w3-center">미역</th>
		       <td class="w3-center">   	<div class="number">
		      	  <button type="button" class="btn btn-light" id="decreaseMain">-</button>
					<span id="numberMainUpDown">1</span>
				<button type="button" class="btn btn-light" id="increaseMain">+</button>
			</div></td>
		    </tr>
		    <tr>
		      <th class="w3-center" colspan="2">
		        <select class="form-control" id="sel1" name="sellist1">
        			<option>1</option>
       				<option>2</option>
        			<option>3</option>
        			<option>4</option>
      			</select>
		      </th>
		    </tr>
		    <tr>
		      	<th class="w3-center">된장</th>
		      	 <td class="w3-center"><div class="number">
		      	  <button type="button" class="btn btn-light" name="decreasePartMain">-</button>
					<span name="numberPartUpDown">1</span>
				<button type="button" class="btn btn-light" name="increasePartMain">+</button>
			</div></td>
		    </tr>
		    <tr>
		      	<th class="w3-center">소고기</th>
		      	 <td class="w3-center">3</td>
		    </tr>
		    <tr>
				<th class="w3-center">총 판매금액</th>
				<td class="w3-center"> <span id="totprice" style="font-size:25px;"></span></td>
		    </tr>
		    <tr>
		     	<th class="w3-center" colspan="2">
		     	  <a href="#"><button class="w3-btn w3-white w3-border w3-border-red w3-round-large">
		     	장바구니</button></a>
		     	 <a href="#"><button class="w3-btn w3-white w3-border w3-border-blue w3-round-large">
		     	구매하기</button></a>
		     	</th>
		    </tr>
		  </table>
		</div>
    </div>
 </div>
  <hr>
    
   	<div class="w3-main w3-content w3-padding"
		style="max-width: 1200px; margin-top: 100px">
		  
      <h3>추천제품</h3>
	 <a href="#" style="float:right;"><button class="w3-btn w3-white w3-border w3-border-white w3-round-large">
		     	더보기 + </button></a>
		<div class="w3-row-padding w3-padding-16 w3-center" id="food">
			<div class="w3-quarter">
				<img src="/royalTable/item/돼지불고기.jpg" alt="돼지불고기" style="width: 100%">
				<h3>돼지불고기</h3>
				<p>5900원</p>
			</div>
			<div class="w3-quarter">
				<img src="/royalTable/item/돼지불고기.jpg" alt="돼지불고기" style="width: 100%;">
					<h3>돼지불고기</h3>
				<p>5900원</p>
			</div>
			<div class="w3-quarter">
				<img src="/royalTable/item/돼지불고기.jpg" alt="Cherries" style="width: 100%">
					<h3>돼지불고기</h3>
				<p>5900원</p>
			</div>
			<div class="w3-quarter">
				<img src="/royalTable/item/돼지불고기.jpg" alt="Pasta and Wine"
					style="width: 100%">
					<h3>돼지불고기</h3>
				<p>5900원</p>
			</div>
		</div>
		<hr>
	</div>

<div class="container">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item" style="width:33.3%">
      <a class="nav-link active" data-toggle="tab" href="#home">제품정보</a>
    </li>
    <li class="nav-item" style="width:33.3%">
      <a class="nav-link" data-toggle="tab" href="#menu1">제품정보고시</a>
    </li>
    <li class="nav-item" style="width:33.3%">
      <a class="nav-link" data-toggle="tab" href="#menu2">고객후기</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
  		<div class="container">
  		<table class="table">
    <thead>
      <tr>
        <td style="width:30%;" class="table-secondary w3-center">품목제조보고번호</td>
        <td style="width:70%;">20090086449308</td>
      </tr>
    </thead>
    <tbody>
      <tr>
       <td class="table-secondary w3-center">특정성분</td>
        <td>닭고기13.9%, 황기0.2%
</td>
      </tr>
     <tr>
       <td class="table-secondary w3-center">식품의 유형</td>
        <td>즉석조리식품/가열하여 섭취하는 냉동식품</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">생산자 및 소재지</td>
        <td>(주)동원홈푸드 가산공장/서울특별시 금천구 서부샛길 280</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">유통기한 또는 품질유지기한</td>
        <td>제조일로부터 냉동 180일</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">내용량</td>
        <td>650 g</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">원재료명 및 함량</td>
        <td>야채육수{무(국내산),대파(국내산),
        북어뼈,다시마,표고버섯},
        무(국내산),닭고기(국내산),
        대파,천일염,황기(중국산),
        W푸드마켓자연재료믹스A,
        마늘,L-글루탐산나트륨제제{L-글루탐산나트륨(향미증진제),
        5'-리보뉴클레오티드이나트륨},
        후추 *대두,밀,닭고기,쇠고기 함유</td>
      </tr>
         <tr>
       <td class="table-secondary w3-center">섭취방법</td>
        <td>가열 후 섭취</td>
      </tr>
         <tr>
       <td class="table-secondary w3-center">보관방법 / 취급방법</td>
        <td>냉동보관(-18℃이하)/이미 냉동된 바 있으니 해동 후 재냉동시키지 마시길 바랍니다.</td>
      </tr>
         <tr>
       <td class="table-secondary w3-center">포장재질</td>
        <td>용기:PP,상단필름:PE</td>
      </tr>
        <tr>
       <td class="table-secondary w3-center">알레르기 식품</td>
        <td>본 제품은 난류,우유,메밀,땅콩,고등어,게,새우,돼지고기,복숭아,토마토,아황산류,호두,오징어,조개류를 사용한 제품과 같은 제조 시설에서 제조하고 있습니다.</td>
      </tr>
       <tr>
       <td class="table-secondary w3-center">소비자상담 관련 전화번호</td>
        <td>1644-6844</td>
      </tr>
    </tbody>
  </table>
  		</div>
    </div>
   	 
   	 
   	 <div id="menu2" class="container tab-pane fade"><br>
      <div class="container">
     <span class="w3-center" style="font-size: 40px;">사용자 총 평점</span>
       <span class="w3-center" style="font-size: 40px; margin-left:5%;">☆☆☆☆☆</span>
       <span  class="w3-center" style="margin-left:5%;font-size: 20px;">평점  4.5<span style="font-size: 10px;" >(고객후기 : 3건)</span></span>
        <a href="#" style="float:right;"><button class="w3-btn w3-white w3-border w3-border-white w3-round-large">
		     	고객후기작성 </button></a>
      </div>
      <hr>
    <div class="w3-container">
       <span class="star-input">
		<span class="input">
			<input type="radio" name="star-input" value="1" id="p1">
			<label for="p1">1</label>
			<input type="radio" name="star-input" value="2" id="p2">
			<label for="p2">2</label>
			<input type="radio" name="star-input" value="3" id="p3">
			<label for="p3">3</label>
			<input type="radio" name="star-input" value="4" id="p4">
			<label for="p4">4</label>
			<input type="radio" name="star-input" value="5" id="p5">
			<label for="p5">5</label>
		</span>
		<output for="star-input">
			<b>1</b>
		</output>       
       </span>
       <script src="js/jquery-1.11.3.min.js"></script>
       <script src="js/star.js"></script>
       <span class="w3-center" style="margin-left:2%">이대성 </span><span class="w3-center" style="margin-left:5%">2019.07.15</span>
       <br>
       <p style="font-size: 20px;">
       	안녕하세요. 불고기가 너무 맛있습니다.
       </p>
    </div>
  </div>
</div>	
</div>

</body>
</html>