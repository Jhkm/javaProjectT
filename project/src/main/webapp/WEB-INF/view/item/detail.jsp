<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
  table {
    border-top:1;
    border-bottom:1;
  }
</style>
</head>
<body>
<h2>��ǰ �� ����</h2>
<div>
  <span>
    <img src="../picture/${item.i_img }">
  </span>
  <span>
    <table cellpadding="0" cellspacing="0">
      <tr><td>�帣</td><td>${item.tp_name }</td></tr>
      <tr><td>�ǸŰ�</td><td>${item.i_price }</td></tr>
      <tr><td>��������</td><td>������ : ${item.i_price*0.01 }</td></tr>
      <tr><td>�����ο�</td><td>${item.i_people }��</td></tr>
      <tr><td>���ӿ���</td><td>${item.i_age }�� �̻�</td></tr>
    </table>
  </span>
</div>
</body>
</html>