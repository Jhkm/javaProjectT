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
	function submitAll() {
		document.f.submit();
		alert('�ı⸦ ����Ͽ����ϴ�.');
	}
</script>
</head>
<body>
<h3>�����ı� �ۼ�</h3>
<div>
<table width="80%">
<tr><td align="left" width="140"><img alt="��ǰ �̹���" src="../picture/${item.i_img }" width="120" height="100"></td><td>${item.i_name }</td></tr>
</table>
</div>
<form:form modelAttribute="board" action="purchaseComments.sdj" method="post" name="f">
	<input type="radio" value="1" name="i_grade">1�� 
	<input type="radio" value="2" name="i_grade">2�� 
	<input type="radio" value="3" name="i_grade">3�� 
	<input type="radio" value="4" name="i_grade">4�� 
	<input type="radio" value="5" name="i_grade">5��
	<input type="hidden" name="m_id" value="${sessionScope.loginUser }">
	<input type="hidden" name="i_no" value="${item.i_no }">
	<input type="hidden" name="b_category" value="10">
	<textarea rows="8" cols="55" name="b_content"></textarea>
	<input type="button" value="���" onclick="submitAll()">
</form:form>
</body>
</html>