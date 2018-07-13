<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문 전 상품 목록 보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".newAddress").hide();
	$("#addressUpdate").click(function () {
		if($("#updateSet").css("display") == "none") {
			$(".newAddress").show();
		} else {
			if($("#oldAddress").css("display") == "none") {}else {$(".newAddress").hide();$("#newAddress").val("");}
		}
		event.preventDefault();
	  })
	$("#updateSet").click(function() {
		$("#oldAddress").hide();
		$("#updateSet").hide();
		event.preventDefault();
	})
})
function all_use() {
	var m = ${loginUser1.m_mileage };
	$("#use_mileage").val(m);
	this.mileage();
}
function mileage() {
	var m = $("#use_mileage").val();
	if(m > ${loginUser1.m_mileage}) {
		$("#use_mileage").val(${loginUser1.m_mileage});
		$("#final_money").val(${itemSet.quantity * itemSet.item.i_price } - $("#use_mileage").val());
		return;
	}
	var c = ${itemSet.quantity * itemSet.item.i_price } - $("#use_mileage").val();
	$("#final_money").val(c);
}
function finalize() {
	document.f.submit();
}
</script>
<style type="text/css">
  table { width : 90%; border-collapse: collapse; }
  th, td { border : 3px solid #bcbcbc; text-align:center; padding:8px;}
  th { background-color: #4CAF50; color:white; text-align:center; }
  td {background-color: #f2f2f2;}
  td.title {background-color:#e2e2e2; color:blue;}
</style>
</head>
<body>
<h2>배송지 정보</h2>
<form action="end.sdj" method="post" name="f">
<table>
  <tr><td width="30%" class="title">구매자ID</td>
  <td width="70%">${loginUser1.m_id }</td></tr>
  <tr><td width="30%" class="title">이름</td>
  <td width="70%">${loginUser1.m_name }</td></tr>
  <tr><td width="30%" class="title">주소</td>
  <td width="70%">
  <input type="text" style="text-align:center;border:0px none;background:transparent;" id="oldAddress" name="oldAddress" value="${loginUser1.m_address }" size="100">
  <br><input type="button" id="addressUpdate" value="배송지 수정">
  <br><input type="text" class="newAddress" id="newAddress" name="newAddress" size="100">
  <br><input type="button" class="newAddress" id="updateSet" value="배송지 수정 완료" >
  </td></tr>
  <tr><td width="30%" class="title">전화번호</td>
  <td width="70%">${loginUser1.m_phone }</td></tr>
  <tr><td width="30%" class="title">이메일</td>
  <td width="70%">${loginUser1.m_email }</td></tr>
  <tr><td width="30%" class="title">마일리지</td>
  <td width="70%">${loginUser1.m_mileage }</td></tr>
</table>
<input type="hidden" name="quantity" value="${itemSet.quantity }">
<input type="hidden" name="i_no" value="${itemSet.item.i_no }">
</form><br><br>
<h2>할인 및 적립</h2>
<table>
	<!-- 숫자만 쓸수 있게하기 -->
	<tr><th>사용할 마일리지 : </th><td style="text-align:right;"><input type="text" id="use_mileage" style="text-align:right;" value="0" onchange="mileage()"> 원</td>
	<td><input type="button" value="전액사용" onclick="all_use()">(사용 가능한 마일리지:${loginUser1.m_mileage } 원)</td></tr>
</table>
<h2>구매 상품 정보</h2>
<table>
  <tr><th>상품명</th><th>상품가격</th><th>수량</th><th>상품합계</th></tr>
  <tr><td>${itemSet.item.i_name }</td><td>${itemSet.item.i_price } 원</td>
      <td>${itemSet.quantity }개</td>
      <td>${itemSet.quantity * itemSet.item.i_price } 원</td></tr>
  <tr><td colspan="4">
    <a href="javascript:finalize()">구매</a>&nbsp;
    <a href="../item/list.sdj">상품목록</a></td></tr>
</table>
<h2>최종 결제 금액</h2>
<input type="text" style="text-align:right;" id="final_money" value="${itemSet.quantity * itemSet.item.i_price }" readonly> 원
</body>
</html>