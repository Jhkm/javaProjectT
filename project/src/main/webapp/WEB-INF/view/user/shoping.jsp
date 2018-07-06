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
function list_disp(id) {
	var disp = document.getElementById(id);
	if(disp.style.display == 'block') {
		disp.style.display = 'none';
	} else {
		disp.style.display = 'block';
	}
}
</script>
</head>
<body>
<div id="oinfo" style="display:block; width:100%;">
	<table border="1" width="100%">
		<tr><td colspan="3">�ֹ����</td></tr>
		<tr><td>�ֹ���ȣ</td><td>�ֹ�����</td><td>�ֹ��ݾ�</td></tr>
		<c:forEach items="${salelist }" var="sale" varStatus="stat">
			<tr><td align="center">
				<a href="javascript:list_disp('saleLine${stat.index }')">${sale.s_id }</a></td>
				<td><fmt:formatDate value="${sale.s_updateTime }" pattern="yyyy-MM-dd"/></td>
				<td>${sale.amount }</td></tr>
				<tr><td colspan="3" align="center">
					<div id="saleLine${stat.index }">
						<table border="1" width="90%">
						<tr><th width="25%">��ǰ��</th>
              <th width="25%">��ǰ����</th>
              <th width="25%">����</th>
              <th width="25%">�����հ�</th></tr>
              <c:forEach items="${sale.saleItemList }" var="saleItem">
                <tr><td>${saleItem.item.i_name }</td>
                <td>${saleItem.item.i_price }</td>
                <td>${saleItem.quantity }</td>
                <td>${saleItem.quantity * saleItem.item.i_price}</td>
                </tr>
              </c:forEach>
            </table></div></td></tr>
    </c:forEach>
  </table>
</div>
</body>
</html>