<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 탈퇴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#radio1').click(function(){
			var radioval = $(this).val();
			console.log(radioval);
			alert('Y 선택해쏘요');
			request.session.setAttribute("check");
		})
	})
</script>

</head>
<body class="w3-content" style="max-width: 300px">
<div class="w3- row" id="contact" align="center" style="max-width:30%">
	<div class="w3- padding-large">
	<h2>회원 탈퇴</h2>
		<form:form modelAttribute="user" method="post" action="delete.sdj" 
			class="w3-container w3-card w3-padding-32 w3-white">
		   	<form:hidden path="m_name"  value="의미없음"/>
		   	<spring:hasBindErrors name="user">
		    	<font color="red">
		        <c:forEach items="${errors.globalErrors }" var="error">
		        	<spring:message code="${error.code }" />
		        </c:forEach>
		      </font>
		   	</spring:hasBindErrors>
			<div class="w3-section">
		   		<label><font color="red">탈퇴를 원하시면 비밀번호를 입력하세요</font></label>
		   	</div>
			<div class="w3-section">
		   		<label>ID</label>
		   		<form:input  class="w3-input" path="m_id"/>
				<font color="red"><form:errors path="m_id"  readonly="true"/></font>
		   	</div>
			<div class="w3-section">
				<label>Password</label>
				<form:password class="w3-input" path="m_passwd"/>
				<font color="red"><form:errors path="m_passwd"/></font>
			</div>
			<button type="submit" class="w3-button w3-teal w3-right">회원탈퇴</button>
			<a class="w3-button w3-teal w3-right" href="javascript:history.go(-1)">돌아가기</a>  	
		   
		</form:form>
	</div>
</div>
</body>
</html>