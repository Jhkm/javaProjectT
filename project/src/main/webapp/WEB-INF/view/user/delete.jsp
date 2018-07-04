<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 탈퇴</title>
</head>
<body>
<h2>회원 탈퇴</h2>
<form:form modelAttribute="user" method="post" action="delete.sdj">
   <form:hidden path="m_name"  value="의미없음"/>
   <spring:hasBindErrors name="user">
      <font color="red">
         <c:forEach items="${errors.globalErrors }" var="error">
            <spring:message code="${error.code }" />
         </c:forEach>
      </font>
   </spring:hasBindErrors>
   <table>
		<tr><td>아이디</td><td><form:input path="m_id"/>
			<font color="red"><form:errors path="m_id" readonly="true"/></font></td></tr>
		<tr><td>비밀번호</td><td><form:password path="m_passwd"/><font color="red"><form:errors path="m_passwd"/></font></td></tr>
      <tr><td colspan="2" align="center">
      <input type="submit" value="회원탈퇴"></td></tr>
   </table>
</form:form>
</body>
</html>