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
		count.value = y+1;;
		total.value = ${item.i_price} * parseInt(count.value);
		event.preventDefault();
	})
	$("#down_button").click(function(){
		var x = parseInt(count.value)
		if(x <= 0) {
			x = 1
		}
		count.value = x-1;
		total.value = ${item.i_price} * parseInt(count.value);
		event.preventDefault()
	})
	$("#cartgo").click(function() {
		var checkAnswer = confirm("��ٱ��Ͽ� ��ҽ��ϴ�.\n��ٱ��� ȭ������ �̵� �Ͻðڽ��ϱ�?");
		location.href='../cart/cartAdd.sdj?no=${item.i_no}&quantity='+count.value+"&checkAS="+checkAnswer;
		event.preventDefault();
	})
	$("#editgo").click(function() {
		location.href='../item/edit.sdj?no=${item.i_no}';
		event.preventDefault();
	})
	
})
	function change() {
		var z = parseInt(count.value)
		if(z < 0) {
			count.value = 0;
		}
		total.value = ${item.i_price} * parseInt(count.value);
	}
	function checkConfirm() {
		if(confirm("���� ���� �Ͻðڽ��ϱ�??")) {
			location.href='delete.sdj?no=${item.i_no}';
		}
	}
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
  .invisible {
        clear: none;
        border: 0px none;
        float: none;
        background-color: #ffffff;
  }
</style>
</head>
<body>
<h2>��ǰ �� ����</h2>
<div>
  <!-- <span style="hight:282px; width:302px; float:left;"> -->
  <span style="hight:282px; width:30%; float:left;">
    <img hight="100%" width="100%" src="../picture/${item.i_img }">
  </span>
  <span style="hight:450px; width:40%; float:left;">
  <form action="buy.sdj" method="post">
    <table height="100%" width="100%" cellpadding="2" cellspacing="2">
      <tr><td>�帣</td><td align="right">${item.tp_name }</td></tr>
      <tr><td>�ǸŰ�</td><td align="right"><fmt:formatNumber type="currency" value="${item.i_price }" pattern="0,000" var="i_price" />${i_price }��</td></tr>
      <tr><td>��������</td><td align="right">������ : <fmt:parseNumber integerOnly="true" value="${item.i_price*0.01 }"/>��</td></tr>
      <tr><td>�����ο�</td><td align="right">${item.i_people } ~ ${item.i_people2 }��</td></tr>
      <tr><td>���ӿ���</td><td align="right">${item.i_age }�� �̻�</td></tr>
      <tr><td colspan="2">
      <div>
      
      <input type="hidden" value="${item.i_no }">
      <span><strong>����:</strong></span>
      <span><input id="count" type="text" align="middle" value="1" name="quantity" onchange="javascript:change();">
        <span>
          <button id="up_button" class="up_button" ></button><button id="down_button" class="down_button"></button>
        </span>
      </span>&nbsp;&nbsp;
      <span class="total"><font style="font-size:20px;"><strong style="color:#ec187c;">
      <input type="text" class="invisible" value="${item.i_price }" id="total">
      </strong></font>��</span>
      </div></td></tr>
    </table>
    <div align="right">
        <input type="submit" value="�����ϱ�"><input type="submit" value="��ٱ��� ���" id="cartgo">
      </div>
    </form>
    <br>
    <input type="submit" value="��������" id="editgo">
    <input type="button" value="����" onclick="javascript:checkConfirm();">
  </span>
</div>
</body>
</html>