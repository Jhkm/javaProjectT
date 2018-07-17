<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

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

#top {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 25px;
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

.b_bottom {
	background-color: #f9f8f4;
	padding: 20px 0 11px 4px;
	border-bottom: 1px solid #dadada;
}

.fotter {
	padding: 35px 0 11px 4px;
	color: #717171;
	font-size: 12px;
	line-height: 20px;
}

.content {
	padding: 50px 0 11px 4px;
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

#best {
	border-bottom: 1px solid #dadada;
	padding: 40px 0 11px 4px;
}

.scroll-right {
	height: 35px;
	font-size: 12px;
	position: fixed;
	z-index: 10000;
	top: 150px;
	left: 75%;
}

.w3-center .w3-bar {
	display: inline-block;
	width: auto;
	height: auto;
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
		<div class="content  w3-container w3-content">
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
						<c:forEach items="${itemlist}" var="item" varStatus="status">
							<c:if test="${status.index % 4 == 0}">
								<tr>
							</c:if>
							<td>
								<div class="tb-center w3-btn w3-card">
									<div class="box">
										<div class="w3-container">
											<a href="detail.sdj?no=${item.i_no}"><img
												src="/img/${item.i_no}/i1.jpg"
												style="width: 100%; padding: 30px 20px 11px 4px;"></a>
										</div>
										<ul class="info w3-middle"
											style="list-style: none; padding-left: 0px;">
											<li class="dsc">${item.i_name}</li>
											<li><fmt:formatNumber value="${item.i_price }"
													pattern="#,###"></fmt:formatNumber>원</li>
										</ul>
									</div>
								</div>
							</td>
							<c:if test="${status.index % 4 == 3 or status.last}">
								</tr>
							</c:if>
						</c:forEach>

					</div>

				</div>
			</div>
			<div class="b_bottom">
				<div class="w3-container">
					<div class="cscenter" style="float: left; width: 300px;">
						<h3>CS Center</h3>
						<strong>02-999-8888</strong>
						<p>
							"평일 09:00 ~ 18:00"<br> "점심 12:00 ~ 13:00"<br> "공휴일,
							토요일, 주말 휴일"
						</p>
					</div>
					<div class="bank" style="float: left; width: 300px;">
						<h3>BANK INFO</h3>
						<strong>111-2222-33333333</strong>
						<p>예금주 : 보드행(주)</p>
					</div>
					<div class="review" style="float: left; width: 300px;">
						<h3>REVIEW</h3>
						<c:forEach items="${review}" var="review" begin="0" end="5">
							<li><a href="detail.sdj?b_no=${review.b_no}">
									${review.b_subject } </a></li>
						</c:forEach>
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