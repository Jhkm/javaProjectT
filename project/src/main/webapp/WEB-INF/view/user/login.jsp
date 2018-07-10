<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>로그인</title>
</head>
<body class="w3-container">
<h2>로그인</h2>
<form:form modelAttribute="user" method="post" action="login.sdj">
	<form:hidden path="m_name" value="의미없음" />
	<spring:hasBindErrors name="user">
		<font color="red">
			<c:forEach items="${errors.globalErrors }" var="error">
				<spring:message code="${error.code }" />
			</c:forEach>
		</font>
	</spring:hasBindErrors>
		<div class="w3-row-padding" style="margin:24 24px;">
			<label>ID</label>
			<form:input class="w3-input w3-border" path="m_id" />
			<font color="red"><form:errors path="m_id"/></font>
		</div>
		<div class="w3-row-padding" style="margin:24 24px;">
			<label>Password</label>
			<form:password class="w3-input w3-border" path="m_passwd" />
			<font color="red"><form:errors path="m_passwd"/></font>
		</div>
		<div class="w3-row-padding" style="margin:24 24px;">
			<input class="w3-button w3-teal w3-center"  type="submit" value="로그인">
			<input class="w3-button w3-teal w3-center"  type="button" value="회원가입" onclick="location.href='userForm.sdj'">
		</div>
</form:form>
</body>
</html>