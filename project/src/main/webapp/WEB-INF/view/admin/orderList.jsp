<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� �ֹ� ���</title>
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
	<tr><td>������ ��¥</td><td>������ ID</td><td>����� �ּ�</td><td>�����Ȳ</td></tr>
	<c:forEach items="${saleList}" var="sale" varStatus="stat">
		<input type="hidden" value="${sale.s_id }" id="sid${stat.index }">
		<tr><td><fmt:formatDate value="${sale.s_updateTime}" pattern="YYYY.MM.dd HH:mm:ss"/></td><td>${sale.m_id }</td><td>${sale.address }</td>
		<td style="text-align:center;">
		<c:if test="${!((sale.s_step == 7)  || (sale.s_step == 9))}">
			<select id="stage${stat.index}">
				<option value="1" disabled="disabled">�ֹ�����</option>
				<option value="2">�����غ���</option>
				<option value="3">�����</option>
				<option value="4">��ۿϷ�</option>
				<option value="5" disabled="disabled">����Ȯ��</option>
				<option value="6" disabled="disabled">�ֹ���ҽ�û</option>
				<option value="7">�ֹ����</option>
				<option value="8" disabled="disabled">��ǰ/ȯ�ҽ�û</option>
				<option value="9">��ǰ/ȯ�ҿϷ�</option>
			</select></c:if><br>
			<script type="text/javascript">
			stage${stat.index}.value = '${sale.s_step}'
			</script>
			���� : <div style="display:inline;" id="disp${stat.index}"></div>
			<script type="text/javascript">
			if (${sale.s_step == 1}) {disp${stat.index}.innerHTML = '�ֹ�����'}
			if (${sale.s_step == 2}) {disp${stat.index}.innerHTML = '�����غ���'}
			if (${sale.s_step == 3}) {disp${stat.index}.innerHTML = '�����'}
			if (${sale.s_step == 4}) {disp${stat.index}.innerHTML = '���ۿϷ�'}
			if (${sale.s_step == 5}) {disp${stat.index}.innerHTML = '����Ȯ��'}
			if (${sale.s_step == 6}) {disp${stat.index}.innerHTML = '�ֹ���ҽ�û'}
			if (${sale.s_step == 7}) {disp${stat.index}.innerHTML = '�ֹ����'}
			if (${sale.s_step == 8}) {disp${stat.index}.innerHTML = '��ǰ/ȯ�ҽ�û'}
			if (${sale.s_step == 9}) {disp${stat.index}.innerHTML = '��ǰ/ȯ�ҿϷ�'}
		    </script>
		<br><c:if test="${!((sale.s_step == 7) || (sale.s_step == 9))}"><button class="progress" value="${stat.index}">����</button></c:if></td></tr>
		<tr><td colspan="4">
			<table width="100%">
			<c:set var="tot" value="0"/>
			<c:forEach items="${sale.saleItemList }" var="saleItem">
				<tr><td rowspan="2"><img src="../picture/${saleItem.item.i_img }" width="100" height="100"></td><td colspan="2"><h4>${saleItem.item.i_name }</h4></td></tr>
				<tr><td>${saleItem.item.i_price * saleItem.quantity } �� | <fmt:formatDate value="${sale.s_updateTime}" pattern="YYYY.MM.dd"/></td><td style="text-align:right;">���� : ${saleItem.quantity } | ���� ���� : ${saleItem.item.i_price } ��</td></tr>
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