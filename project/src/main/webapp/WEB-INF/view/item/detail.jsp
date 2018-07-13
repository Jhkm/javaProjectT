<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
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
function setCookie(cookie_name, value, days) {
	  var exdate = new Date();
	  exdate.setDate(exdate.getDate() + days);
	  // 설정 일수만큼 현재시간에 만료값으로 지정

	  var cookie_value = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
	  document.cookie = cookie_name + '=' + cookie_value;
	}
function addCookie(id) {
	  var items = getCookie('productItems'); // 이미 저장된 값을 쿠키에서 가져오기
	  var maxItemNum = 5; // 최대 저장 가능한 아이템개수
	  var expire = 7; // 쿠키값을 저장할 기간
	  if (items) {
	    var itemArray = items.split(',');
	    if (itemArray.indexOf(id) != -1) {
	      // 이미 존재하는 경우 종료
	      console.log('Already exists.');
	    }
	    else {
	      // 새로운 값 저장 및 최대 개수 유지하기
	      itemArray.unshift(id);
	      if (itemArray.length > maxItemNum ) itemArray.length = 5;
	      items = itemArray.join(',');
	      setCookie('productItems', items, expire);
	    }
	  }
	  else {
	    // 신규 id값 저장하기
	    setCookie('productItems', id, expire);
	  }
	}
addCookie("${item.i_no}");
$(document).ready(function() {
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	} 
	$("#up_button").click(function(){
		var y = parseInt(count.value)
		count.value = y+1;;
		total.value = ${item.i_price} * parseInt(count.value);
		event.preventDefault();
	});
	$("#down_button").click(function(){
		var x = parseInt(count.value)
		if(x <= 0) {
			x = 1
		}
		count.value = x-1;
		total.value = ${item.i_price} * parseInt(count.value);
		event.preventDefault();
	})
	$("#cartgo").click(function() {
		var checkAnswer = confirm("장바구니에 담았습니다.\n장바구니 화면으로 이동 하시겠습니까?");
		location.href='../cart/cartAdd.sdj?no=${item.i_no}&quantity='+count.value+"&checkAS="+checkAnswer;
		event.preventDefault();
	})
	$("#editgo").click(function() {
		location.href='../item/edit.sdj?no=${item.i_no}';
		event.preventDefault();
	})
	$(".detail").click(function() {
		location.href='#detailInfo';
	})
	$(".delivery").click(function() {
		location.href='#delivery';
	})
	$(".exchange").click(function() {
		location.href='#exchange';
	})
	$(".review").click(function() {
		location.href='#review';
	})
	$(".question").click(function() {
		location.href='#question';
	})
	$("#fave").click(function(){
		if($("#fave").hasClass('fave')) {
			var no = ${item.i_no};
			$.ajax({
				type:"POST",
				url:"favoritItem.sdj",
				data:{"i_no":no},
				success:function(result){
					$("#fave").removeClass('fave')
					$("#fave").addClass('fave_check')
					if(result == 'success') {
						alert('추천 하였습니다.')
					}
				},
				error:function(result){
					if(result == 'fail')
					alert('추천 실패하였습니다.')
				}
			})
			
		} else {
			var no = ${item.i_no};
			$.ajax({
				type:"POST",
				url:"favoritItem.sdj",
				data:{"i_no":no},
				success:function(result){
					$("#fave").addClass('fave')
					$("#fave").removeClass('fave_check')
					if(result == 'clear') {
						alert('추천 해제 하였습니다.')
					}
				},
				error:function(result){
					if(result == 'fail')
					alert('추천을 실패하였습니다.')
				}
			})
			
		}
	})
	
})
	function change() {
		var z = parseInt(count.value)
		if(z < 0) {
			count.value = 0;
		}
		total.value = ${item.i_price} * parseInt(count.value);
	}
	function checkConfirm() {
		if(confirm("정말 삭제 하시겠습니까??")) {
			location.href='delete.sdj?no=${item.i_no}';
		}
		event.preventDefault();
	}
	
