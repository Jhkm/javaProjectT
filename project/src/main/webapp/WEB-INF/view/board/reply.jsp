<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<%-- /WebContent/model1/board/replyForm.jsp
	1. ������ ���� : num, ref, reflevel, refstep
	2. �亯�۷� �Է� �� ���� 
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�亯�� �ۼ�</title>
</head>
<body>
	<form:form action="reply.sdj" method="post" name="f" modelAttribute="board">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="b_no" value="${board.b_no }">
		<input type="hidden" name="ref" value="${board.b_ref }">
		<input type="hidden" name="reflevel" value="${board.b_reflevel }">
		<input type="hidden" name="refstep" value="${board.b_refstep }">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="2"> SPRING �亯�� </td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" name="subject" value="Re:${board.b_subject }"/>
					<font color="red"><form:errors path="b_subject"/></font></td>
			</tr>
			<tr>
				<td align="center">����</td>
				<td><textarea rows="15" cols="80" name="b_content"></textarea>
					<font color="red"><form:errors path="b_content"/></font></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<a href="javascript:document.f.submit()">[�亯���]</a>
					<a href="javascript:document.f.reset()">[�ٽ��ۼ�]</a>
					<a href="javascript:history.go(-1)">[�ڷΰ���]</a>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>