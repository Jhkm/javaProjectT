<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ֹ� Ȯ�� ��ǰ</title>
<style type="text/css">
  table { width : 90%; border-collapse: collapse;}
  th, td { border : 3px solid #bcbcbc; text-align:center; padding:8px;}
  th {background-color: #4CAF50; color:white; text-align:center;}
  td { background-color: #f2f2f2;}
  td.title {background-color: #e2e2e2; color:blue;}
</style>
</head>
<body>
<h2>${loginUser1.m_name }���� �ֹ� �Ͻ� ���� �Դϴ�.</h2>
<h2>��� ���� ����</h2>
<table>
  <tr><td width="30%" class="title">������ID</td>
  <td width="70%">${loginUser1.m_id }</td></tr>
  <tr><td width="30%" class="title">�̸�</td>
  <td width="70%">${loginUser1.m_name }</td></tr>
  <tr><td width="30%" class="title">�ּ�</td>
  <td width="70%">${loginUser1.m_address }</td></tr>
  <tr><td width="30%" class="title">��ȭ��ȣ</td>
  <td width="70%">${loginUser1.m_phone }</td></tr>
  <tr><td width="30%" class="title">�̸���</td>
  <td width="70%">${loginUser1.m_email }</td></tr>
  <tr><td width="30%" class="title">���ϸ���</td>
  <td width="70%">${loginUser1.m_mileage }</td></tr>
  <tr><td width="30%" class="title">��۹��� �ּ���</td>
  <td width="70%">${sale.address }</td></tr>
</table><br><br>
<h2>�ֹ� �Ϸ� ��ǰ ���</h2>
<table>
  <tr><th>��ǰ��</th><th>��ǰ����</th><th>����</th><th>��ǰ�հ�</th></tr>
  <c:forEach items="${sale.saleItemList }" var="saleItem">
  <tr><td>${saleItem.item.i_name }</td><td>${saleItem.item.i_price } ��</td>
      <td>${saleItem.quantity }��</td>
      <td>${saleItem.quantity * saleItem.item.i_price }</td></tr>
  </c:forEach>
  <tr><td colspan="4" style="text-align:right;">�ѱݾ� : 
    <fmt:formatNumber value="${totalAmount }" pattern="#,###"/>��</td></tr>
  <tr><td colspan="4">
    <a href="../item/list.sdj">��ǰ���</a></td></tr>
</table>
</body>
</html>