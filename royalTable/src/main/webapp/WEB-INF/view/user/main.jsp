<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>메인 화면 테스트</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<style>
    html, body {
      position: relative;
      height: 100%;
    }
    body {
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 1000px;
      height: 500px;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    .menu {
    	width:1000px;
    	height:500px;
    }
  </style>
</head>
<!-- 
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Karma", sans-serif
}
.w3-bar-block .w3-bar-item {
	padding: 20px
}
.mySlides {
	display: none;
}
</style>
 -->




<body>

<!-- 자동 슬라이드 -->
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img src="../user/img/갈비찜.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/계란말이.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/미역국.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/보쌈.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/불고기.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/잡채.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/제육볶음.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/콩나물국.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/감자조림.jpg" class="menu"></div>
      <div class="swiper-slide"><img src="../user/img/닭볶음탕.jpg" class="menu"></div>
    </div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
  </div>

  <!-- Swiper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
    	loop: true,
    spaceBetween: 30,
      centeredSlides: true,
      autoplay: {
        delay: 2500,
        disableOnInteraction: false,
      },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>




 
	<!-- Sidebar (hidden by default) -->

	<!-- <nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left" style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar"> -->
	<!--  <a href="javascript:void(0)" onclick="w3_close()"
  class="w3-bar-item w3-button">Close Menu</a>
  <a href="#food" onclick="w3_close()" class="w3-bar-item ">Food</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">고기류</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">해물류</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">채소류</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">기타류</a> -->
	<!-- </nav> -->

<!-- 
	<div class="w3-content w3-section" style="width: 100%;">
		<img class="mySlides" src="돼지불고기.jpg"
			style="width: 900px; height: 400px; margin-left: auto; margin-right: auto;">
		<img class="mySlides" src="img/기타/콩나물국.jpg"
			style="width: 900px; height: 400px; margin-left: auto; margin-right: auto;">
		<img class="mySlides" src="img/채소류/배추김치.jpg"
			style="width: 900px; height: 400px; margin-left: auto; margin-right: auto;">
	</div>

	<script>
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 5000); // Change image every 5 seconds
		}
	</script>
 -->
	
	<hr>
	<!-- !PAGE CONTENT! -->
	<div>

		<!-- First Photo Grid-->
		<span style="font-size:20px;">고기류</span> 
			<a href="#"><button class="w3-btn w3-black" style="float: right;">더보기+</button></a>
		<div class="w3-row-padding w3-padding-16 w3-center" id="food">
			<div class="w3-quarter">
				<a href="../item/detail.shop"><img src="../user/img/갈비찜.jpg"  alt="갈비찜" style="width: 100%; height:250px;"></a>
				<h5>갈비찜</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/닭볶음탕.jpg" alt="닭볶음탕" style="width: 100%; height:250px;">
				<h5>닭볶음탕</h5>
				
			</div>
			<div class="w3-quarter">
				<img src="../user/img/보쌈.jpg" alt="보쌈" style="width: 100%; height:250px;">
				<h5>보쌈</h5>
				
			</div>
			<div class="w3-quarter">
				<img src="../user/img/불고기.jpg" alt="불고기" style="width: 100%; height:250px;">
				<h5>불고기</h5>
			</div>
		</div>
<br>
		<!-- Second Photo Grid-->
		<span style="font-size:20px;">해물류</span> 
			<a href="#"><button class="w3-btn w3-black" style="float: right;">더보기+</button></a>
		<div class="w3-row-padding w3-padding-16 w3-center">
			<div class="w3-quarter">
				<img src="../user/img/멸치볶음.jpg" alt="멸치볶음" style="width: 100%; height:250px;">
				<h5>멸치볶음</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/진미채.jpg" alt="진미채" style="width: 100%; height:250px;">
				<h5>진미채</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/미역국.jpg" alt="미역국" style="width: 100%; height:250px;">
				<h5>미역국</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/된장국.jpg" alt="된장국" style="width: 100%; height:250px;">
				<h5>된장국</h5>
			</div>
		</div>
<br>
		<!-- third Photo Grid-->
		<span style="font-size:20px;">채소류</span> 
			<a href="#"><button class="w3-btn w3-black" style="float: right;">더보기+</button></a>
		<div class="w3-row-padding w3-padding-16 w3-center">
			<div class="w3-quarter">
				<img src="../user/img/감자조림.jpg" alt="감자조림" style="width: 100%; height:250px;">
				<h5>감자조림</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/배추김치.jpg" alt="배추김치" style="width: 100%; height:250px;">
				<h5>배추김치</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/장조림.jpg" alt="장조림" style="width: 100%; height:250px;">
				<h5>장조림</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/계란말이.jpg" alt="계란말이" style="width: 100%; height:250px;">
				<h5>계란말이</h5>
			</div>
		</div>
