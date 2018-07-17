<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 주문 목록</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
function comments(index) {
	window.open("../board/purchaseComments.sdj?i_no="+index,"구매후기","location=yes, menubar=no, titlebar=no, toolbar=no, width=500, height=700");
}
function decide(index) {
	var result = confirm('구매를 확정 하시겠습니까?')
	if(result) {
		location.href = '../admin/stepChange.sdj?s_id='+$('#sid'+index).val() + '&s_step=5&mileage='+$('#mileage'+index).val();
	}
}
function cancel(index) {
	var result = confirm('주문을 취소하시겠습니까?')
	if(result) {
		location.href = '../admin/stepChange.sdj?s_id='+$('#sid'+index).val() + '&s_step=6';
	}
}
function return1(index) {
	var result = confirm('반품 및 환불 신청 하시겠습니까?')
	if(result) {
		location.href = '../admin/stepChange.sdj?s_id='+$('#sid'+index).val() + '&s_step=8';
	}
}
</script>
<style type="text/css">
</style>
</head>
<body>
	<table border="1" cellpadding="0" cellspacing="0" width="50%">
		<tr>
			<td>구매한 날짜</td>
			<td>구매자 ID</td>
			<td>배송지 주소</td>
			<td>진행상황</td>
		</tr>
		<c:set var="tot" value="0" />
		<c:forEach items="${salelist}" var="sale" varStatus="stat">
			<input type="hidden" value="${sale.s_id }" id="sid${stat.index }">
			<tr>
				<td><fmt:formatDate value="${sale.s_updateTime}"
						pattern="YYYY.MM.dd HH:mm:ss" /></td>
				<td>${sale.m_id }</td>
				<td>${sale.address }</td>
				<td style="text-align: center;">
					<div style="display: inline;" id="disp${stat.index}"></div> <script
						type="text/javascript">
			if (${sale.s_step == 1}) {disp${stat.index}.innerHTML = '주문접수<br><button onclick="cancel(${stat.index })">주문취소</button>'}
			if (${sale.s_step == 2}) {disp${stat.index}.innerHTML = '베송준비중<br><button onclick="return1(${stat.index })">반품/환불신청</button>'}
			if (${sale.s_step == 3}) {disp${stat.index}.innerHTML = '배송중<br><button onclick="return1(${stat.index })">반품/환불신청</button>'}
			if (${sale.s_step == 4}) {disp${stat.index}.innerHTML = '베송완료<br><button onclick="decide(${stat.index })">구매확정</button>'}
			if (${sale.s_step == 5}) {disp${stat.index}.innerHTML = '구매확정<br><button onclick="return1(${stat.index })">반품/환불신청</button>'}
			if (${sale.s_step == 6}) {disp${stat.index}.innerHTML = '주문취소신청'}
			if (${sale.s_step == 7}) {disp${stat.index}.innerHTML = '주문취소'}
			if (${sale.s_step == 8}) {disp${stat.index}.innerHTML = '반품/환불신청'}
			if (${sale.s_step == 9}) {disp${stat.index}.innerHTML = '반품/환불완료'}
		    </script>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<table width="100%">
						<c:forEach items="${sale.saleItemList }" var="saleItem">
							<tr>
								<td rowspan="2"><img
									src="../picture/${saleItem.item.i_img }" width="100"
									height="100"></td>
								<td><h4>${saleItem.item.i_name }</h4></td>
								<td align="right"><c:if test="${sale.s_step == 5 }">
										<button onclick="javascript:comments(${saleItem.item.i_no});">구매후기작성</button>
									</c:if></td>
							</tr>
							<tr>
								<td>${saleItem.item.i_price * saleItem.quantity }원 | <fmt:formatDate
										value="${sale.s_updateTime}" pattern="YYYY.MM.dd" /></td>
								<td style="text-align: right;">수량 : ${saleItem.quantity } |
									단일 가격 : ${saleItem.item.i_price } 원</td>
							</tr>
							<c:set var="tot"
								value="${tot + (saleItem.item.i_price * saleItem.quantity - saleItem.item.i_price * saleItem.quantity%100)*0.01 }" />

						</c:forEach>
					</table> <input type="hidden" id="mileage${stat.index }" value="${tot }">
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>