<%-- <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ����</title>
</head>
<body>
<h2>��ǰ ����</h2>
<form:form modelAttribute="item" action="update.sdj" enctype="multipart/form-data">
  <form:hidden path="i_no"/>
  <form:hidden path="i_img"/>
  <table>
    <tr><td>��ǰ��</td><td><form:input path="i_name"/></td>
      <td><font color="red"><form:errors path="i_name"/></font></td></tr>
    <tr><td>����</td><td><form:input path="i_price"/></td>
      <td><font color="red"><form:errors path="i_price"/></font></td></tr>
    <tr><td>��ǰ�̹���</td><td><input type="file" name="i_Img_File" /></td>
      <td>&nbsp;${item.i_img }</td></tr>
    <tr><td>��ǰ����</td><td><form:textarea path="i_explain" cols="30" rows="5"/></td>
      <td><font color="red"><form:errors path="i_explain" /></font></td></tr>
    <tr><td colspan="3"><input type="submit" value="����"/>
      <input type="button" value="��ǰ���" onclick="location.href='list.shop'">
    </td></tr>
  </table>
</form:form>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ���� ȭ��</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	
	var sel_file;

	$(document).ready(function() {
		$("#img_upload").on("change", handleImgsFilesSelect);
		
		$("select option[value='${item.it_no}']").attr("selected", true);
	});

	function handleImgsFilesSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("Ȯ���ڴ� �̹��� Ȯ���ڸ� ���� �մϴ�.")
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img_ex").attr("src", e.target.result)
			}
			reader.readAsDataURL(f);
		})
	}
</script>
</head>
<body>
	<div align="center">
		<form:form modelAttribute="item" action="update.sdj"
			enctype="multipart/form-data">
			<form:hidden path="i_no" />
			<form:hidden path="i_img" />
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td rowspan="5"><div>
							<img src="../picture/${item.i_img }" id="img_ex" width="100%"
								height="100%">
						</div></td>
					<td>���� �帣:</td>
					<td><select name="it_no">
							<option>�����ϼ���</option>
							<c:forEach var="m" items="${gametype }">
								<option value="${m.get('tp_no') }">${m.get('tp_name') }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>��ǰ�� :</td>
					<td><form:input path="i_name" maxlength="20" size="35" /> <font
						color="red"><form:errors path="i_name" /></font></td>
				</tr>
				<tr>
					<td>��ǰ���� :</td>
					<td><form:input path="i_price" maxlength="20" size="35" /> <font
						color="red"><form:errors path="i_price" /></font></td>
				</tr>
				<tr>
					<td>�ο� :</td>
					<td><form:input size="5" path="i_people" /> ~ <form:input
							size="5" path="i_people2" /></td>
				</tr>
				<tr>
					<td>���ɴ� :</td>
					<td><form:input size="15" path="i_age" />�� �̻�</td>
				</tr>
				<tr>
					<td colspan="3"><form:textarea path="i_explain"
							id="smarteditor" rows="10" cols="100"
							style="width:766px; height:412px;" /> <font color="red"><form:errors
								path="i_explain" /></font></td>
				</tr>
				<tr>
					<td colspan="3"><input type="file" id="img_upload"
						name="i_Img_File">${item.i_img }</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit" value="����"><input
						type="button" value="���"
						onclick="location.href='../item/list.sdj'"></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>