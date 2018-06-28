<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#up_button").click(function(){
		var y = parseInt(count.value)
		count.value = y+1;
		var price = ${item.i_price} * parseInt(count.value)
	})
	$("#down_button").click(function(){
		var x = parseInt(count.value)
		if(x <= 1) {
			x = 2
		}
		count.value = x-1;
		var price = ${item.i_price} * parseInt(count.value)
		console.log(price)
	})
})
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
</style>
</head>
<body>
<h2>상품 상세 보기</h2>
<div>
  <span style="hight:282px; width:302px; float:left;">
    <img hight="100%" width="100%" src="../picture/${item.i_img }">
  </span>
  <span style="hight:350px; width:350px; float:left;">
    <table hight="100%" width="100%" cellpadding="2" cellspacing="2">
      <tr><td>장르</td><td>${item.tp_name }</td></tr>
      <tr><td>판매가</td><td><fmt:formatNumber type="currency" value="${item.i_price }" pattern="0,000" />원</td></tr>
      <tr><td>구매혜택</td><td>적립금 : <fmt:parseNumber integerOnly="true" value="${item.i_price*0.01 }"/>원</td></tr>
      <tr><td>게임인원</td><td>${item.i_people }명</td></tr>
      <tr><td>게임연령</td><td>${item.i_age }세 이상</td></tr>
      <tr><td colspan="2">
      <div>
      <span><strong>수량:</strong></span>
      <span><input id="count" type="text" align="middle" value="1" name="quantity">
        <span>
          <button id="up_button" class="up_button"></button><button id="down_button" class="down_button"></button>
        </span>
      </span>&nbsp;&nbsp;
      <span id="to_price" class="total"><font style="font-size:20px;"><strong style="color:#ec187c;"><fmt:formatNumber value="${item.i_price }" pattern="0,000"/></strong></font>원</span></div></td></tr>
    </table>
    
  </span>
</div>
</body>
</html>