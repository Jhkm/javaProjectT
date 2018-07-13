<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>보드행</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script>
	function getCookie(cookie_name) {
		var x, y;
		var val = document.cookie.split(';');

		for (var i = 0; i < val.length; i++) {
			x = val[i].substr(0, val[i].indexOf('='));
			y = val[i].substr(val[i].indexOf('=') + 1);
			x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
			if (x == cookie_name) {
				return unescape(y); // unescape로 디코딩 후 값 리턴
			}
		}
	}
	$(document).ready(function() {
		var cookie = getCookie(productItems);
		console.log(cookie);
		$('#cookie').text(cookie);

	})
	//alert(${document.cookie.productItems});
</script>
<style>
html, body, h1, h2, h3, h4 {
	font-family: "Lato", sans-serif
}

body {
	background-color: #F7FFF5;
}

.mySlides {
	display: none
}

.w3-tag, .fa {
	cursor: pointer
}

.w3-tag {
	height: 15px;
	width: 15px;
	padding: 0;
	margin-top: 6px
}
</style>
<style type="text/css">
/*  .content {
	position: absolute;
	left: 400px;
	top: 150px;
	width: 100%;
} 
 */
/* .bor {
	border-bottom: 1px soild;
}
*/
.bor {
	margin: 0 0 50px;
	padding: 40px 0 11px 4px;
	border-bottom: 1px solid #dadada;
	color: #000;
	font-size: 22px;
}

.scroll-right {
	height: 35px;
	font-size: 12px;
	position: fixed;
	z-index: 10000;
	top: 150px;
	left: 75%;
}
/* #bottom-down {
	position : absolute;
}
#bottom-down-right {
	position : static;
}
#bottom-down-right-right {
	position : static;
} */
/* 
.right {
	height : 200px;
	weight : 200px;
}
 .right-down {
	position: absolute;
 	left: 1200px;
	top: 250px;
	height : 200px;
	weight : 200px;
}
.right-down-down {
	height : 200px;
	weight : 200px;
}*/
</style>
</head>

