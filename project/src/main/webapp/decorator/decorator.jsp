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
@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);

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
<decorator:head />
</head>
<body>
	<div class="all_all w3-container">
		<div id="top" class="w3-top w3-center">
			<div class="w3-bar w3-white w3-card w3-center"
				style="width: 51%; height: 80px;">
				<div style="vertical-align: middle">
					<a href="/project/item/main.sdj"
						class="w3-bar-item w3-button w3-padding-large"
						style="height: 80px; width: 148px; line-height: 371%;"> <img
						src="../img/mainlogo.png" style="width: 100%"></a>
				</div>
				<div class="w3-dropdown-hover w3-hide-small">
					<button class="w3-padding-large w3-button" title="More"
						style="height: 80px;"
						onclick="location.href='/project/item/list.sdj'">
						보드게임몰 <i class="fa fa-caret-down"></i>
					</button>
					<div class="w3-dropdown-content w3-bar-block w3-card-4">
						<a href="/project/item/list.sdj?gametype=7"
							class="w3-bar-item w3-button">액션</a> <a
							href="/project/item/list.sdj?gametype=1"
							class="w3-bar-item w3-button">순발력</a> <a
							href="/project/item/list.sdj?gametype=5"
							class="w3-bar-item w3-button">추리</a> <a
							href="/project/item/list.sdj?gametype=2"
							class="w3-bar-item w3-button">학습</a> <a
							href="/project/item/list.sdj?gametype=6"
							class="w3-bar-item w3-button">전략</a> <a
							href="/project/item/list.sdj?gametype=10"
							class="w3-bar-item w3-button">복불복</a> <a
							href="/project/item/list.sdj?gametype=8"
							class="w3-bar-item w3-button">스포츠</a>
					</div>
				</div>
				<div class="w3-dropdown-hover w3-hide-small">
					<button class="w3-padding-large w3-button" title="More"
						style="height: 80px">
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
				<div>
					<c:if test="${!empty sessionScope.loginUser}">
						<c:if test="${sessionScope.loginUser eq 'admin' }">
							<a href="/project/admin/admin.sdj"
								class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right"
								style="height: 80px; line-height: 248%;">관리자페이지</a>
						</c:if>
						<c:if test="${sessionScope.loginUser ne 'admin' }">
							<a href="/project/user/mypage.sdj?id=${sessionScope.loginUser}"
								class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right"
								style="height: 80px; line-height: 248%;">마이페이지</a>
						</c:if>
					</c:if>
				</div>
				<c:if test="${empty sessionScope.loginUser}">
					<a href="/project/user/login.sdj"
						class="w3-bar-item w3-button w3-padding-large w3-hide-small w3-right"
						style="height: 80px; line-height: 248%;">로그인</a>
					<a href="/project/user/userForm.sdj"
						class="w3-bar-item w3-button w3-padding-large w3-hide-small"
						style="height: 80px; line-height: 248%;">회원가입</a>
				</c:if>
				<c:if test="${!empty sessionScope.loginUser}">
					<a href="/project/user/logout.sdj"
						class="w3-bar-item w3-button w3-padding-large w3-hide-smal w3-right"
						style="height: 80px; line-height: 248%;">로그아웃</a>
				</c:if>
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
	<br>
	<br>
	<br>
	<div align="center">
	<br><br>
		<decorator:body/>
	</div>
	<div class="footer w3-container">
				<div class="w3-container w3-center" style="margin-left: 27%;">
					<div class="logo" style="float:left;">
						<img src="../img/boardhang.png" style="width:200px">
					</div>
				<div class="content" style="float:left; height:10px;font-size:12px">
				<address>
					<strong>(주)보드행　　</strong>
					   서울특별시 금천구 가산동 238-33<br>　　
					  제작자 : 김석원, 김재한, 설동희　　/　　사업자등록번호 : 111-11-22222222<br>
					대표번호 : 02-000-1111　　/　　팩스번호 : 02-111-2222　　/　　이메일 : boardhang@naver.com
					<p style="padding: 5px 0 0;color: #bbb;font-size: 11px;">copyright(c)<strong>boardhang</strong> all rights reserved.</p>
				</address>
				<ul>
				</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>