</script>
<style type="text/css">
  table {
    border-top:1px solid;
    border-bottom:1px solid;
  }
  span {display:block}
  table tr td div span input {float:left; height:34px; text-align:center;}
  .up_button {background:url(../picture/up_button.jpg); display:block; height:17px; width:28px;}
  .down_button {background:url(../picture/down_button.jpg); display:block; height:17px; width:28px;}
  table tr td div {text-align:middle;}
  table tr td div span {float:left; margin:0; padding:0;}
  .total {float:right;}
  .invisible {
        clear: none;
        border: 0px none;
        float: none;
        background-color: #ffffff;
  }
  ul.kind_of_tab {
  	width: 100%;
    margin: 0 auto;
    border-bottom: #333 1px solid;
    list-style: none;
    padding: 0;
    display: block;
    -webkit-margin-before: 1em;
    -webkit-margin-after: 1em;
    -webkit-margin-start: 0px;
    -webkit-margin-end: 0px;
    /* -webkit-padding-start: 40px; */
    font-family: Lato,'Nanum Gothic','Malgun Gothic';
    font-size: 20px;
    color: #333333;
    white-space: normal;
    line-height: normal;
    font-weight: normal;
    font-style: normal;
    text-align: center;
    font-variant: normal;
    border-collapse: separate;
    border-spacing: 2px;
  }
  ul.kind_of_tab:after {
    content: "";
    display: block;
    clear: both;
  }
	ul.kind_of_tab li {
    	float: left;
    	margin-left: -1px;
    	list-style: none;
    	margin: 0;
    	padding: 0;
    	display: list-item;
    	text-align: -webkit-match-parent;
    	border-right: #c7cdd8 1px solid;
    	border-top: #c7cdd8 1px solid;
    	border-bottom:#c7cdd8 1px solid;
	}
	ul.kind_of_tab li.first_box {
    	margin-left: 0;
    	border: #333 1px solid;
    	border-color:#c7cdd8;
	}
	ul.kind_of_tab li.selected {
		background-color:#e6eaf2;
	}
	.fave { width: 70px; height: 50px; background: url(../file/twitter_fave.png) no-repeat; background-position: 0 0; }
	.fave:hover { background-position: -3519px 0; transition: background 1s steps(55); }
	.fave_check {width: 70px; height: 50px; background: url(../file/twitter_fave.png) no-repeat; background-position: -3519px 0; transition: background 0s steps(55);}
</style>


</head>
<body>
<h2>상품 상세 보기</h2>
<div align="center" style="height:600px; width:60%">
  <!-- <span style="hight:282px; width:302px; float:left;"> -->
  <span style="width:45%; float:left;">
    <img height="100%" width="100%" src="../picture/${item.i_img }">
  </span>
  <span style="height:450px; width:50%; float:left;">
  <form action="buyout.sdj" method="post">
  	<section id="fave" class="fave" style="float:right;"></section>
  	<script type="text/javascript">
  	if(${checkResult == 1}) {
  		$("#fave").removeClass('fave')
		$("#fave").addClass('fave_check')
	}
  	</script>
    <h2>${item.i_name } (${item.i_age }세 이상, ${item.i_people }~${item.i_people2 }인용)</h2>
    <table height="100%" width="100%" cellpadding="15" cellspacing="2">
      <tr><td>장르</td><td align="right">${item.tp_name }</td></tr>
      <tr><td>판매가</td><td align="right"><fmt:formatNumber type="currency" value="${item.i_price }" pattern="0,000" var="i_price" />${i_price }원</td></tr>
      <tr><td>구매혜택</td><td align="right">적립금 : <fmt:parseNumber integerOnly="true" value="${item.i_price*0.01 }"/>원</td></tr>
      <tr><td>게임인원</td><td align="right">${item.i_people } ~ ${item.i_people2 }명</td></tr>
      <tr><td>게임연령</td><td align="right">${item.i_age }세 이상</td></tr>
      <tr><td>게임 선호도</td><td align="right">${avgGrade }</td></tr>
      <tr><td colspan="2">
      <div>
      <input type="hidden" name="i_no" value="${item.i_no }">
      <span><strong>수량:</strong></span>
      <span><input id="count" type="text" align="middle" value="1" name="quantity" onchange="javascript:change();">
        <span>
          <button id="up_button" class="up_button" ></button><button id="down_button" class="down_button"></button>
        </span>
      </span>&nbsp;&nbsp;
      <span class="total"><font style="font-size:20px;"><strong style="color:#ec187c;">
      <input type="text" class="invisible" value="${item.i_price }" id="total">
      </strong></font>원</span>
      </div></td></tr>
    </table>
    <div align="right">
        <input type="submit" value="구매하기"><input type="submit" value="장바구니 담기" id="cartgo">
    </div>
    <c:if test="${sessionScope.loginUser == 'admin'}">
    	<input type="submit" value="정보수정" id="editgo">
    	<input type="button" value="삭제" onclick="javascript:checkConfirm();">
    </c:if>
    </form>
  </span>
    <br>
