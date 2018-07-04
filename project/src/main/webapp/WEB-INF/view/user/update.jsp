<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���� ����</title>
</head>
<body>
<h2>����� ���� ����</h2>
<form:form modelAttribute="user" method="post" action="update.sdj">
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors }" var="error">
				<spring:message code="${error.code }"/>
			</c:forEach>
		</font>
	</spring:hasBindErrors>
	<table>
		<tr><td>���̵�</td><td><form:input path="m_id"/><font color="red"><form:errors path="m_id" readonly="true"/></font></td></tr>
		<tr><td>��й�ȣ</td><td><form:password path="m_passwd"/><font color="red"><form:errors path="m_passwd"/></font></td></tr>
		<tr><td>�̸�</td><td><form:input path="m_name"/><font color="red"><form:errors path="m_name"/></font></td></tr>
		<tr><td>�ּ�</td><td><form:input path="m_address"/><font color="red"><form:errors path="m_address"/></font></td></tr>
		<tr><td>��ȭ��ȣ</td><td><form:input path="m_phone"/><font color="red"><form:errors path="m_phone"/></font></td></tr>
		<tr><td>EMAIL</td><td><form:input path="m_email"/><font color="red"><form:errors path="m_email"/></font></td></tr>
		<tr><td>��ȣ�帣</td>
			<td>
			<select name="m_game">
				<option value="${user.m_game }">${likegame }</option>
				<c:forEach var="m" items="${gametype}">
					<c:if test="${m.get('tp_name') != likegame }">
			 		<option value="${m.get('tp_no')}">${m.get('tp_name')}</option>
			 		</c:if>
			 	</c:forEach>
			</select>
			</td>
		</tr>
		<tr><td colspan="2" align="center">
			<input type="submit" value="����">
			<input type="reset" value="�ʱ�ȭ"></td></tr>
	</table>
</form:form>
</body>
</html>