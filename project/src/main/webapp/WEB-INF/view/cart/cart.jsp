<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>장바구니</title>
<script type="text/javascript">
  function change(no) {
	  window.open("../cart/countUpdate.sdj?no="+no,"수량 수정","location=yes, menubar=no, titlebar=no, toolbar=no, width=500, height=700");
	  location.href="rediract:cart.sdj"
  }
</script>
<style type="text/css">
  .button {
    font-size:12px;
    height:25px;
    width:40px;
  }
  table {
    text-align:center;
  }
</style>
</head>
<body>
<h2>장바구니 물품</h2>
<table align="center">
  <tr><td colspan="2"><font color="green">장바구니 상품 목록</font></td></tr>
  <tr><td>상품명</td><td>가격</td><td>수량</td><td>합계</td></tr>
  <c:set var="tot" value="${0 }"/>
  <c:forEach items="${cart.itemList }" var="itemSet" varStatus="stat">
    <tr><td>${itemSet.item.i_name }</td><td>${itemSet.item.i_price }</td>
        <td>${itemSet.quantity }<div><input type="button" onclick="javascript:change(${itemSet.item.i_no});" value="변경" class="button" align="middle"></div></td>
        <td>${itemSet.quantity * itemSet.item.i_price }
        <a href="cartDelete.sdj?index=${stat.index }">ⓧ</a>
        </td></tr>
  <c:set var="tot" value="${tot+(itemSet.quantity * itemSet.item.i_price) }"/>
  </c:forEach>
  <tr><td colspan="4" align="right"><font color="green">총구입금액:${tot }원</font></td></tr>
</table>
<br>${message }<br><a href="../item/list.sdj">상품목록</a>
<a href="checkout.sdj">주문하기</a>
</body>
</html>