<br>
		<!-- fourth Photo Grid-->
		<span style="font-size:20px;">기타</span> 
			<a href="#"><button class="w3-btn w3-black" style="float: right;">더보기+</button></a>
		<div class="w3-row-padding w3-padding-16 w3-center">
			<div class="w3-quarter">
				<img src="../user/img/된장국.jpg" alt="된장국" style="width: 100%; height:250px;">
				<h5>된장국</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/콩나물국.jpg" alt="콩나물국" style="width: 100%; height:250px;">
				<h5>콩나물국</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/미역국.jpg" alt="미역국" style="width: 100%; height:250px;">
				<h5>미역국</h5>
			</div>
			<div class="w3-quarter">
				<img src="../user/img/진미채.jpg" alt="진미채" style="width: 100%; height:250px;">
				<h5>진미채</h5>
			</div>
		</div>
<br>

<%-- 
		<hr id="about">

		<!-- About Section -->
		<div class="w3-container w3-padding-32 w3-center">
			<h3>About Me, The Food Man</h3>
			<br> <img src="/w3images/chef.jpg" alt="Me" class="w3-image"
				style="display: block; margin: auto" width="800" height="533">
			<div class="w3-padding-32">
				<h4>
					<b>I am Who I Am!</b>
				</h4>
				<h6>
					<i>With Passion For Real, Good Food</i>
				</h6>
				<p>Just me, myself and I, exploring the universe of unknownment.
					I have a heart of love and an interest of lorem ipsum and mauris
					neque quam blog. I want to share my world with you. Praesent
					tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta
					lectus vitae, ultricies congue gravida diam non fringilla. Praesent
					tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta
					lectus vitae, ultricies congue gravida diam non fringilla.</p>
			</div>
		</div>
		<hr>
--%>
		<!-- Footer -->
		<footer class="w3-row-padding w3-padding-32">
			<div class="w3-third">
				<h3>FOOTER</h3>
				<p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo
					condimentum, porta lectus vitae, ultricies congue gravida diam non
					fringilla.</p>
				<p>
					Powered by <a href="https://www.w3schools.com/w3css/default.asp"
						target="_blank">w3.css</a>
				</p>
			</div>

			<div class="w3-third">
				<h3>BLOG POSTS</h3>
				<ul class="w3-ul w3-hoverable">
					<li class="w3-padding-16"><img src="/w3images/workshop.jpg"
						class="w3-left w3-margin-right" style="width: 50px"> <span
						class="w3-large">Lorem</span><br> <span>Sed mattis
							nunc</span></li>
					<li class="w3-padding-16"><img src="/w3images/gondol.jpg"
						class="w3-left w3-margin-right" style="width: 50px"> <span
						class="w3-large">Ipsum</span><br> <span>Praes tinci
							sed</span></li>
				</ul>
			</div>

			<div class="w3-third w3-serif">
				<h3>POPULAR TAGS</h3>
				<p>
					<span class="w3-tag w3-black w3-margin-bottom">Royal</span> <span
						class="w3-tag w3-dark-grey w3-small w3-margin-bottom">음식</span> <span
						class="w3-tag w3-dark-grey w3-small w3-margin-bottom">반찬</span> <span
						class="w3-tag w3-dark-grey w3-small w3-margin-bottom">잡채</span> <span
						class="w3-tag w3-dark-grey w3-small w3-margin-bottom">된장국</span> <span
						class="w3-tag w3-dark-grey w3-small w3-margin-bottom">고기류</span> <span
						class="w3-tag w3-dark-grey w3-small w3-margin-bottom">불고기</span> <span
						class="w3-tag w3-dark-grey w3-small w3-margin-bottom">멸치볶음</span>
					<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">커스터마이징</span>
					<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">장조림</span>
					<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">감자조림</span>
					<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">계란말이</span>
					<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">계란말이</span>
					<span class="w3-tag w3-dark-grey w3-small w3-margin-bottom">맛있다</span>
				</p>
			</div>
		</footer>

		<!-- End page content -->
	</div>

	<!-- <script>
// Script to open and close sidebar
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
}
 
function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>
 -->



<%-- 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보</title>
</head>
<body>
<h2>환영합니다. ${sessionScope.loginUser.userName}님</h2>
<a href="mypage.shop?id=${loginUser.userId}">mypage</a><br>
<a href="logout.shop">로그아웃</a>
--%>

</body>
</html>