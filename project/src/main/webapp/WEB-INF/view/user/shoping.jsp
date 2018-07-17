<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� �ֹ� ���</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
function comments(index) {
	window.open("../board/purchaseComments.sdj?i_no="+index,"�����ı�","location=yes, menubar=no, titlebar=no, toolbar=no, width=500, height=700");
}
function decide(index) {
	var result = confirm('���Ÿ� Ȯ�� �Ͻðڽ��ϱ�?')
	if(result) {
		location.href = '../admin/stepChange.sdj?s_id='+$('#sid'+index).val() + '&s_step=5&mileage='+$('#mileage'+index).val();
	}
}
function cancel(index) {
	var result = confirm('�ֹ��� ����Ͻðڽ��ϱ�?')
	if(result) {
		location.href = '../admin/stepChange.sdj?s_id='+$('#sid'+index).val() + '&s_step=6';
	}
}
function return1(index) {
	var result = confirm('��ǰ �� ȯ�� ��û �Ͻðڽ��ϱ�?')
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
			<td>������ ��¥</td>
			<td>������ ID</td>
			<td>����� �ּ�</td>
			<td>�����Ȳ</td>
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
			if (${sale.s_step == 1}) {disp${stat.index}.innerHTML = '�ֹ�����<br><button onclick="cancel(${stat.index })">�ֹ����</button>'}
			if (${sale.s_step == 2}) {disp${stat.index}.innerHTML = '�����غ���<br><button onclick="return1(${stat.index })">��ǰ/ȯ�ҽ�û</button>'}
			if (${sale.s_step == 3}) {disp${stat.index}.innerHTML = '�����<br><button onclick="return1(${stat.index })">��ǰ/ȯ�ҽ�û</button>'}
			if (${sale.s_step == 4}) {disp${stat.index}.innerHTML = '���ۿϷ�<br><button onclick="decide(${stat.index })">����Ȯ��</button>'}
			if (${sale.s_step == 5}) {disp${stat.index}.innerHTML = '����Ȯ��<br><button onclick="return1(${stat.index })">��ǰ/ȯ�ҽ�û</button>'}
			if (${sale.s_step == 6}) {disp${stat.index}.innerHTML = '�ֹ���ҽ�û'}
			if (${sale.s_step == 7}) {disp${stat.index}.innerHTML = '�ֹ����'}
			if (${sale.s_step == 8}) {disp${stat.index}.innerHTML = '��ǰ/ȯ�ҽ�û'}
			if (${sale.s_step == 9}) {disp${stat.index}.innerHTML = '��ǰ/ȯ�ҿϷ�'}
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
										<button onclick="javascript:comments(${saleItem.item.i_no});">�����ı��ۼ�</button>
									</c:if></td>
							</tr>
							<tr>
								<td>${saleItem.item.i_price * saleItem.quantity }�� | <fmt:formatDate
										value="${sale.s_updateTime}" pattern="YYYY.MM.dd" /></td>
								<td style="text-align: right;">���� : ${saleItem.quantity } |
									���� ���� : ${saleItem.item.i_price } ��</td>
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