<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ��� �۵��</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> -->
</head>
<body>
	<form:form modelAttribute="board" action="write.sdj" method="post" enctype="multipart/form-data" name="f">
		<table border="1" cellpadding="0" cellspacing="0">
			<caption>�Խ���</caption>
	
				<tr>
					<td align="center">����</td>
					<td><form:input path="b_subject"/>
						<font color="red"><form:errors path="b_subject"/></font></td>
				</tr>
				<tr>
					<td align="center">����</td>
					<td><form:textarea rows="15" cols="80" path="b_content"/>
						<font color="red"><form:errors path="b_content"/></font></td>
				</tr>
				<tr>
					<td align="center">÷������</td>
					<td><input type="file" name="b_file" id="b_file" multiple></td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_category" value="${param.b_category }"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_state" value="0"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_date" value="0"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_people" value="0"></td>
				</tr>
				<tr>
				<c:if test="${param.i_no == null}">
					<td><input type="hidden" name="i_no" value="0"></td>
				</c:if>
				<c:if test="${param.i_no != null}">
					<td><input type="hidden" name="i_no" value="${param.i_no}"></td>
				</c:if>
				<tr>
					<td align="center" colspan="2"><a href="javascript:document.f.submit()">[�Խù����]</a>
					<a href="list.sdj">[�Խù����]</a></td>
				</tr>
		</table>
	<div id="preview">
	</div>
	</form:form>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�Խù� �ۼ�</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
<script src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
<style>
.ui-timepicker { font-size: 6px; width: 200px; }
</style>  
<script>

	$(function() {
		$("#datepicker1").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					prevText : '���� ��',
					nextText : '���� ��',
					monthNames : [ '1��', '2��', '3��', '4��', '5��', '6��', '7��',
							'8��', '9��', '10��', '11��', '12��' ],
					monthNamesShort : [ '1��', '2��', '3��', '4��', '5��', '6��',
							'7��', '8��', '9��', '10��', '11��', '12��' ],
					dayNames : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesShort : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
					showMonthAfterYear : true,
					changeMonth : true,
					changeYear : true,
					yearSuffix : '��'
				});
	});
	$(function() {
		$('.timepicker').timepicker();
	});
</script>
</head>
<body>
<div style="max-width: 70%;">
	<div class="w3-container" align="center">
		<label>���ۼ��ϱ�</label>
	</div>
	<form:form modelAttribute="board" action="write.sdj" method="post" enctype="multipart/form-data" name="f" >
	<div class="w3-cell-row" >
		<div class="w3-container w3-teal w3-cell" style="width: 20%;">
			<label>����</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<form:input class="w3-input w3-sand" path="b_subject" />
			<font color="red"><form:errors path="b_subject"/></font>
		</div>
	</div>
	<!-- ���� �Խ����� ��� -->
	<c:if test="${param.b_category == '5'}">
	<div class="w3-cell-row" >
		<div class="w3-container w3-teal w3-cell" style="width: 20%;">
			<label>��¥</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<form:input type="text" id="datepicker1" path="b_date"/>
			<input type="text" id="b_date" name="b_date" class='timepicker'>
		</div>
	</div>
	<div class="w3-cell-row" >
		<div class="w3-container w3-teal w3-cell" style="width: 20%;">
			<label>�ο�</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<form:input path="b_people" />
			<font color="red"><form:errors path="b_people"/></font>
		</div>
	</div>
	<div class="w3-cell-row" >
		<div class="w3-container w3-teal w3-cell" style="width: 20%;">
			<label>���</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<form:input  path="b_state" />
			<font color="red"><form:errors path="b_state"/></font>
		</div>
	</div>
	<div class="w3-cell-row" style="display: none;">
		<div class="w3-container w3-teal w3-cell" style="width: 20%;">
			<label>123</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<div id="map" style="width:500px;height:400px;"></div>
		</div>
	</div>
	<input type="hidden" name="g_id" value="${session.loginUser}">
	</c:if>
	<c:if test="${param.b_category != '5'}">
		<input type="hidden" name="b_state" value="0">
		<input type="hidden" name="b_date" value="0">
		<input type="hidden" name="b_people" value="0">
	</c:if>
	<div class="w3-cell-row" >
		<div class="w3-container w3-teal w3-cell" style="width: 20%;">
			<label>����</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<form:textarea rows="15" cols="80" path="b_content"/>
						<font color="red"><form:errors path="b_content"/></font>
		</div>
	</div>
	<div class="w3-cell-row" >
		<div class="w3-container w3-teal w3-cell" style="width: 20%;">
			<label>÷������</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<input type="file" name="b_file" id="b_file" multiple>
		</div>
	</div>
	<input type="hidden" name="b_category" value="${param.b_category }">
	<c:if test="${param.i_no == null}">
		<input type="hidden" name="i_no" value="0">
	</c:if>
	<c:if test="${param.i_no != null}">
		<input type="hidden" name="i_no" value="${param.i_no}">
	</c:if>
	<div class="w3-cell-row">
		<a href="javascript:document.f.submit()">[�Խù� ���]</a>
		<a href="list.sdj">[�Խù� ���]</a>
	</div>
	<div class="w3-cell-row" id="preview">
	</div>
	</form:form>
</div>
</body>
</html>