<body>
	<div class="all_all">
		<div id="top" class="w3-top w3-center">
			<div class="w3-bar w3-white w3-card">
				<a
					class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right"
					href="javascript:void(0)" onclick="myFunction()"
					title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a> <a
					href="/project/index.jsp"
					class="w3-bar-item w3-button w3-padding-large">HOME</a> <a
					href="/project/item/list.sdj"
					class="w3-bar-item w3-button w3-padding-large w3-hide-small">보드게임몰</a>
				<div class="w3-dropdown-hover w3-hide-small">
					<button class="w3-padding-large w3-button" title="More">
						커뮤니티 <i class="fa fa-caret-down"></i>
					</button>
					<div class="w3-dropdown-content w3-bar-block w3-card-4">
						<a href="/project/board/list.sdj?b_category=1"
							class="w3-bar-item w3-button">플레이후기</a> <a
							href="/project/board/list.sdj?b_category=2"
							class="w3-bar-item w3-button">팁 게시판</a> <a
							href="/project/board/list.sdj?b_category=3"
							class="w3-bar-item w3-button">자유게시판</a> <a
							href="/project/board/list.sdj?b_category=4"
							class="w3-bar-item w3-button">요청게시판</a> <a
							href="/project/board/list.sdj?b_category=5"
							class="w3-bar-item w3-button">번개게시판</a> <a
							href="/project/board/list.sdj?b_category=6"
							class="w3-bar-item w3-button">게임플레이 동영상</a> <a
							href="/project/board/list.sdj?b_category=7"
							class="w3-bar-item w3-button">후기게시판</a>
					</div>
				</div>
				<c:if test="${!empty sessionScope.loginUser}">
					<c:if test="${sessionScope.loginUser eq 'admin' }">
						<a href="/project/admin/admin.sdj"
							class="w3-bar-item w3-button w3-padding-large w3-hide-small">관리자페이지</a>
					</c:if>
					<c:if test="${sessionScope.loginUser ne 'admin' }">
						<a href="/project/user/mypage.sdj?id=${sessionScope.loginUser }"
							class="w3-bar-item w3-button w3-padding-large w3-hide-small">마이페이지</a>
					</c:if>
				</c:if>
				<c:if test="${empty sessionScope.loginUser}">
					<a href="/project/user/login.sdj"
						class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그인</a>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<a href="/project/user/logout.sdj"
						class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그아웃</a>
				</c:if>
				<a href="javascript:void(0)"
					class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i
					class="fa fa-search"></i></a>
			</div>
		</div>
		<div class="scroll-right" style="fixed: right; margin-left: 20px">
			<div id="cookie">

				<!-- ${cookie} -->
			</div>
			<div class="up" style="width: 10%; height: 10%;">
				<a href="#"><img src="/project/img/up.png"></a>
			</div>
		</div>
		<div class="content  w3-container w3-content"
			style="margin-top: 120px;">
			<!-- style="max-width: 800px; margin-top: 100px; margin-left: 20%;"> -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<div style="float: left;">
					<div class="w3-display-container mySlides">
						<a href="#"> <img src="/project/img/1.jpg" style="width: 100%"></a>
						<div class="w3-display-topleft w3-container w3-padding-32"></div>
					</div>
					<div class="w3-display-container mySlides">
						<a href="#"> <img src="/project/img/2.jpg" style="width: 100%"></a>
						<div class="w3-display-topleft w3-container w3-padding-32"></div>
					</div>
					<div class="w3-display-container mySlides">
						<a href="#"> <img src="/project/img/3.jpg" style="width: 100%"></a>
						<div class="w3-display-topleft w3-container w3-padding-32"></div>
					</div>
					<div class="w3-display-container mySlides">
						<a href="#"> <img src="/project/img/4.jpg" style="width: 100%"></a>
						<div class="w3-display-topleft w3-container w3-padding-32"></div>
					</div>
					<div class="w3-display-container mySlides">
						<a href="#"> <img src="/project/img/5.jpg" style="width: 100%"></a>
						<div class="w3-display-middle w3-container w3-padding-32"></div>
					</div>

					<!-- Slideshow next/previous buttons -->
					<div class="w3-container w3-dark-grey w3-padding w3-xlarge">
						<div class="w3-left" onclick="plusDivs(-1)">
							<i class="fa fa-arrow-circle-left w3-hover-text-teal"></i>
						</div>
						<div class="w3-right" onclick="plusDivs(1)">
							<i class="fa fa-arrow-circle-right w3-hover-text-teal"></i>
						</div>

						<div class="w3-center">
							<span
								class="w3-tag demodots w3-border w3-transparent w3-hover-white"
								onclick="currentDiv(1)"></span> <span
								class="w3-tag demodots w3-border w3-transparent w3-hover-white"
								onclick="currentDiv(2)"></span> <span
								class="w3-tag demodots w3-border w3-transparent w3-hover-white"
								onclick="currentDiv(3)"></span> <span
								class="w3-tag demodots w3-border w3-transparent w3-hover-white"
								onclick="currentDiv(4)"></span> <span
								class="w3-tag demodots w3-border w3-transparent w3-hover-white"
								onclick="currentDiv(5)"></span>
						</div>
					</div>
				</div>
				<div style="float: left;">
					<div class="right">
						<a href="#"> <img src="/project/img/7.jpg"
							style="width: 100%; margin-left: 10px;"></a>
					</div>
					<div class="right-down">
						<a href="#"> <img src="/project/img/8.jpg"
							style="width: 100%; margin-left: 10px; margin-top: 10px"></a>
					</div>
					<div class="right-down-down">
						<a href="#"> <img src="/project/img/9.jpg"
							style="width: 100%; margin-left: 10px; margin-top: 10px"></a>
					</div>
				</div>
			</div>
			<div class="bottom w3-container w3-content" style="float: bottom;">
				<!-- 배스트상품 상품들 -->
					<div class="w3-row w3-grayscale">
						<h2 class="bor w3-center">베스트상품</h2>
						<div class="w3-col l3 s6">
							<div class="w3-container">
								<img src="/w3images/jeans1.jpg" style="width: 100%">
								<p>
									Ripped Skinny Jeans<br> <b>$0000</b>
								</p>
							</div>
							<div class="w3-container">
								<img src="/w3images/jeans2.jpg" style="width: 100%">
								<p>
									Mega Ripped Jeans<br> <b>$2222</b>
								</p>
							</div>
							<div class="w3-col l3 s6">
								<div class="w3-container">
									<div class="w3-display-container">
										<img src="/w3images/jeans2.jpg" style="width: 100%">
									</div>
									<p>
										Mega Ripped Jeans<br> <b>$1111</b>
									</p>
								</div>
								<div class="w3-container">
									<img src="/w3images/jeans3.jpg" style="width: 100%">
									<p>
										Washed Skinny Jeans<br> <b>$2222</b>
									</p>
								</div>
							</div>

							<div class="w3-col l3 s6">
								<div class="w3-container">
									<img src="/w3images/jeans3.jpg" style="width: 100%">
									<p>
										Washed Skinny Jeans<br> <b>$3333</b>
									</p>
								</div>
								<div class="w3-container">
									<div class="w3-display-container">
										<img src="/w3images/jeans4.jpg" style="width: 100%">
									</div>
									<p>
										Vintage Skinny Jeans<br> <b class="w3-text-red">$4444</b>
									</p>
								</div>
							</div>

						</div>
						<div id="bottom-down">
							<div class="w3-col l3 s6">
								<div class="w3-container">
									<img src="/w3images/jeans4.jpg" style="width: 100%">
									<p>
										Vintage Skinny Jeans<br> <b>$5555</b>
									</p>
								</div>
								<div class="w3-container">
									<img src="/w3images/jeans1.jpg" style="width: 100%">
									<p>
										Ripped Skinny Jeans<br> <b>$6666</b>
									</p>
								</div>
							</div>
							<div class="w3-col l3 s6" id="bottom-down-right">
								<div class="w3-container">
									<img src="/w3images/jeans4.jpg" style="width: 100%">
									<p>
										Vintage Skinny Jeans<br> <b>$4567</b>
									</p>
								</div>
								<div class="w3-container">
									<img src="/w3images/jeans1.jpg" style="width: 100%">
									<p>
										Ripped Skinny Jeans<br> <b>$3456</b>
									</p>
								</div>
							</div>
							<div class="w3-col l3 s6" id="bottom-down-right-right">
								<div class="w3-container">
									<img src="/w3images/jeans4.jpg" style="width: 100%">
									<p>
										Vintage Skinny Jeans<br> <b>$2345</b>
									</p>
								</div>
								<div class="w3-container">
									<img src="/w3images/jeans1.jpg" style="width: 100%">
									<p>
										Ripped Skinny Jeans<br> <b>$1234</b>
									</p>
								</div>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	<script>
		// Slideshow
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
			showDivs(slideIndex += n);
		}

		function currentDiv(n) {
			showDivs(slideIndex = n);
		}

		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("demodots");
			if (n > x.length) {
				slideIndex = 1
			}
			if (n < 1) {
				slideIndex = x.length
			}
			;
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace("w3-white", "");
			}
			x[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " w3-white";
		}
	</script>
</body>
</html>