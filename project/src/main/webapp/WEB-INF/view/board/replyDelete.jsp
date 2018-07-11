<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SPRING 게시판 삭제</title>
</head>
<body>
	<form:form modelAttribute="board" name="f" method="post" action="r_delete.sdj">
		<input type="hidden" name="pageNum" value="${param.pageNum }"/>
		<input type="hidden" name="b_no" value="${param.b_no }"/>
		<table border="1" cellpadding="0" cellspacing="0">
		<tr><td>삭제하시겠습니까?</td></tr>
			<tr>
				<td colspan="2" align="center">
				<a href="javascript:document.f.submit()">[삭제]</a><a href="javascript:history.go(-1)">[뒤로가기]</a>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>