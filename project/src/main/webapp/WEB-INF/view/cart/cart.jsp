<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ٱ���</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
  function change(no) {
	  window.open("../cart/countUpdate.sdj?no="+no,"���� ����","location=yes, menubar=no, titlebar=no, toolbar=no, width=500, height=380");
	  location.href="rediract:cart.sdj"
  }
  $(document).ready(function(){
	  var value = 0;
	  $(".buycheck:checked").each(function(){
		  value += parseInt($(this).val());
	  })
	  $("#tot").val(value);
	  
	  $(".buycheck").change(function(){
		  value = 0;
		  $(".buycheck:checked").each(function(){
			  value += parseInt($(this).val());
		  })
		  $("#tot").val(value);
	  })
  })
</script>
<style type="text/css">
.button {
	font-size: 12px;
	height: 25px;
	width: 40px;
}

table {
	text-align: center;
}
</style>
</head>
<body>
	<h2>��ٱ���</h2>
	<form action="checkout.sdj" method="post" name="cartform">
		<table width="70%">
			<tr>
				<td>����</td>
				<td>��ǰ����</td>
				<td>������</td>
				<td>�ǸŰ�</td>
				<td>����</td>
				<td>�հ�</td>
			</tr>
			<c:set var="tot" value="${0}" />
			<c:forEach items="${cart.itemList }" var="itemSet" varStatus="stat">
				<%--  ${itemSet.quantity * itemSet.item.i_price } --%>
				<tr>
					<td><input type="checkbox" class="buycheck"
						value="${itemSet.quantity *itemSet.item.i_price },${itemSet.item.i_no}"
						name="itemcheck"> <img
						src="../picture/${itemSet.item.i_img }" width="80" height="80"></td>
					<td>${itemSet.item.i_name }</td>
					<td>${itemSet.item.i_price*0.01 }</td>
					<td>${itemSet.item.i_price }��</td>
					<td>${itemSet.quantity }
						<div>
							<input type="button"
								onclick="javascript:change(${itemSet.item.i_no});" value="����"
								class="button" align="middle">
						</div>
					</td>
					<td>${itemSet.quantity * itemSet.item.i_price }��&nbsp;<a
						href="cartDelete.sdj?index=${stat.index }">��</a></td>
				</tr>
				<c:set var="tot"
					value="${tot+(itemSet.quantity * itemSet.item.i_price) }" />
			</c:forEach>
			<script type="text/javascript">
		$(".buycheck").attr("checked",true);
	</script>
			<tr>
				<td colspan="6" align="right"><font color="green"><input
						type="text"
						style="border: none; background: transparent; color: green;"
						id="tot" value="${tot}">��</font></td>
			</tr>
		</table>
		<br>${message }<br>
		<a href="../item/list.sdj">��ǰ���</a> <a
			href="javascript:document.cartform.submit()">�ֹ��ϱ�</a>
	</form>
</body>
</html>