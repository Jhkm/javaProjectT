<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ���</title>
<style type="text/css">
  div ul { padding-top:10px; list-style-type: none; overflow: auto; }
  div ul li {
    float: left;
    display:inline;
    padding:0 10px;
  }
</style>
</head>
<body>
<a href="create.sdj">��ǰ���</a>
<a href="../cart/cartView.sdj" style="float:right;">��ٱ���</a>
<table border="1" cellspacing="0" cellpadding="0">
  <tr><th align="center" width="80">��ǰID</th>
      <th align="center" width="320">��ǰ��</th>
      <th align="center" width="100">����</th>
      <th align="center" width="80">����</th>
      <th align="center" width="80">����</th>
  </tr>
  <c:forEach items="${itemList }" var="item">
    <tr><td align="center">${item.i_no }</td>
        <td align="left">
        <a href="detail.sdj?no=${item.i_no }">${item.i_name }</a></td>
        <td align="right"><fmt:formatNumber type="CURRENCY" currencySymbol="" value="${item.i_price }"/>��</td>
        <td align="center"><a href="edit.sdj?no=${item.i_no }">����</a></td>
        <td align="center"><a href="confirm.sdj?no=${item.i_no }">����</a></td>
    </tr>
  </c:forEach>
</table>
<div>
  <ul>
    <c:forEach var="item" items="${itemList }">
      <li style="width:25%">
      <div style="width:182px;">
        <div>
          <a href="detail.sdj?no=${item.i_no }">
            <img src="../picture/${item.i_img }" height="250" width="180">
          </a>
        </div>
        <div>
          <a href="detail.sdj?no=${item.i_no }">${item.i_name }</a>
        </div>
        <br>
        <div>
          <strong><font color="#ec187c"><fmt:formatNumber type="CURRENCY" currencySymbol="" value="${item.i_price }"/></font><strong>��
        </div>
      </div>
      </li>
    </c:forEach>
  </ul>
</div>
</body>
</html>