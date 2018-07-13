<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 주문 목록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".progress").click(function(){
			var index = $(this).val();
			var sid = $("#sid"+index).val();
			var step = $("#stage"+index).val();
			var mileage = $("#tot"+index).val();
			$.ajax({
				type:"POST",
				url: "stepChange.sdj",
				data : {"s_id":sid,"s_step":step,"mileage":mileage},
				success : function(data) {
				}
			})
			location.reload();
		})
	})
</script>
<style type="text/css">
  
</style>
</head>
<body>
<table border="1" cellpadding="0" cellspacing="0" width="50%">
	<tr><td>구매한 날짜</td><td>구매자 ID</td><td>배송지 주소</td><td>진행상황</td></tr>
	<c:forEach items="${saleList}" var="sale" varStatus="stat">
		<input type="hidden" value="${sale.s_id }" id="sid${stat.index }">
		<tr><td><fmt:formatDate value="${sale.s_updateTime}" pattern="YYYY.MM.dd HH:mm:ss"/></td><td>${sale.m_id }</td><td>${sale.address }</td>
		<td style="text-align:center;">
		<c:if test="${!((sale.s_step == 7)  || (sale.s_step == 9))}">
			<select id="stage${stat.index}">
				<option value="1" disabled="disabled">주문접수</option>
				<option value="2">베송준비중</option>
				<option value="3">배송중</option>
				<option value="4">배송완료</option>
				<option value="5" disabled="disabled">구매확정</option>
				<option value="6" disabled="disabled">주문취소신청</option>
				<option value="7">주문취소</option>
				<option value="8" disabled="disabled">반품/환불신청</option>
				<option value="9">반품/환불완료</option>
			</select></c:if><br>
			<script type="text/javascript">
			stage${stat.index}.value = '${sale.s_step}'
			</script>
			현재 : <div style="display:inline;" id="disp${stat.index}"></div>
			<script type="text/javascript">
			if (${sale.s_step == 1}) {disp${stat.index}.innerHTML = '주문접수'}
			if (${sale.s_step == 2}) {disp${stat.index}.innerHTML = '베송준비중'}
			if (${sale.s_step == 3}) {disp${stat.index}.innerHTML = '배송중'}
			if (${sale.s_step == 4}) {disp${stat.index}.innerHTML = '베송완료'}
			if (${sale.s_step == 5}) {disp${stat.index}.innerHTML = '구매확정'}
			if (${sale.s_step == 6}) {disp${stat.index}.innerHTML = '주문취소신청'}
			if (${sale.s_step == 7}) {disp${stat.index}.innerHTML = '주문취소'}
			if (${sale.s_step == 8}) {disp${stat.index}.innerHTML = '반품/환불신청'}
			if (${sale.s_step == 9}) {disp${stat.index}.innerHTML = '반품/환불완료'}
		    </script>
		<br><c:if test="${!((sale.s_step == 7) || (sale.s_step == 9))}"><button class="progress" value="${stat.index}">선택</button></c:if></td></tr>
		<tr><td colspan="4">
			<table width="100%">
			<c:set var="tot" value="0"/>
			<c:forEach items="${sale.saleItemList }" var="saleItem">
				<tr><td rowspan="2"><img src="../picture/${saleItem.item.i_img }" width="100" height="100"></td><td colspan="2"><h4>${saleItem.item.i_name }</h4></td></tr>
				<tr><td>${saleItem.item.i_price * saleItem.quantity } 원 | <fmt:formatDate value="${sale.s_updateTime}" pattern="YYYY.MM.dd"/></td><td style="text-align:right;">수량 : ${saleItem.quantity } | 단일 가격 : ${saleItem.item.i_price } 원</td></tr>
				<c:set var="tot" value="${tot+ saleItem.item.i_price* saleItem.quantity}" />
			</c:forEach>
			<c:set var="tot" value="${(tot - tot%100)*0.01 }"/>
			</table>
			<input type="hidden" value="${tot }" id="tot${stat.index}">
		</td></tr>
	</c:forEach>
</table>
</body>
</html>