</div>
<div id="detailInfo" style="width:60%" >
<br><br><br><br>
  <ul class="kind_of_tab">
    <li class="first_box selected detail" style="width:20%;"><a>상품 상세정보</a></li>
    <li class="delivery" style="width:20%;"><a>배송정보</a></li>
    <li class="exchange" style="width:20%;"><a>교환 및 반품 정보</a></li>
    <li class="review" style="width:20%;"><a>상품 사용후기</a></li>
    <li class="question" style="width:20%;"><a>상품 Q & A</a></li>
  </ul>
  ${item.i_explain }
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~<br><br>공란~~
  <br><br>공란~~
</div>
<div id="delivery" style="width:60%">
<br><br><br><br>
  <ul class="kind_of_tab">
    <li class="first_box detail" style="width:20%;"><a>상품 상세정보</a></li>
    <li class="selected delivery" style="width:20%;"><a>배송정보</a></li>
    <li class="exchange" style="width:20%;"><a>교환 및 반품 정보</a></li>
    <li class="review" style="width:20%;"><a>상품 사용후기</a></li>
    <li class="question" style="width:20%;"><a>상품 Q & A</a></li>
  </ul>
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~<br><br>공란~~
  <br><br>공란~~
</div>
<div id="exchange" style="width:60%">
<br><br><br><br>
  <ul class="kind_of_tab">
    <li class="first_box detail" style="width:20%;"><a>상품 상세정보</a></li>
    <li class="delivery" style="width:20%;"><a>배송정보</a></li>
    <li class="exchange selected" style="width:20%;"><a>교환 및 반품 정보</a></li>
    <li class="review" style="width:20%;"><a>상품 사용후기</a></li>
    <li class="question" style="width:20%;"><a>상품 Q & A</a></li>
  </ul>
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~<br><br>공란~~
  <br><br>공란~~
</div>
<div id="review" style="width:60%">
<br><br><br><br>
  <ul class="kind_of_tab">
    <li class="first_box detail" style="width:20%;"><a>상품 상세정보</a></li>
    <li class="delivery" style="width:20%;"><a>배송정보</a></li>
    <li class="exchange" style="width:20%;"><a>교환 및 반품 정보</a></li>
    <li class="review selected" style="width:20%;"><a>상품 사용후기</a></li>
    <li class="question" style="width:20%;"><a>상품 Q & A</a></li>
  </ul>
  <br><br>공란~~
  <table>
  	<c:forEach items="${commentsList }" var="comments">
  		<tr><td>${comments.i_grade }</td><td>${comments.b_content }</td><td>${comments.m_id }</td><td><fmt:formatDate value="${comments.b_regtime }" pattern="YYYY.MM.dd"/></td></tr>
  	</c:forEach>
  </table>
  <br><br>공란~~
  <br><br>공란~~11
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~<br><br>공란~~
  <br><br>공란~~
</div>
<div id="question" style="width:60%">
<br><br><br><br>
  <ul class="kind_of_tab">
    <li class="first_box detail" style="width:20%;"><a>상품 상세정보</a></li>
    <li class="delivery" style="width:20%;"><a>배송정보</a></li>
    <li class="exchange" style="width:20%;"><a>교환 및 반품 정보</a></li>
    <li class="review" style="width:20%;"><a>상품 사용후기</a></li>
    <li class="question selected" style="width:20%;"><a>상품 Q & A</a></li>
  </ul>
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~<br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~
  <br><br>공란~~<br><br>공란~~
  <br><br>공란~~
</div>
</body>
</html>