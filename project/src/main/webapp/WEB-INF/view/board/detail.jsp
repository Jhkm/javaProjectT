<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<%-- /WebContent/model2/board/info.jsp 
	1. action Ŭ���� �ۼ�
	2. info.jsp �����ϱ� (el, jstl)
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� �� ����</title>
</head>
<body>
	<table align="center" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" align="center">SPRING �Խ���</td>
		</tr>
		<tr>
			<td>�۾���</td>
			<td>${board.g_id}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${board.b_subject}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>
				<table border="0" width = "400" height="250">
					<tr>
						<td>${board.b_content }</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>÷������</td>
			<td>&nbsp;
				<c:if test="${!empty board.b_fileurl }">
					<a href="../file/${board.b_fileurl }">${board.b_fileurl }</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[�亯]</a>
				<a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
				<a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
				<a href="list.sdj?pageNum=${param.pageNum }&b_category=${param.b_category}">[���]</a>
			</td>
		</tr>
	</table>
</body>
</html>