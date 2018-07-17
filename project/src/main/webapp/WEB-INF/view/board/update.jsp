<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%--
	/WebContent/model1/board/updateForm.jsp
	1. num �Ķ���Ϳ� �ش��ϴ� �Խù��� DB���� ��ȸ�Ͽ� Board ��ü ����
	2. Board ��ü�� ������ ȭ�鿡 ����ϱ�
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SPRING �Խ���</title>
<script type="text/javascript">
	function file_delete(){
		document.f.file2.value="";
		file_desc.style.display = "none"; //������ �ʵ��� style�Ӽ� ����
	}
</script>
</head>

<body>
	<form:form modelAttribute="board" action="update.sdj" method="post"
		enctype="multipart/form-data" name="f">
		<%--
			file2 : file�� ������ �����ϴ� �Ķ����
		--%>
		<input type="hidden" name="b_no" value="${board.b_no }">
		<input type="hidden" name="file2" value="${board.b_fileurl }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<table border="1" cellpadding="0" cellspacing="0">
			<caption>SPRING �Խ���</caption>
			<tr>
				<td align="center">����</td>
				<td><form:input path="b_subject" /> <font color="red"><form:errors
							path="b_subject" /></font></td>
			</tr>
			<tr>
				<td align="center">����</td>
				<td><textarea rows="15" cols="80" name="b_content">${board.b_content }</textarea></td>
			</tr>
			<tr>
				<td align="center">÷������</td>
				<td><c:if test="${!empty board.b_fileurl }">
						<div id="file_desc">
							<a href="file/${board.b_fileurl }">${board.b_fileurl }</a>. <a
								href="javascript:file_delete()">[÷������ ����]</a>
						</div>
					</c:if> <input type="file" name="b_file"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><a
					href="javascript:document.f.submit()">[�Խ��Ǽ���]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>