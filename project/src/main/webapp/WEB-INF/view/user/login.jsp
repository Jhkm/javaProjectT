<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
</head>
<body>
<h2>�α���</h2>
<form:form modelAttribute="user" method="post" action="login.sdj">
	<form:hidden path="m_name" value="�ǹ̾���" />
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors }" var="error">
				<spring:message code="${error.code }" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table>
		<tr><td>���̵�</td><td><form:input path="m_id" />
			<font color="red"><form:errors path="m_id"/></font></td></tr>
		<tr><td>��й�ȣ</td><td><form:password path="m_passwd" />
			<font color="red"><form:errors path="m_passwd"/></font></td></tr>
		<tr><td colspan="2" align="center">
			<input type="submit" value="�α���">
			<input type="button" value="ȸ������" onclick="location.href='userForm.sdj'"></td></tr>
	</table>
</form:form>
</body>
</html>