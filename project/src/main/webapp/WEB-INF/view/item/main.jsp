<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
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
			x = x.replace(/^\s+|\s+$/g, ''); // �հ� ���� ���� �����ϱ�
			if (x == cookie_name) {
				return unescape(y); // unescape�� ���ڵ� �� �� ����
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
.b_bottom {
	background-color : #f9f8f4;
		padding: 35px 0 11px 4px;
		border-bottom : 1px solid #dadada;
}
.fotter {
	font-famlily : 'Nanum Gothic', sans-serif!important;
	color: #717171;
	font-size: 12px;
	line-height:1.4;
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
					href="/project/item/main.sdj"
					class="w3-bar-item w3-button w3-padding-large">HOME</a> <a
					href="/project/item/list.sdj"
					class="w3-bar-item w3-button w3-padding-large w3-hide-small">������Ӹ�</a>
				<div class="w3-dropdown-hover w3-hide-small">
					<button class="w3-padding-large w3-button" title="More">
						Ŀ�´�Ƽ <i class="fa fa-caret-down"></i>
					</button>
					<div class="w3-dropdown-content w3-bar-block w3-card-4">
						<a href="/project/board/list.sdj?b_category=1"
							class="w3-bar-item w3-button">�÷����ı�</a> <a
							href="/project/board/list.sdj?b_category=2"
							class="w3-bar-item w3-button">�� �Խ���</a> <a
							href="/project/board/list.sdj?b_category=3"
							class="w3-bar-item w3-button">�����Խ���</a> <a
							href="/project/board/list.sdj?b_category=4"
							class="w3-bar-item w3-button">��û�Խ���</a> <a
							href="/project/board/list.sdj?b_category=5"
							class="w3-bar-item w3-button">�����Խ���</a> <a
							href="/project/board/list.sdj?b_category=6"
							class="w3-bar-item w3-button">�����÷��� ������</a> <a
							href="/project/board/list.sdj?b_category=7"
							class="w3-bar-item w3-button">�ı�Խ���</a>
					</div>
				</div>
				<c:if test="${!empty sessionScope.loginUser}">
					<c:if test="${sessionScope.loginUser eq 'admin' }">
						<a href="/project/admin/admin.sdj"
							class="w3-bar-item w3-button w3-padding-large w3-hide-small">������������</a>
					</c:if>
					<c:if test="${sessionScope.loginUser ne 'admin' }">
						<a href="/project/user/mypage.sdj?id=${sessionScope.loginUser }"
							class="w3-bar-item w3-button w3-padding-large w3-hide-small">����������</a>
					</c:if>
				</c:if>
				<c:if test="${empty sessionScope.loginUser}">
					<a href="/project/user/login.sdj"
						class="w3-bar-item w3-button w3-padding-large w3-hide-small">�α���</a>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<a href="/project/user/logout.sdj"
						class="w3-bar-item w3-button w3-padding-large w3-hide-small">�α׾ƿ�</a>
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
			<div class="bottom w3-container w3-content" style="float: bottom;" id="best">
				<!-- �轺Ʈ��ǰ ��ǰ�� -->
				<div class="w3-row w3-grayscale">
					<h2 class="bor w3-center">����Ʈ��ǰ</h2>
					<div class="w3-col l3 s6">
						<c:forEach items="${itemlist}" var="item" varStatus="status">
							<c:if test="${status.index % 4 == 0}">
								<tr>
							</c:if>
							<td>
								<div class="tb-center w3-btn w3-card">
									<div class="box">
										<div class="w3-container">
											<a href="detail.sdj?no=${item.i_no}"><img src="/img/${item.i_no}/i1.jpg" style="width: 100%; padding: 30px 20px 11px 4px;"></a>
										</div>
										<ul class="info w3-middle"
											style="list-style: none; padding-left: 0px;">
											<li class="dsc">${item.i_name}</li>
											<li><fmt:formatNumber value="${item.i_price }" pattern="#,###"></fmt:formatNumber>��</li>
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
					<div class="cscenter" style="float:left;width: 300px;">
						<h3>CS Center</h3>
						<strong>02-999-8888</strong>
						<p>
							"���� 09:00 ~ 18:00"<br>
							"���� 12:00 ~ 13:00"<br>
							"������, �����, �ָ� ����"							
						</p>
					</div>
					<div class="bank" style="float:left;width: 300px;">
						<h3>BANK INFO</h3>
						<strong>111-2222-33333333</strong>
						<p>
						������ : ������(��)
						</p>
					</div>
					<div class="review" style="float:left;width: 300px;">
						<h3>REVIEW</h3>
						<c:forEach items="${review}" var="review" begin="0" end="5">
							<li>
								<a href="detail.sdj?b_no=${review.b_no}">
								${review.b_subject }
								</a>
								
							</li>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="footer">
				<div class="w3-container">
					<div class="logo" style="float:left;">
						<img src="../img/boardhang.png" style="width:200px">
					</div>
				<div class="content" style="float:left; height:10px">
				<address>
					<strong>(��)������</strong>
					"   ����Ư���� ��õ�� ���굿 238-33   "
				</address>
				<ul>
				<li>������ : �輮��,������,������</li>
				<li>����ڵ�Ϲ�ȣ : 111-22-333333</li>
				<li>�������������� : ������</li>
				</ul>
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